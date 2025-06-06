#!/bin/bash

# Backlink content to be inserted
BACKLINK="[← Return to Phantom Galaxy README](https://github.com/luckybluejay27/PhantomGalaxy/blob/main/README.md)"

# Log counters
success=0
skip=0
fail=0

# Traverse all markdown files without losing variable state
while IFS= read -r -d '' file; do
    if grep -Fxq "$BACKLINK" "$file"; then
        echo "[SKIP] $file already contains backlink"
        ((skip++))
    else
        tmpfile=$(mktemp)
        {
            echo "$BACKLINK"
            echo ""
            cat "$file"
        } > "$tmpfile"

        if mv "$tmpfile" "$file"; then
            echo "[ADDED] $file"
            ((success++))
        else
            echo "[FAIL] Could not update $file"
            ((fail++))
        fi
    fi
done < <(find . -type f -name "*.md" -print0)


# Summary
echo
echo "✅ Backlinking complete."
echo "  Added: $success"
echo "  Skipped: $skip"
echo "  Failed: $fail"

