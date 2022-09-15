#!/data/data/com.termux/files/usr/bin/bash

red='\033[1;31m'
green='\033[1;32m'
yellow='\033[1;33m'
blue='\033[1;34m'
light_cyan='\033[1;96m'
reset='\033[0m'
orange='\33[38;5;208m'

cd 2> /dev/null
echo "Y" | termux-setup-storage > /dev/null

if [ ! -d ~/../usr/share/KhanhNguyen9872/KhanhNguyen9872_HTTP ] 2> /dev/null || [ ! -f ~/../usr/bin/http-guest ] 2> /dev/null || [ ! -f ~/../usr/bin/http-custom ] 2> /dev/null || [ ! -f ~/../usr/bin/http-password ] 2> /dev/null || [ ! -f ~/../usr/bin/http-share ] 2> /dev/null || [ ! -f ~/../usr/share/KhanhNguyen9872/KhanhNguyen9872_HTTP/var/www/html/admin/index.php ] 2> /dev/null || [ ! -f ~/../usr/share/KhanhNguyen9872/KhanhNguyen9872_HTTP/var/www/html/index.php ] 2> /dev/null || [ ! -f ~/../usr/bin/http-local ] 2> /dev/null || [ ! -f ~/../usr/bin/http-ngrok ] 2> /dev/null || [ ! -f ~/../usr/bin/ngrok ] 2> /dev/null || [ ! -f ~/../usr/share/KhanhNguyen9872/KhanhNguyen9872_HTTP/usr/bin/bash ] 2> /dev/null || [ ! -f ~/../usr/share/KhanhNguyen9872/KhanhNguyen9872_HTTP/etc/apache2/apache2.conf ] 2> /dev/null || [ ! -f ~/../usr/share/KhanhNguyen9872/KhanhNguyen9872_HTTP/etc/php/8.\1/apache2/php.ini ] 2> /dev/null || [ ! -f  ~/../usr/share/KhanhNguyen9872/KhanhNguyen9872_HTTP/sbin/service ] 2> /dev/null; then
    printf "\n${red} http-share-termux fail to start!\n The package may be damaged! Try reinstalling!\n\n${reset}"
    exit 0
else
    if [[ $1 == "authtoken" ]] 2> /dev/null; then
         touch ~/../usr/etc/kkn 2> /dev/null
         http-ngrok authtoken $2
         printf "${green}\n Success!\n\n${reset}"
    else
        if [ ! -f ~/../usr/etc/kkn ] 2> /dev/null; then
            printf "\n${red} Authtoken ngrok is not insert!\n${yellow} - Use: ngrok authtoken [your-token]\n\n${reset}"
            exit 0
        fi
        while [[ $server == "" ]] 2> /dev/null || [ -z $server ] 2> /dev/null || [[ $server -lt 1 ]] 2> /dev/null || [[ $server -gt 7 ]] 2> /dev/null; do
            clear
            printf "${light_cyan}\n\n Nguyễn Văn Khánh (KhanhNguyen9872)\n Github: https://github.com/khanhnguyen9872\n Phone: +84937927513\n Facebook: https://fb.me/khanh10a1\n\n"
            printf "${blue} Vui lòng chọn vị trí Server:\n${yellow} 1. United States (Ohio)\n 2. Europe (Frankfurt)\n 3. Asia/Pacific (Singapore)\n 4. Australia (Sydney)\n 5. South America (Sao Paulo)\n 6. Japan (Tokyo)\n 7. India (Mumbai)\n\n${green}"
            read -p "Server số: " server
        done
        if [[ $server -eq 1 ]] 2> /dev/null; then
            khanhregion="us"
        else
            if [[ $server -eq 2 ]] 2> /dev/null; then
                khanhregion="eu"
            else
                if [[ $server -eq 3 ]] 2> /dev/null; then
                    khanhregion="ap"
                else
                    if [[ $server -eq 4 ]] 2> /dev/null; then
                        khanhregion="au"
                    else
                        if [[ $server -eq 5 ]] 2> /dev/null; then
                            khanhregion="sa"
                        else
                            if [[ $server -eq 6 ]] 2> /dev/null; then
                                khanhregion="jp"
                            else
                                if [[ $server -eq 7 ]] 2> /dev/null; then
                                    khanhregion="in"
                                else
                                    khanhregion="us"
                                fi
                            fi
                        fi
                    fi
                fi
            fi
        fi
        nohup http-ngrok http -region=${khanhregion} 127.0.0.1:8080 &> /dev/null &
        sleep 2
        khanhip="$(curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"http:..([^"]*).*/\1/p')"
        count=0
        while [[ $khanhip == "" ]] 2> /dev/null || [ -z $khanhip ] 2> /dev/null; do
            if [[ $count -eq 100 ]] 2> /dev/null; then
                printf "${red}\n\n 100 lần thất bại! Đang thoát....\n\n"
                exit 0
            fi
            clear
            printf "${light_cyan}\n\n Nguyễn Văn Khánh (KhanhNguyen9872)\n Github: https://github.com/khanhnguyen9872\n Phone: +84937927513\n Facebook: https://fb.me/khanh10a1\n\n"
            printf "${yellow}\n Ctrl + C to close${red}\n\n Server đang bận! Bạn có thể thử Server khác!\n Kết nối lại lần thứ: ${count}\n\n Đang thử cố gắng kết nối....\n\n"
            nohup http-ngrok http -region=${khanhregion} 127.0.0.1:8080 &> /dev/null &
            sleep 2
            khanhip="$(curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"http:..([^"]*).*/\1/p')"
            count=$((count + 1))
        done
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
        clear
        printf "${light_cyan}\n\n Nguyễn Văn Khánh (KhanhNguyen9872)\n Github: https://github.com/khanhnguyen9872\n Phone: +84937927513\n Facebook: https://fb.me/khanh10a1\n\n"
        if [[ $khanhfolder == "" ]] 2> /dev/null || [ -z $khanhfolder ] 2> /dev/null; then
            printf "${orange} - Target: /sdcard\n"
        else
            printf "${orange} - Target: /sdcard/${khanhfolder}\n"
        fi
        printf "${yellow} - IP: 127.0.0.1:8080\n       ${khanhwifiip}:8080\n${light_cyan} - Your HTTP:\nhttp://${khanhip}\nhttps://${khanhip}\n\n"
    fi
fi
exit 0
