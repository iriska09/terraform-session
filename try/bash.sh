#!/bin/bash

which wget || clear &&  echo "wget not found, installing now..." && yum install wget -y
which zip || clear &&  echo "zip not found, installing now..." && yum install zip -y

systemctl status httpd | grep Active:
if [ $? != 0 ]; then
    yum install httpd -y
    systemctl enable httpd && clear
    read -p "Enter web link address: " link
    cd /tmp/ && wget $link
    unzip $(echo $link | awk -F "/" '{print $9}')
    web_name=$(echo $link | awk -F "/" '{print $9}' | awk -F "." '{print $1}')
    rm -rf $(echo $link | awk -F "/" '{print $9}')
    mv $web_name*/* /var/www/html/
    systemctl restart httpd

else
    echo "Apache Installed checkpoint"
    apache_dir=$(tree /var/www/html/ | tail -n 1)
    if [[ $apache_dir != "0 directories, 0 files" ]]; then 
        echo $apache_dir
        read -p "do you want to remove existing website?: [y/n] " apache
        if [ $apache == "n" ]; then
            echo "Gracefully exiting"
            exit
        elif [ $apache == "y" ]; then 
            echo "Removing existing website"
            rm -rf /var/www/html/*
        else
            echo "Invalid entry, try again"
            exit
        fi 
    fi
        read -p "Enter web link address: " link
        cd /tmp/ && wget $link
        unzip $(echo $link | awk -F "/" '{print $9}')
        web_name=$(echo $link | awk -F "/" '{print $9}' | awk -F "." '{print $1}')
        rm -rf $(echo $link | awk -F "/" '{print $9}')
        mv $web_name*/* /var/www/html/
        systemctl restart httpd
fi