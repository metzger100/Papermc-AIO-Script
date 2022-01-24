# Papermc-AIO-Script
<brThis script is made for Debian and Debian based Distros. Might also work on other linux distros with apt-packagemanager installed./>

## Features:
<br -Setup for probably all MC-Versions/>
<br -Autoupdate of Paper for the specified Version/>
<br -creating a backup.zip of the three Vanilla levels; Easy to add more Levels for the backup/>

## Prerequirements:
<br -Debian/linux with ssh-server (Option at Installation with netinstaller)/>

## Installation:
<br -Click on Code/>
<br -Click Download/>
<br -Extract the files/>

### Setting up Linux from Windows via ssh:
<br -Download/Install Putty and connect to your Linux-System (get the Ip with a networkscan app or with your Router)/>
<br -Login in with your normal user/>
<br -Grant access to login with root:/>
<br >sudo apt-get install nano/>
<br >sudo nano /etc/ssh/sshd_config/>
<br change 'PermitRootLogin yes' to 'PermitRootLogin no' or add '#' before it/>
<br >sudo /etc/init.d/ssh restart/>
<br -Close Putty and Reopen it and login with root user (Username: 'root'; password: same as sudo-password)/>
<br -setup the script:/>
<br >"cd /home/USER/" (replace USER with the name of your normal user-account)v
<br >mkdir minecraft/>
<br -Download/Install WinSCP and conntect to your Linux-System/>
<br -Login with your root userv
<br -navigate to /home/USER/minecraft/>
<br -upload the 2 scripts/>
<br -change to Putty:/>
<br >chmod 0744 start.sh loop.sh/>
<br >./start.sh/>

### Change settings in the script:
<br -Open the loop.sh file with your Editor/>
<br The changes you can do are described in the Comments which are the Lines beginning with a "#"/>
