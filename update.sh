#!/bin/bash

#INSTALLING NEEDED PACKAGES AND CLEANING UP
sudo apt-get update
sudo apt-get -y install screen curl jq wget zip openjdk-17-jdk
sudo apt-get -y autoremove

#STARTING NOIP2-SERVICE (REMOVE "#" IF YOU WANT TO USE)

sudo /usr/local/bin/noip2
