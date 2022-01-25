#!/bin/bash

#INSTALLING NEEDED PACKAGES AND CLEANING UP
apt update
apt -y install screen curl jq wget zip openjdk-17-jdk
apt -y autoremove

#STARTING NOIP2-SERVICE (REMOVE "#" IF YOU WANT TO USE)

/usr/local/bin/noip2
