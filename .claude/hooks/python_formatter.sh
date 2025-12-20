#!/bin/bash
# Python Black Formatter Hook
# Automatically formats Python files after any Edit operation using ruff format formatter
# This hook runs 'ruff format' on any .py file that Claude modifies, ensuring consistent Python code formatting.
# Requires ruff format to be installed ('pip install ruff format')

# Read JSON input from stdin
input=$(cat)

# Extract the file path from the JSON using jq (if available) or fallback to sed/grep
if command -v jq &> /dev/null; then
    # Use jq to extract the file path from tool_input
    file_path=$(echo "$input" | jq -r '.tool_input.file_path // .tool_response.filePath' 2>/dev/null)
else
    # Fallback method using grep/sed if jq is not available
    file_path=$(echo "$input" | grep -o '"file_path":"[^"]*"' | head -1 | cut -d'"' -f4)
    if [ -z "$file_path" ]; then
        file_path=$(echo "$input" | grep -o '"filePath":"[^"]*"' | head -1 | cut -d'"' -f4)
    fi
fi

# Check if we extracted a file path and if it's a Python file
if [ -n "$file_path" ] && [[ "$file_path" == *.py ]]; then
    if [ -f "$file_path" ]; then
        if command -v ruff format &> /dev/null; then
            ruff format "$file_path"
            echo "Formatted Python file with ruff format: $file_path"
        else
            echo "Black formatter not found. Skipping Python formatting."
        fi
    else
        echo "File does not exist: $file_path"
    fi
else
    echo "Not a Python file or no file path found in hook input"
fi