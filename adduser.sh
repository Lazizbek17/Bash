#!/bin/bash

# Tekshirish: foydalanuvchi rootmi?
if [ $(id -u) -eq 0 ]; then
    # Foydalanuvchi nomi va parolini so‘rash
    read -p "Enter the username: " username
    read -s -p "Enter the password: " password
    echo
    
    # Foydalanuvchi mavjudligini tekshirish
    egrep "^$username" /etc/passwd > /dev/null
    if [ $? -eq 0 ]; then
        echo "User '$username' already exists!"
        exit 1
    else
        # Parolni kodlash va foydalanuvchini qo'shish
        pass=$(perl -e 'print crypt($ARGV[0], "password")' "$password")
        useradd -m -p "$pass" "$username"
        
        # Yaratilganligini tekshirish
        if [ $? -eq 0 ]; then
            echo "User '$username' has been added to the system!"
        else
            echo "Failed to add user '$username'."
        fi
    fi
else
    echo "Only root may add a user to the system."
    exit 2
fi

