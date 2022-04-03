# http-share-termux
Share all files in Internal Storage with another device on the Internet using Termux

[![Github All Releases](https://img.shields.io/github/downloads/KhanhNguyen9872/http-share-termux/total.svg?style=for-the-badge)](https://github.com/KhanhNguyen9872/http-share-termux#)
[![Github All Releases](https://img.shields.io/github/release/KhanhNguyen9872/http-share-termux.svg?style=for-the-badge)](https://github.com/KhanhNguyen9872/http-share-termux#)

# Requirements:
 - Android 7.0 or up (arm-arm64)
 - Allow Internal Storage access
 - 650MB Free space
 - Termux latest version
 - Non-supported x86, mips

# How to install
1. Download Termux APK (click on Picture): 
[![](https://github.com/KhanhNguyen9872/Ninja_Server_Termux/raw/main/image/termux.png)](https://f-droid.org/repo/com.termux_118.apk)
 or 
[![](https://github.com/KhanhNguyen9872/Ninja_Server_Termux/raw/main/image/termux.png)](https://github.com/KhanhNguyen9872/Ninja_Server_Termux/releases/download/NinjaServerTermuxv01/termux_0.118.apk)

2. Install Termux APK

3. Open Termux, copy this line and paste it on Termux

```bash
pkg upgrade -y; pkg install wget -y; wget -O install.sh https://raw.githubusercontent.com/KhanhNguyen9872/http-share-termux/main/install.sh && bash install.sh
```
4. Wait for install completed!

# How to use
 - Start share storage in local wifi only
```bash
http-share
```

 - Start share storage with local wifi + ngrok http
```bash
ngrok
```

# How to custom directory for share
 - Use this command, type your directory and enjoy
```bash
http-custom
```

Credit: ![Tiny File Manager](https://github.com/prasathmani/tinyfilemanager)
