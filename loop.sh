#!/bin/bash

echo "\033]0;minecraft\007"

#STARTING LOOP
while true
do

#EULA-CHECK
EULA=eula.txt
if [ -f "$EULA" ]; then
 echo 'ERROR: Eula already exists. If Error appears set eula "true" by hand.'
else
 sh -c 'echo "eula=true" >> eula.txt'
 echo 'Eula accepted!'
fi

#PAPER-UPDATE (CHANGE version_group TO USE ANOTHER VERSION OF MINECRAFT (e.g: version_group=1.16); DON'T CHANGE WHEN WORLD IS ALREADY CREATED)
rm server.jar
version_group=1.18
name=paper
api=https://papermc.io/api/v2

#Get the version number of the most recent version in the version_group
version="$(curl -sX GET "$api"/projects/"$name"/version_group/"$version_group" -H 'accept: application/json' | jq -r '.versions|last')"

# Get the build number of the most recent build
latest_build="$(curl -sX GET "$api"/projects/"$name"/version_group/"$version_group"/builds -H 'accept: application/json' | jq '.builds [-1].build')"

# Construct download URL
download_url="$api"/projects/"$name"/versions/"$version"/builds/"$latest_build"/downloads/"$name"-"$version"-"$latest_build".jar

# Download file
wget "$download_url" --output-document=server.jar
chmod 755 server.jar
chown $USER:$USER server.jar

#BACKUP (TO BACKUP MORE LEVELS/FILES ADD THE NAME OF THE WORLD-LEVEL-FOLDER/FILENAME BEHIND "plugins" IN QOUTES); FTP-OPTION AVAILABLE; NEXTCLOUD-OPTION AVAILABLE
echo 'Backup starts! This can take a view minutes!'
DIR="backup/"
if [ -d "$DIR" ]; then
 rm -r backup
 echo 'Old Backup removed!'
fi
mkdir backup/
FILE=backup/backup-$(date +"%Y-%m-%d").zip
zip -r $FILE world world_nether world_the_end plugins

#FTP - TO USE IT UNCOMMENT IT AND ENTER THE 4 PROPER SPECIFICATIONS IN THE FOLLOWING 4 LINES
#HOST='yourhost e.g. IP or Address'
#USER='yourusername'
#PASSWD='yourpassword'
#UPLOADDIR='yourpathforthehost(Folders must already exist)'
#lftp -u $USER,$PASSWD -e "set net:max-retries 2; put -O $UPLOADDIR $FILE;quit" $HOST

#NEXTCLOUD - TO USE IT UNCOMMENT IT AND ENTER THE 3 PROPER SPECIFICATIONSIN THE FOLLOWING 3 LINES(https://docs.nextcloud.com/server/18/user_manual/files/access_webdav.html#accessing-files-using-curl)
#HOST='yourhost e.g. https://nextcloud.mydomain.tld/remote.php/dav/files/scannerusername/ScansnapInbox/$filename'
#USER='yourusername'
#PASSWD='yourpassword'
#curl -u $USER:$PASSWD -T $FILE $HOST

echo 'New Backup saved in /backup/ in the server folder!'

#SERVERSTART (CHANGE Xms AND Xmx TO INCREASE/DECREASE MEMORY USAGE)
java -Xms2G -Xmx2500M -XX:+UnlockExperimentalVMOptions -XX:+UseZGC -XX:+ZProactive -XX:ZCollectionInterval=600 -XX:+UseLargePages -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:+ParallelRefProcEnabled -XX:+PerfDisableSharedMem -jar server.jar nogui
echo 'Want to stop Server? Press ctrl + c in the next 5 seconds!'
echo "Rebooting in:"
for i in 5 4 3 2 1
 do
  echo "$i..."
  sleep 1
 done
 echo 'Server restarts!'
done
