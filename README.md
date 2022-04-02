# http-share-termux
Share all files in Internal Storage with another device on Wi-Fi using Termux

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
