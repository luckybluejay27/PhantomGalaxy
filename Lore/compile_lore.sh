#!/bin/bash

# Exit on error, unset variable usage, or pipe failures
set -euo pipefail

# Configuration
OUTPUT_DIR="$HOME/Downloads/build_output"
MAIN_FONT="Charis SIL"

# Create output folder if it doesn't already exist
mkdir -p "$OUTPUT_DIR"

# Create isolated temporary directory with automatic exit cleanup
TMP_DIR=$(mktemp -d)
trap 'rm -rf "$TMP_DIR"' EXIT

# Preprocessing function to clear out YAML headers and fix triple hyphens
clean_markdown() {
    local input_file="$1"
    awk '
        # 1. First line entering YAML frontmatter (allowing trailing spaces)
        NR == 1 && /^[[:space:]]*---[[:space:]]*$/ {in_yaml=1; next}

        # 2. Exiting YAML frontmatter
        in_yaml && /^[[:space:]]*---[[:space:]]*$/ {in_yaml=0; next}

        # 3. Inside YAML, skip line
        in_yaml {next}

        # 4. Otherwise, print
        {print}
    ' "$input_file" | \
    perl -CSD -pe 's/[\x{1F300}-\x{1F6FF}\x{1F900}-\x{1F9FF}\x{2600}-\x{27BF}]//g' | \
    sed 's/^---$/\n---\n/'
}

# Unified compilation engine function using HTML -> PDF
compile_to_pdf() {
    local source_md="$1"
    local output_pdf="$2"
    local temp_html="$TMP_DIR/working_doc.html"

    # 1. Convert Markdown to intermediary HTML file
    pandoc "$source_md" -f markdown -t html5 -s \
        -M metadata-title="Lore Export" \
        --metadata pagetitle="Lore Export" \
        -V header-includes="<style>body, pre, code { font-family: '$MAIN_FONT', monospace !important; }</style>" \
        -o "$temp_html"

    # 2. Render HTML directly to PDF using Webkit
    wkhtmltopdf --quiet --encoding utf-8 \
        --margin-top 20mm --margin-bottom 20mm --margin-left 20mm --margin-right 20mm \
        "$temp_html" "$output_pdf"
}

echo "Starting rigorous Webkit compilation pipeline..."

# 1. Timeline Silo PDF
echo "Processing Timeline Silo..."
timeline_file=$(find . -maxdepth 1 -iname "*interstellar*timeline*.md" -print -quit)

if [ -n "$timeline_file" ]; then
    echo "-> Found timeline file: $timeline_file"
    cleaned_timeline="$TMP_DIR/timeline_cleaned.md"
    clean_markdown "$timeline_file" > "$cleaned_timeline"
    compile_to_pdf "$cleaned_timeline" "$OUTPUT_DIR/Interstellar_Timeline.pdf"
else
    echo "Warning: Interstellar Timeline markdown file not found."
fi

# 2. Ship Technology Folder PDF
echo "Processing Ship Technology..."
if [ -d "Ship Technology" ]; then
    tmp_ship_md="$TMP_DIR/ship_tech_combined.md"
    > "$tmp_ship_md"

    find "Ship Technology" -type f -name "*.md" -not -name "*task list*" | sort | while read -r file; do
        doc_title=$(basename "$file" .md | tr '_' ' ' | sed -e 's/\b\(.\)/\u\1/g')
        echo -e "\n\n# $doc_title\n" >> "$tmp_ship_md"
        clean_markdown "$file" >> "$tmp_ship_md"
    done

    compile_to_pdf "$tmp_ship_md" "$OUTPUT_DIR/Ship_Tech.pdf"
fi

# 3. Factions and Adjacent Folder
echo "Processing Factions and Adjacent..."
if [ -d "Factions and Adjacent" ]; then
    for group_dir in "Factions and Adjacent"/*; do
        if [ -d "$group_dir" ]; then
            group_name=$(basename "$group_dir")
            echo "-> Compiling group: $group_name"

            tmp_factions_md="$TMP_DIR/${group_name}_combined.md"
            > "$tmp_factions_md"

            find "$group_dir" -type f -name "*.md" -not -name "*task list*" | sort | while read -r file; do
                doc_title=$(basename "$file" .md | tr '_' ' ' | sed -e 's/\b\(.\)/\u\1/g')
                echo -e "\n\n# $doc_title\n" >> "$tmp_factions_md"
                clean_markdown "$file" >> "$tmp_factions_md"
            done

            compile_to_pdf "$tmp_factions_md" "$OUTPUT_DIR/${group_name}.pdf"
        fi
    done
fi

echo "Pipeline finished completely! Check your output: $OUTPUT_DIR"
