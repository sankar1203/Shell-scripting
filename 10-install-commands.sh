#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR: Please run this script with root access"
    exit 1   #give  otherthan 0 upto 127
else
    echo "you are running with root access"
fi

dnf install mysqldgfgh -y

if [ $? -eq 0 ]
then
    echo "Installing MYSQL is ... Success"
else
    echo "Installing MYSQL is ... failure"
    exit 1
fi