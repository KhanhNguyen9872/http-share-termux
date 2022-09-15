#!/data/data/com.termux/files/usr/bin/bash

red='\033[1;31m'
orange='\33[38;5;208m'
yellow='\033[1;33m'
green='\033[1;32m'
light_cyan='\033[1;96m'
reset='\033[0m'

cd 2> /dev/null
echo "Y" | termux-setup-storage > /dev/null

if [ ! -d ~/../usr/share/KhanhNguyen9872/KhanhNguyen9872_HTTP ] 2> /dev/null || [ ! -f ~/../usr/bin/http-guest ] 2> /dev/null || [ ! -f ~/../usr/bin/http-custom ] 2> /dev/null || [ ! -f ~/../usr/bin/http-password ] 2> /dev/null || [ ! -f ~/../usr/bin/http-share ] 2> /dev/null || [ ! -f ~/../usr/share/KhanhNguyen9872/KhanhNguyen9872_HTTP/var/www/html/admin/index.php ] 2> /dev/null || [ ! -f ~/../usr/share/KhanhNguyen9872/KhanhNguyen9872_HTTP/var/www/html/index.php ] 2> /dev/null || [ ! -f ~/../usr/bin/http-local ] 2> /dev/null || [ ! -f ~/../usr/bin/http-ngrok ] 2> /dev/null || [ ! -f ~/../usr/bin/ngrok ] 2> /dev/null || [ ! -f ~/../usr/share/KhanhNguyen9872/KhanhNguyen9872_HTTP/usr/bin/bash ] 2> /dev/null || [ ! -f ~/../usr/share/KhanhNguyen9872/KhanhNguyen9872_HTTP/etc/apache2/apache2.conf ] 2> /dev/null || [ ! -f ~/../usr/share/KhanhNguyen9872/KhanhNguyen9872_HTTP/etc/php/8.\1/apache2/php.ini ] 2> /dev/null || [ ! -f  ~/../usr/share/KhanhNguyen9872/KhanhNguyen9872_HTTP/sbin/service ] 2> /dev/null; then
    printf "\n${red} http-share-termux fail to start!\nThe package may be damaged! Try reinstalling!\n\n${reset}"
else
    case $1 in
        enable)
            # 18
            cd ~/../usr/share/KhanhNguyen9872/KhanhNguyen9872_HTTP/var/www/html 2> /dev/null
            sed -i '/$auth_allow_guest = /d' index.php 2> /dev/null
            sed -i "18 i \$auth_allow_guest = true;" index.php 2> /dev/null
            printf "${light_cyan}\n Guest Enabled!\n${orange} Anyone have the link can access the file as read-only!\n\n${light_cyan}"
        ;;
        disable)
            # 18
            cd ~/../usr/share/KhanhNguyen9872/KhanhNguyen9872_HTTP/var/www/html 2> /dev/null
            sed -i '/$auth_allow_guest = /d' index.php 2> /dev/null
            sed -i "18 i \$auth_allow_guest = false;" index.php 2> /dev/null
            printf "${light_cyan}\n Guest Disabled!\n${orange} Only people have an admin account can access!\n\n${light_cyan}"
        ;;
        *)
            printf "${red}\n MISSING ARGUMENT!\n${yellow} - Command: http-guest [ARGUMENT]\n${green} - ARGUMENT: enable (to enable guest)\n             disable (to disable guest)\n\n${reset}"
        ;;
    esac
fi
exit 0
