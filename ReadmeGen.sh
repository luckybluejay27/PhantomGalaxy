#!/bin/bash

# Output file
OUTPUT_FILE="README.md"

# Header for the README
echo "# Phantom Galaxy Documentation" > $OUTPUT_FILE
echo "" >> $OUTPUT_FILE
echo "Explore the lore of Phantom Galaxy by following the links below:" >> $OUTPUT_FILE
echo "" >> $OUTPUT_FILE

# Function to recursively navigate folders and generate links
generate_links() {
  local folder_path="$1"
  local indent="$2"

  for item in "$folder_path"/*; do
    if [ -d "$item" ]; then
      folder_name=$(basename "$item")
      echo "${indent}- **$folder_name**" >> $OUTPUT_FILE
      generate_links "$item" "  $indent"
    elif [[ "$item" == *.md ]]; then
      file_name=$(basename "$item")
      link_name="${file_name%.*}"

      # Relative path formatting for Obsidian
      relative_path="./${item#./}"

      # URL encode spaces and special characters
      relative_path=$(echo "$relative_path" | sed 's/ /%20/g')

      # Create the Obsidian-friendly link
      echo "${indent}- [[$link_name]]" >> $OUTPUT_FILE
    fi
  done
}

# Start generating links from the root
generate_links "." ""

# Final message
echo "" >> $OUTPUT_FILE
echo "Documentation generated automatically on $(date)" >> $OUTPUT_FILE

# Success message
echo "README.md has been updated successfully!"
