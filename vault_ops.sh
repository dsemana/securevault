#!/bin/bash
while true; do
echo  " Secure vault menu"
echo " 1.Add  secret"
echo " 2.Update Secret(find and replace)"
echo " 3. Add log entry"
echo "4. access keys"
echo "5.Exit"
 read -p  "Choose an option(1-5)" choice
case $choice in
# add a secret
1) 
read -p "Enter a secret" secret
echo "$secret" >> ~/secure_vault/secrets.txt
echo "The secret has been added"
;;
#Replacing a secret
2)
read -p "Enter a  secret to replace:" old
read -p "Enter a new secret" new
 if grep -q "$old" ~/secure_vault/secrets.txt; then
sed -i "s/$old/$new/" ~/secure_vault/secrets.txt
echo "Secret replaced"
else
echo "No match found"
fi
;;
#Log entry
3)
	read -p "Enter log entry" log
	echo "$(date): $log" >> ~/secure_vault/logs.txt
	;;
#Access denied!!
4)
 echo "ACCESS DENIED 🚫"
 ;;
#exit
5)
	echo "we are exiting"
	break
	;;
*)
echo "Invalid choice"
;;
esac
done
