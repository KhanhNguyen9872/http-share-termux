#!/data/data/com.termux/files/usr/bin/bash -e

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
    exit 0
else
    printf "\n${yellow}"
    read -p "New password: " passwd
    read -p "Confirm password: " repasswd
    if [[ $passwd == $repasswd ]] 2> /dev/null; then
        ### index admin ###
        cd ~/../usr/share/KhanhNguyen9872/KhanhNguyen9872_HTTP/var/www/html/admin 2> /dev/null
        sed -i '/$auth_users = array(/d' index.php 2> /dev/null
        # 12
        auth_users='$auth_users' 2> /dev/null
        sed -i "12 i $auth_users = array('admin' => password_hash('${passwd}', PASSWORD_DEFAULT));" index.php 2> /dev/null
        ### index home ###
        cd ~/../usr/share/KhanhNguyen9872/KhanhNguyen9872_HTTP/var/www/html 2> /dev/null
        sed -i '/$auth_users = array(/d' index.php 2> /dev/null
        # 12
        auth_users='$auth_users' 2> /dev/null
        sed -i "12 i $auth_users = array('admin' => password_hash('${passwd}', PASSWORD_DEFAULT));" index.php 2> /dev/null
        printf "\n${green} Password has been changed!\n\n${reset}"
    else
        printf "${red} Passwords do not match\n\n${reset}"
        exit 0
    fi
fi
exit 0
