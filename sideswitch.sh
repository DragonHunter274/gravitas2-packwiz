#!/bin/bash

# Directory where the .toml files are located
DIRECTORY="./mods"

# List of client-side only .toml files
CLIENT_SIDE_MODS=(
    "inventory-profiles-next.pw.toml"
    "iris-flywheel-compat.pw.toml"
    "jade.pw.toml"
    "xaeros-minimap.pw.toml"
    "xaeros-world-map.pw.toml"
    "no-chat-reports.pw.toml"
    "dynamiclights-reforged.pw.toml"
    "enchantment-descriptions.pw.toml"
    "smooth-boot-reloaded.pw.toml"
    "entityculling.pw.toml"
    "extreme-sound-muffler.pw.toml"
    "controlling.pw.toml"
)

# Loop through each file in the list
for mod in "${CLIENT_SIDE_MODS[@]}"; do
  file="$DIRECTORY/$mod"

  # Check if the file exists
  if [ -f "$file" ]; then
    # Check if 'side = "both"' is present in the file
    if grep -q 'side = "both"' "$file"; then
      # Replace 'side = "both"' with 'side = "client"'
      sed -i 's/side = "both"/side = "client"/g' "$file"
      echo "Updated: $file"
    else
      echo "No changes: $file"
    fi
  else
    echo "File not found: $file"
  fi
done

