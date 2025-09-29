#!/bin/bash
directory="/home/securevault/secure_vault"
if [-d "$directory"] then
	cd
	cd .$directory
	ls -l
else
	echo 'The is no vault'	
