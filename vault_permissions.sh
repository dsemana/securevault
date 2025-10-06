
#!/bin/bash

if [[ ! -d ~/secure_vault ]]; then 
       echo "directory doesn't exist" 
exit 1
fi 
#creation of the function.
update_permission(){
local file=$1
local default_perm=$2
echo "the current permissions are:"
ls -l ~/secure_vault/$file
read -p " do you  want to change the existing file permissions? (y/n)" confirm
if [[ $confirm =~ ^[Yy]$ ]]; then
read -p "enter the desired new permissions: (in the 640 format)" new_perm
if [[ -z $new_perm ]]; then
new_perm=$default_perm
fi
if [[ ! $new_perm =~ ^[0-7]{3}$ ]]; then
echo "invalid permissions"
return 1
fi
chmod $new_perm ~/secure_vault/$file
echo " new permissons for the file $file have been updated to  $new_perm"
else
echo "file permissions remained unchanged"
fi 

}
update_permission "keys.txt" 600
update_permission "secrets.txt" 640
update_permission "logs.txt" 644

echo "the updated permissions are:" && ls -l ~/secure_vault/
