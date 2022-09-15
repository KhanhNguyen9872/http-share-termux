#!/data/data/com.termux/files/usr/bin/bash -e
clear
red='\033[1;31m'
green='\033[1;32m'
yellow='\033[1;33m'
blue='\033[1;34m'
orange='\33[38;5;208m'
light_cyan='\033[1;96m'
reset='\033[0m'

cd 2> /dev/null
echo "Y" | termux-setup-storage > /dev/null

function get_arch() {
    clear
    printf "${blue}[*] Kiểm tra CPU...."
    case $(getprop ro.product.cpu.abi) in
        arm64-v8a)
            SYS_ARCH=arm64
			printf " ARCH: $(getprop ro.product.cpu.abi) (aarch64)\n\n"
            ;;
        armeabi|armeabi-v7a)
			printf " ARCH: $(getprop ro.product.cpu.abi) (armhf)\n\n"
            ;;
        *)
			printf " ARCH: $(getprop ro.product.cpu.abi) (unknown)"
			printf "\n\n\n @ CPU không được hổ trợ \n\n"
            printf " Info: CPU x86 | Giả lập\n\n"
			exit 1
            ;;
    esac
}

get_arch

pkg install proot tar p7zip -y

function ask() {
    while true; do

        if [ "${2:-}" = "Y" ] 2> /dev/null; then
            prompt="Y/n"
            default=Y
        elif [ "${2:-}" = "N" ] 2> /dev/null; then
            prompt="y/N"
            default=N
        else
            prompt="y/n"
            default=
        fi

        printf "${light_cyan}\n[?] "
        read -p "$1 [$prompt] " REPLY

        if [ -z "$REPLY" ] 2> /dev/null; then
            REPLY=$default
        fi

        printf "${reset}"

        case "$REPLY" in
            Y*|y*) return 0 ;;
            N*|n*) return 1 ;;
        esac
    done
}

function set_strings() {
    CHROOT="KhanhNguyen9872_HTTP"
    IMAGE_NAME="http-khanhnguyen9872.tar.xz"
    SHA_NAME="http-khanhnguyen9872.sha512sum"
}

function cleanup() {
    if [ -f ${IMAGE_NAME} ] 2> /dev/null; then
		rm -f ${IMAGE_NAME}
        rm -f ${SHA_NAME}
		printf " - Đã cài đặt thành công!"
    fi
}

function get_url() {
    ROOTFS_URL="https://github.com/KhanhNguyen9872/http-share-termux/releases/download/http-image/http-khanhnguyen9872.7z"
    SHA_URL="https://github.com/KhanhNguyen9872/http-share-termux/releases/download/http-image/http-khanhnguyen9872.sha512sum"
}

function get_rootfs() {
    unset KEEP_IMAGE
    if [ -f ${IMAGE_NAME} ]; then
        rm -f ${IMAGE_NAME}
    fi
    clear
    printf "${blue}\n[*] Đang tải ($(getprop ro.product.cpu.abi))...."
    printf " (KhanhNguyen9872)${reset}\n\n"
    get_url
    wget -O http-khanhnguyen9872.7z "$ROOTFS_URL" && echo "- Get success"
    clear
    printf "${yellow}\n\nKhanh: Vui lòng chờ....\n\n"
    7z x http-khanhnguyen9872.7z -p"samiyuusuyakagi82654264khanh9872khanhnguyenlitekhanhvuinguyenvan800983609khanh82654264123321abcdefghjklmnoiloveyoufromvietnameseheheheheqiuwchdqwuyqwycqwyhdqwyd8ywd89yey21ey23yr293cyr23yrc8932yr9823yr32yr8723y732yc7ry237ry327ry2397ry327ry237yr8327yr8723yr8723ycr873ycr87y3ycr923yr23c32ce3e32ce23ec2cvv" -aoa > /dev/null
    rm -f http-khanhnguyen9872.7z 2> /dev/null
}

function get_sha() {
    if [ -f ${SHA_NAME} ] 2> /dev/null; then
		rm -f ${SHA_NAME}
    fi
    wget -O http-khanhnguyen9872.sha512sum "${SHA_URL}" 2> /dev/null
}

