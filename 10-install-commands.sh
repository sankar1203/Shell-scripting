#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR: Please run this script with root access"
    exit 1   #give  otherthan 0 upto 127
else
    echo "you are running with root access"
fi

dnf list installed mysql

#check already installed or not.. if installed $? is 0 
#then if not installed  $? is not 0. expression is true
if [ $? -ne 0 ]
then
    echo "Mysql is not installed ... Going on it"
    dnf install mysql -y

 if [ $? -eq 0 ]
 then
     echo "Installing MYSQL is ... Success"
 else
     echo "Installing MYSQL is ... failure"
     exit 1
 fi
else
    echo "Mysql is already installed... nothing to do"
    exit 1
fi

# dnf install mysql -y

# if [ $? -eq 0 ]
# then
#     echo "Installing MYSQL is ... Success"
# else
#     echo "Installing MYSQL is ... failure"
#     exit 1
# fi