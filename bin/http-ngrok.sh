#!/data/data/com.termux/files/usr/bin/bash
# KhanhNguyen9872
# Github: https://github.com/khanhnguyen9872
# FB: https://fb.me/khanh10a1
## All code here by KhanhNguyen9872
## Please don't re-upload without my name!

cd 2> /dev/null
echo "Y" | termux-setup-storage > /dev/null

if [ ! -f ~/../usr/etc/kkn ] 2> /dev/null; then
    exit 0
fi

if [ ! -d ~/../usr/share/KhanhNguyen9872/KhanhNguyen9872_HTTP ] 2> /dev/null || [ ! -f ~/../usr/bin/http-guest ] 2> /dev/null || [ ! -f ~/../usr/bin/http-custom ] 2> /dev/null || [ ! -f ~/../usr/bin/http-password ] 2> /dev/null || [ ! -f ~/../usr/bin/http-share ] 2> /dev/null || [ ! -f ~/../usr/share/KhanhNguyen9872/KhanhNguyen9872_HTTP/var/www/html/admin/index.php ] 2> /dev/null || [ ! -f ~/../usr/share/KhanhNguyen9872/KhanhNguyen9872_HTTP/var/www/html/index.php ] 2> /dev/null || [ ! -f ~/../usr/bin/http-local ] 2> /dev/null || [ ! -f ~/../usr/bin/http-ngrok ] 2> /dev/null || [ ! -f ~/../usr/bin/ngrok ] 2> /dev/null || [ ! -f ~/../usr/share/KhanhNguyen9872/KhanhNguyen9872_HTTP/usr/bin/bash ] 2> /dev/null || [ ! -f ~/../usr/share/KhanhNguyen9872/KhanhNguyen9872_HTTP/etc/apache2/apache2.conf ] 2> /dev/null || [ ! -f ~/../usr/share/KhanhNguyen9872/KhanhNguyen9872_HTTP/etc/php/8.\1/apache2/php.ini ] 2> /dev/null || [ ! -f  ~/../usr/share/KhanhNguyen9872/KhanhNguyen9872_HTTP/sbin/service ] 2> /dev/null; then
    printf "\n${red} http-share-termux fail to start!\nThe package may be damaged! Try reinstalling!\n\n${reset}"
else
	cd ~/../usr/share/KhanhNguyen9872
	unset LD_PRELOAD
	command="proot"
	command+=" --link2symlink"
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
	if [[ $# -eq 0 ]] 2> /dev/null; then
		exit 0
	else
		if [[ $1 == "http" ]] 2> /dev/null && [[ $3 == "127.0.0.1:8080" ]] 2> /dev/null; then
			com="ngrok ${@}"
			$command -c "$com"
			unset com
			exit 0
		else
	    	if [[ $1 == "authtoken" ]] 2> /dev/null; then
	        	com="ngrok authtoken $2 &> /dev/null"
	        	$command -c "$com"
				unset com
				unset command
	        	exit 0
	    	else
				exit 0
	    	fi
		fi
	fi
fi
exit 0
