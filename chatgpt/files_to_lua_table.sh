#!/bin/bash

# Get a list of all files in the current directory
files=$(ls *)

# Create an empty array to store file names
arr=()

# Loop through each file
for file in $files; do
  # Remove the extension from the file name
  name=${file%.*}
  # Add the file name to the array
  arr+=("$name")
done

# Convert the array to a Lua table
table=$(printf "['%s'] = true,\n" "${arr[@]}")

# Write the table to a Lua file
echo "return {" > files.lua
echo -e $table >> files.lua
echo "}" >> files.lua
