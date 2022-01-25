#!/bin/bash

#INSTALLING NEEDED PACKAGES AND CLEANING UP
sudo apt update
sudo apt -y install screen curl jq wget zip openjdk-17-jdk
sudo apt -y autoremove

#STARTING NOIP2-SERVICE (REMOVE "#" IF YOU WANT TO USE)

sudo /usr/local/bin/noip2
