#!/bin/bash


report=~/secure_vault/vault_report.txt
echo "Vault Security Report" >> $report
echo "---------------------" >> $report

for file in ~/secure_vault/*; do
	name=$(basename "$file")
	size=$(stat -c%s "$file")
	modifiedDate=$(stat -c%y "$file")
	permissions=$(stat -c%A "$file")

	echo "Filename: $name" >> $report
	echo "Size: $size" >> $report
	echo "Modified date: $modifiedDate" >> $report
	echo "Permissions: $permissions" >> $report

	#check for risky permissions
	numericPermissions=$(stat -c%a "$file")
	if [[ $numericPermissions -gt 644 ]]; then
		echo "✋🚫SECURITY RISK DETECTED" >> $report
	fi
	echo "---------------------" >> $report
done
echo "The vault report has been created at $report"