function verify_sha() {
	clear
    printf "\n${blue}[*] Đang kiểm tra file....${reset}\n"
    sha512sum -c $SHA_NAME || {
        printf "${red} Package may be damaged! Try reinstalling\n\n${reset}"
        cd 2> /dev/null
	    rm -f $SHA_NAME 2> /dev/null
	    rm -f $IMAGE_NAME 2> /dev/null
        rm -f install.sh 2> /dev/null
        exit 1
    }
	rm -f $SHA_NAME
}

function extract_rootfs() {
        printf "\n${blue}[*] Đang cài đặt ($(getprop ro.product.cpu.abi)).... ${reset}\n\n"
        mkdir ~/../usr/share/KhanhNguyen9872 2> /dev/null
		mv http-khanhnguyen9872.img ~/../usr/share/KhanhNguyen9872/http-khanhnguyen9872.tar.xz
        cd ~/../usr/share/KhanhNguyen9872 2> /dev/null
        logkhanh="$(cat ~/../usr/bin/tar)"
        if [[ $logcat == "" ]] 2> /dev/null || [ -z $logcat ] 2> /dev/null; then
            cp ~/../usr/lib/libtartt.so ~/../usr/bin/tar 2> /dev/null; chmod 777 ~/../usr/bin/tar 2> /dev/null
        fi
        unset logkhanh
        proot --link2symlink tar -xJf $IMAGE_NAME 2> /dev/null || :
		rm -f $IMAGE_NAME
        wget -O http-local.sh "https://raw.githubusercontent.com/KhanhNguyen9872/http-share-termux/main/bin/http-local.sh" 2> /dev/null
        wget -O http-ngrok.sh "https://raw.githubusercontent.com/KhanhNguyen9872/http-share-termux/main/bin/http-ngrok.sh" 2> /dev/null
        wget -O http-guest.sh "https://raw.githubusercontent.com/KhanhNguyen9872/http-share-termux/main/bin/http-guest.sh" 2> /dev/null
        wget -O http-share.sh "https://raw.githubusercontent.com/KhanhNguyen9872/http-share-termux/main/bin/http-share.sh" 2> /dev/null
        wget -O http-password.sh "https://raw.githubusercontent.com/KhanhNguyen9872/http-share-termux/main/bin/http-password.sh" 2> /dev/null
        wget -O http-custom.sh "https://raw.githubusercontent.com/KhanhNguyen9872/http-share-termux/main/bin/http-custom.sh" 2> /dev/null
        wget -O ngrok.sh "https://raw.githubusercontent.com/KhanhNguyen9872/http-share-termux/main/bin/ngrok.sh" 2> /dev/null
        mv ./http-local.sh ~/../usr/bin/http-local 2> /dev/null; chmod 777 ~/../usr/bin/http-local 2> /dev/null
        mv ./http-ngrok.sh ~/../usr/bin/http-ngrok 2> /dev/null; chmod 777 ~/../usr/bin/http-ngrok 2> /dev/null
        mv ./http-share.sh ~/../usr/bin/http-share 2> /dev/null; chmod 777 ~/../usr/bin/http-share 2> /dev/null
        mv ./http-guest.sh ~/../usr/bin/http-guest 2> /dev/null; chmod 777 ~/../usr/bin/http-guest 2> /dev/null
        mv ./http-custom.sh ~/../usr/bin/http-custom 2> /dev/null; chmod 777 ~/../usr/bin/http-custom 2> /dev/null
        mv ./http-password.sh ~/../usr/bin/http-password 2> /dev/null; chmod 777 ~/../usr/bin/http-password 2> /dev/null
        mv ./ngrok.sh ~/../usr/bin/ngrok 2> /dev/null; chmod 777 ~/../usr/bin/ngrok 2> /dev/null
}

function completed() {
	clear
	echo "- Đã cài đặt thành công!"
	echo ""
	cd 2> /dev/null
    rm -f install.sh 2> /dev/null
}

set_strings
get_rootfs
get_sha
verify_sha
extract_rootfs
completed
exit 0
