#!/bin/bash
scriptpath=$(readlink -f autoupdatescript.sh)
if [[ `ls /usr/bin/yum` ]]; then
   yum update -y && yum install cronie -y && yum clean all
   echo "* 1 * * * $scriptpath" >> /var/spool/cron/root
elif [[ `which apt` ]]; then
   apt update && apt upgrade -y && apt install cron && apt autoclean && apt autoremove
   echo "* 1 * * * $scriptpath" >> /var/spool/cron/crontabs/root
elif [[ `which apk` ]]; then
   apk update
   echo "* 1 * * * $scriptpath" >> /etc/crontabs/root
else
   echo "os is don't know"
fi
