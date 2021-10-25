#!/bin/bash
if [[ `which yum` ]]; then
   yum update -y && yum clean all
elif [[ `which apt` ]]; then
   apt update -y && apt upgrade -y && apt autoclean && apt autoremove
elif [[ `which apk` ]]; then
   apk update -y && apk cache clean
else
   echo "os is don't know"
fi
