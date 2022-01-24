# Papermc-AIO-script
This script is made for Debian and Debian based Distros. Might also work on other linux distros with apt-packagemanager installed.

Features:
-Setup for probably all MC-Versions
-Autoupdate of Paper for the specified Version
-creating a backup.zip of the three Vanilla levels; Easy to add more Levels for the backup

Prerequirements:
-Debian/linux with ssh-server (Option at Installation with netinstaller)

Installation:
-Click on Code
-Click Download
-Extract the files

Setting up Linux from Windows via ssh:
-Download/Install Putty and connect to your Linux-System (get the Ip with a networkscan app or with your Router)
-Login in with your normal user
-Grant access to login with root:
"sudo apt-get install nano"
"sudo nano /etc/ssh/sshd_config"
change 'PermitRootLogin yes' to 'PermitRootLogin no' or add '#' before it
"sudo /etc/init.d/ssh restart"
-Close Putty and Reopen it and login with root user (Username: 'root'; password: same as sudo-password)
-setup the script:
"cd /home/USER/" (replace USER with the name of your normal user-account)
"mkdir minecraft"
-Download/Install WinSCP and conntect to your Linux-System
-Login with your root user
-navigate to /home/USER/minecraft
-upload the 2 scripts
-change to Putty:
"chmod 0744 start.sh loop.sh"
"./start.sh"

Change settings in the script:
-Open the loop.sh file with your Editor
The changes you can do are described in the Comments which are the Lines beginning with a "#"
