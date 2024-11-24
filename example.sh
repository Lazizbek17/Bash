#!/bin/bash

# /etc/profile: Tizim miqyosidagi shell konfiguratsiyasi.

# Barcha foydalanuvchilar uchun PATH o‘rnatish
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:$PATH"

# Standart shell o‘zgaruvchilarni belgilash
export USER=$(whoami)
export MAIL="/var/spool/mail/$USER"
export HOSTNAME=$(hostname)
export HISTSIZE=1000

# Umumiy umask qiymatini o‘rnatish (standart fayl ruxsatlari)
umask 022

# Agar /etc/inputrc mavjud bo‘lsa, uni o‘qish
if [ -f /etc/inputrc ]; then
    export INPUTRC=/etc/inputrc
fi

# /etc/profile.d katalogidagi barcha skriptlarni ishga tushirish
if [ -d /etc/profile.d ]; then
    for file in /etc/profile.d/*.sh; do
        if [ -r "$file" ]; then
            . "$file"
        fi
    done
fi

# Kirgan foydalanuvchilar uchun xabar chiqarish
echo "Tizimga xush kelibsiz, $USER!"



# 1. So'z qidirish
echo "1. 'dictionary' so'zi /usr/share/dict/words faylida qidirilmoqda:"
grep dictionary /usr/share/dict/words
echo

# 2. $_ (oxirgi buyruqning oxirgi argumentini chiqarish)
echo "2. So'nggi buyruqning oxirgi argumenti ( $_ ):"
echo $_
echo

# 3. $$ (joriy jarayonning PID raqami)
echo "3. Joriy shell jarayonining PID raqami ( $$ ):"
echo $$
echo

# 4. Mozilla-ni fon jarayonida ishga tushirish
echo "4. Mozilla fon jarayonida ishga tushirilyapti..."
mozilla &

# 5. $! (so'nggi fon jarayonining PID raqami)
echo "5. So'nggi fon jarayonining PID raqami ( $! ):"
echo $!
echo

# 6. $0 (shell yoki skript nomi)
echo "6. Joriy shell yoki skript nomi ( $0 ):"
echo $0
echo

# 7. $?, xato chiqish kodi
echo "7. So'nggi buyruqning chiqish kodi ( $? ):"
ls doesnotexist
echo "Chiqish kodi:"
echo $?
echo

# 8. $?, muvaffaqiyatli buyruq
echo "8. Muvaffaqiyatli buyruqni bajarish ( $? ):"
ls /usr/share/dict/words
echo "Chiqish kodi:"
echo $?
