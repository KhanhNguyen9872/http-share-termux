#!/data/data/com.termux/files/usr/bin/bash
# KhanhNguyen9872
# Github: https://github.com/khanhnguyen9872
# FB: https://fb.me/khanh10a1
## All code here by KhanhNguyen9872
## Please don't re-upload without my name!

cd 2> /dev/null
echo "Y" | termux-setup-storage > /dev/null

red='\033[1;31m'
yellow='\033[1;33m'
light_cyan='\033[1;96m'
green='\033[1;32m'
reset='\033[0m'

printf "\n${yellow}Custom: ${light_cyan}"
read -p "/sdcard/" khanhfolder
printf "${reset}"

if [[ $khanhfolder == "" ]] 2> /dev/null || [ -z $khanhfolder ] 2> /dev/null; then
	unset khanhfolder
else
	if [ ! -d "/sdcard/${khanhfolder}" ] 2> /dev/null; then
		printf "\n${red} /sdcard/${khanhfolder} not found!\n\n${reset}"
		exit 0
	else
		rm -f ~/../usr/etc/kcustom 2> /dev/null
		printf "${khanhfolder}" > ~/../usr/etc/kcustom
	fi
fi
cd ~/../usr/share/KhanhNguyen9872
unset LD_PRELOAD
command="proot"
command+=" --link2symlink"
command+=" --kill-on-exit"
command+=" -0"
command+=" -r KhanhNguyen9872_HTTP"
command+=" -b /dev"
command+=" -b /proc"
command+=" -b /sdcard"
command+=" -w /root"
command+=" /usr/bin/env -i"
command+=" HOME=/root"
command+=" PATH=/usr/local/sbin:/usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin:/usr/games:/usr/local/games"
command+=" TERM=$TERM"
command+=" LANG=C.UTF-8"
command+=" /bin/bash --login"
com="mkdir /var/www 2> /dev/null; cd /var/www/; rm -f html 2> /dev/null; ln -s '/sdcard/${khanhfolder}' html; exit"
$command -c "$com"
unset com
unset command
unset khanhfolder
printf "${green}\n Custom http: /sdcard/${khanhfolder} completed!\n\n${reset}"
exit 0
