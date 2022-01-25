#!/bin/bash
#INSTALLING NEEDED PACKAGES AND CLEANING UP
apt-get update
apt-get -y install screen curl jq wget zip openjdk-17-jdk
apt-get -y autoremove
#STARTING NOIP2-SERVICE (REMOVE "#" IF YOU WANT TO USE)
/usr/local/bin/noip2
