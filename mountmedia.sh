#!/bin/bash

read -p "Username: " username
read -sp "Password: " password
echo

sudo mount -t cifs //192.168.0.141/media /mnt/media -o "username=$username,password=$password,vers=3.0"
