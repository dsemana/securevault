#!/bin/bash
# creating a secure vault with 3 files

cd
cd home
mkdir secure_vault
cd secure_vault

touch keys.txt
touch secrets.txt
touch logs.txt

echo 'Welcome text' > keys.txt
echo 'Welcome text' > secrets.txt
echo 'Welcome Text' > logs.txt

echo 'Vault Created!'

ls -l
