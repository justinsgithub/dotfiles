#!/bin/bash

# Find all package.json files in subdirectories
find . -name "package.json" -type f | while read file; do
  dir=$(dirname "$file")
  
  # Check if node_modules directory exists
  if [ ! -d "$dir/node_modules" ]; then
    echo "Installing dependencies in $dir"
    
    # Install dependencies
    (cd "$dir" && pnpm install)
  fi
done
