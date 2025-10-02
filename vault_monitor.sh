#!/bin/bash

VAULT_DIR="$HOME/secure_vault"
REPORT="$VAULT_DIR/vault_report.txt"

# Check if vault exists
if [ ! -d "$VAULT_DIR" ]; then
  echo "❌ Error: secure_vault does not exist."
  exit 1
fi

# Start report
echo "====== Vault Report ======" > "$REPORT"

# Loop through all files in secure_vault
for file in "$VAULT_DIR"/*; do
  filename=$(basename "$file")
  size=$(stat -c %s "$file")
  mod_date=$(stat -c %y "$file")
  perms=$(stat -c %a "$file")

  echo "File: $filename" >> "$REPORT"
  echo "Size: $size bytes" >> "$REPORT"
  echo "Last Modified: $mod_date" >> "$REPORT"
  echo "Permissions: $perms" >> "$REPORT"

  if [ "$perms" -gt 644 ]; then
    echo "⚠️ SECURITY RISK DETECTED" >> "$REPORT"
  fi

  echo "------------------------" >> "$REPORT"
done

echo "✅ Vault monitoring report created at $REPORT"

