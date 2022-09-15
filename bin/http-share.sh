#!/data/data/com.termux/files/usr/bin/bash

red='\033[1;31m'
orange='\33[38;5;208m'
yellow='\033[1;33m'
light_cyan='\033[1;96m'
reset='\033[0m'

cd 2> /dev/null
echo "Y" | termux-setup-storage > /dev/null

if [ ! -d ~/../usr/share/KhanhNguyen9872/KhanhNguyen9872_HTTP ] 2> /dev/null || [ ! -f ~/../usr/bin/http-guest ] 2> /dev/null || [ ! -f ~/../usr/bin/http-custom ] 2> /dev/null || [ ! -f ~/../usr/bin/http-password ] 2> /dev/null || [ ! -f ~/../usr/bin/http-share ] 2> /dev/null || [ ! -f ~/../usr/share/KhanhNguyen9872/KhanhNguyen9872_HTTP/var/www/html/admin/index.php ] 2> /dev/null || [ ! -f ~/../usr/share/KhanhNguyen9872/KhanhNguyen9872_HTTP/var/www/html/index.php ] 2> /dev/null || [ ! -f ~/../usr/bin/http-local ] 2> /dev/null || [ ! -f ~/../usr/bin/http-ngrok ] 2> /dev/null || [ ! -f ~/../usr/bin/ngrok ] 2> /dev/null || [ ! -f ~/../usr/share/KhanhNguyen9872/KhanhNguyen9872_HTTP/usr/bin/bash ] 2> /dev/null || [ ! -f ~/../usr/share/KhanhNguyen9872/KhanhNguyen9872_HTTP/etc/apache2/apache2.conf ] 2> /dev/null || [ ! -f ~/../usr/share/KhanhNguyen9872/KhanhNguyen9872_HTTP/etc/php/8.\1/apache2/php.ini ] 2> /dev/null || [ ! -f  ~/../usr/share/KhanhNguyen9872/KhanhNguyen9872_HTTP/sbin/service ] 2> /dev/null; then
    printf "\n${red} http-share-termux fail to start!\nThe package may be damaged! Try reinstalling!\n\n${reset}"
    exit 0
else
    nohup http-local KhanhNguyen98720937927513 &> /dev/null &
    khanhwifiip=$(ifconfig wlan0 2> /dev/null | grep 'inet ' | awk '{print $2}')
    if [[ $khanhwifiip == "" ]] 2> /dev/null || [ -z $khanhwifiip ] 2> /dev/null; then
        khanhwifiip=$(ifconfig 2> /dev/null | grep 'inet ' | grep '19' | awk '{print $2}')
    fi
    if [ -f ~/../usr/etc/kcustom ] 2> /dev/null; then
        khanhfolder="$(cat ~/../usr/etc/kcustom)"
        if [ ! -d "/sdcard/${khanhfolder}" ] 2> /dev/null; then
            unset khanhfolder
        fi
    fi
    printf "${light_cyan}\n http-share-termux started!\n\n${orange}"
    if [[ $khanhfolder == "" ]] 2> /dev/null || [ -z $khanhfolder ] 2> /dev/null; then
        printf " - Target: /sdcard\n${yellow} - IP: 127.0.0.1:8080\n       ${khanhwifiip}:8080\n\n${reset}"
    else
        printf " - Target: /sdcard/${khanhfolder}\n${yellow} - IP: 127.0.0.1:8080\n       ${khanhwifiip}:8080\n\n${reset}"
    fi
fi
exit 0
