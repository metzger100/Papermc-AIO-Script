#!/bin/bash

BINDIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
cd "$BINDIR"

echo "\033]0;minecraft\007"

#INSTALLING NEEDED PACKAGES AND CLEANING UP
apt -y install screen curl jq wget zip openjdk-17-jdk
apt -y autoremove

#STARTING NOIP2-SERVICE (REMOVE "#" IF YOU WANT TO USE)

#/usr/local/bin/noip2

#STARTING LOOP
while true
do

#EULA-CHECK
EULA="$BINDIR"/eula.txt
if [ -f "$EULA" ]; then
 echo 'ERROR: Eula already exists. If Error appears set eula "true" by hand'
else
 cd "$BINDIR"
 sh -c 'echo "eula=true" >> eula.txt'
 echo 'Eula accepted!'
fi

#PAPER-UPDATE (CHANGE version_group TO USE ANOTHER VERSION OF MINECRAFT (e.g: version_group=1.16); DON'T CHANGE WHEN WORLD IS ALREADY CREATED)
cd "$BINDIR"
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

#BACKUP (TO BACKUP MORE LEVELS ADD THE NAME OF THE WORLD-LEVEL-FOLDER BEHIND "world_the_end" IN QOUTES)
echo 'Backup starts! This can take a view minutes!'

DIR="$BINDIR/backup/"

if [ -d "$DIR" ]; then
rm -r $BINDIR/backup
echo 'Old Backup removed!'
fi

mkdir $BINDIR/backup/
zip -r "$BINDIR/backup/backup.zip" "world" "world_nether" "world_the_end"

echo 'New Backup saved in /backup/!'

#SERVERSTART (CHANGE Xms AND Xmx TO INCREASE/DECREASE MEMORY USAGE)
cd "$BINDIR"
java -Xms2G -Xmx2500M -XX:+IgnoreUnrecognizedVMOptions -XX:+UnlockExperimentalVMOptions -XX:+UnlockDiagnosticVMOptions -XX:-OmitStackTraceInFastThrow -XX:+ShowCodeDetailsInExceptionMessages -XX:+DisableExplicitGC -XX:-UseParallelGC -XX:+PerfDisableSharedMem -XX:+UseZGC -XX:-ZUncommit -XX:ZUncommitDelay=300 -XX:ZCollectionInterval=5 -XX:ZAllocationSpikeTolerance=2.0 -XX:+ExitOnOutOfMemoryError -XX:+AlwaysPreTouch -XX:-DontCompileHugeMethods -XX:+TrustFinalNonStaticFields -XX:+UseFastUnorderedTimeStamps -XX:+UseTransparentHugePages -XX:LargePageSizeInBytes=2M -XX:+UseLargePages -XX:+UseCMoveUnconditionally -XX:+UseNewLongLShift -XX:+UseVectorCmov -XX:+UseXmmI2D -XX:+UseXmmI2F -XX:+ParallelRefProcEnabled -jar server.jar nogui

echo 'Want to stop Server? Press ctrl + c in the next 5 seconds!'
echo "Rebooting in:"
for i in 5 4 3 2 1
do
echo "$i..."
sleep 1
done
echo 'Server restarts!'
done

