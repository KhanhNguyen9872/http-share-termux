#!/data/data/com.termux/files/usr/bin/bash
# KhanhNguyen9872
# Github: https://github.com/khanhnguyen9872
# FB: https://fb.me/khanh10a1
## All code here by KhanhNguyen9872
## Please don't re-upload without my name!

cd 2> /dev/null
echo "Y" | termux-setup-storage > /dev/null

if [[ $1 != "KhanhNguyen98720937927513" ]] 2> /dev/null; then
	exit 0
fi

if [ -f ~/../usr/etc/kcustom ] 2> /dev/null; then
	khanhfolder="$(cat ~/../usr/etc/kcustom)"
	if [ ! -d "/sdcard/${khanhfolder}" ] 2> /dev/null; then
		unset khanhfolder
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
com="mkdir /var/www 2> /dev/null; cd /var/www/; rm -f html 2> /dev/null; ln -s '/sdcard/${khanhfolder}' html; service apache2 start; while [ -z $keep ] 2> /dev/null; do sleep 9999; done"
$command -c "$com"
unset com
unset command
unset khanhfolder
exit 0
