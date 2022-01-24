# Papermc-AIO-Script
This script is made for Debian (min. stable) and Debian based Distros. Might also work on other linux distros with apt-packagemanager installed.

WARNING: This script runs the Server with root. Only use on private servers. [Read here](https://madelinemiller.dev/blog/root-minecraft-server/)

If you want to use it on public servers:
- change the line where server.jar gets executed to (Change USER to your USERNAME)

```bash
sudo -u USER java -Xms2G -Xmx2500M -XX:+IgnoreUnrecognizedVMOptions -XX:+UnlockExperimentalVMOptions -XX:+UnlockDiagnosticVMOptions -XX:-OmitStackTraceInFastThrow -XX:+ShowCodeDetailsInExceptionMessages -XX:+DisableExplicitGC -XX:-UseParallelGC -XX:+PerfDisableSharedMem -XX:+UseZGC -XX:-ZUncommit -XX:ZUncommitDelay=300 -XX:ZCollectionInterval=5 -XX:ZAllocationSpikeTolerance=2.0 -XX:+ExitOnOutOfMemoryError -XX:+AlwaysPreTouch -XX:-DontCompileHugeMethods -XX:+TrustFinalNonStaticFields -XX:+UseFastUnorderedTimeStamps -XX:+UseTransparentHugePages -XX:LargePageSizeInBytes=2M -XX:+UseLargePages -XX:+UseCMoveUnconditionally -XX:+UseNewLongLShift -XX:+UseVectorCmov -XX:+UseXmmI2D -XX:+UseXmmI2F -XX:+ParallelRefProcEnabled -jar server.jar nogui
```

## Features:
- Setup for probably all MC-Versions
- Autoupdate of Paper for the specified Version
- creating a backup.zip of the three Vanilla levels; Easy to add more Levels for the backup
- Autorestart
- Autoactivate noip2 on startup (deactivated by default)
- creates a serverlog (screenlog.0)

## Prerequirements:
- Debian/linux with ssh-server (Option at Installation with netinstaller)

## Installation:
- Click on Code
- Click Download
- Extract the files

### Setting up Linux from Windows via ssh:
- Download/Install Putty and connect to your Linux-System (get the Ip with a networkscan app or with your Router)
- Login in with your normal user
- Grant access to login with root:
- setup the script:
```bash
sudo mkdir minecraft
```
- Download/Install WinSCP and conntect to your Linux-System
- Login with your normal user
- navigate to /home/USER/minecraft
- upload the 2 scripts
- change to Putty:
```bash
sudo chown -R root:root loop.sh start.sh
```
```bash
sudo chmod 0744 start.sh loop.sh
```
```bash
sudo ./start.sh
```
### Change settings in the script:
- Open the loop.sh file with your Editor

The changes you can do are described in the Comments which are the Lines beginning with a "#"

### Optional
- Create a Account at noip.com and create a new hostname
- Install noip2 https://www.noip.com/support/knowledgebase/installing-the-linux-dynamic-update-client-on-ubuntu/
- Forward TCP/UDP Port 25565 to your Debian/Linux System in your Routers settings
- uncomment the /usr/local/bin/noip2 in loop.sh

## USEAGE
- if you enter /stop into the chat of the Minecraft server it stops, makes the backup, updates PaperMC and Starts again
- if you want to start the server use Putty and login with your root-user
```bash
cd /home/USER/minecraft (replace USER with the name of your normal user-account)
```
```bash
sudo ./start.sh
```
- if you want to login to the serverconsole while the server is running use Putty and login with your root-user
```bash
screen -r
```
