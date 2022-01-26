# Papermc-AIO-Script
This script is made for Debian (min. stable) and Debian based Distros. Might also work on other linux distros with apt-packagemanager installed.

WARNING: Autoupdates might cause Problems. Use FTP-Backup or Nextcloud-Backup if possible

HIGHLY RECOMMENDED TO USE THE FTP- OR NEXTCLOUD-BACKUP!!!
[LINK](https://github.com/metzger100/Papermc-AIO-Script#change-settings-in-the-script)

## Features:
- Setup for probably all MC-Versions
- Autoupdate of Paper for the specified Version (default 1.18.X)
- creating a backup.zip of the three Vanilla levels and all plugins; Easy to add more Levels for the backup (on-Drive-Backup by default, use FTP- or Nextcloud-Backup if possible)
- Autorestart
- Autoactivate noip2 on startup (also works without noip2 installed)
- creates a serverlog (screenlog.0)

## Prerequirements:
- Debian/linux with ssh-server (Option at Installation with netinstaller)
- Putty and WinSCP/FileZilla
- ssh-login with root enabled. (if sudo is not preconfigured) [Link!](https://linuxconfig.org/enable-ssh-root-login-on-debian-linux-server)

## Installation:
- Click on Code
- Click Download ZIP
- Extract the files

### Setting up Debian from Windows via ssh:
- Download/Install Putty and connect to your Linux-System (get the IP with a networkscan app or with your Router)
- maybe you need to install sudo:
Login with your root user (Username: root password: YOURROOTPASSWORD)
```bash
apt update
```
```bash
apt -y upgrade
```
```bash
apt -y install sudo
```
Grant your normal user sudo access; Replace "USER" with your normal username
```bash
usermod -aG sudo USER
```
```bash
systemctl restart
```
- Wait till reboot of Debian finished and reconnect Putty to login in with your normal user
- setup the serverfolder:
```bash
mkdir minecraft
```
- Download/Install WinSCP/FileZilla and connect to your Linux-System
- Login as your normal user
- navigate to /home/USER/minecraft Folder
- upload the extracted loop.sh, update.sh and start.sh
- switch back to putty:
```bash
cd minecraft/
```
```bash
chmod 0755 start.sh loop.sh update.sh
```
```bash
./start.sh
```
Enter your sudo password and the script will do the rest. 
### Change settings in the script: (Don't use the WinSCP Editor)
- Completely stop the server (Press ctrl+C when you logged into your Server console)
- Download the File with WinSCP/Filezilla and edit with [Notepad++](https://notepad-plus-plus.org/downloads/)
- Save (and upload the file)
- run the server
```bash
./start.sh
```
The changes you can do, are described in the comments which are the Lines beginning with a "#". They are written in capital letters.

### Optional
- Create a Account at noip.com and create a new hostname
- Install [noip2](https://www.noip.com/support/knowledgebase/installing-the-linux-dynamic-update-client-on-ubuntu/)
- Forward TCP/UDP Port 25565 to your Debian/Linux System in your Routers settings

## USEAGE
- if you enter /stop into the chat of the Minecraft server it stops, makes the backup, updates PaperMC and Starts again
- if you want to start the server use Putty and login with your normal user
```bash
cd minecraft/
```
```bash
./start.sh
```
- if you want to login to the serverconsole while the server is running use Putty and login with your normal user
```bash
screen -r
```
- to download the backup, connect to your server with WinSCP/FileZilla and download the backup.zip in /home/USER/minecraft/backup/
