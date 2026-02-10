#!/bin/bash

#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $USERID -ne 0 ]
then
    echo -e "$R ERROR: Please run this script with root access"
    exit 1   #give  otherthan 0 upto 127
else
    echo -e "$G you are running with root access"
fi

# Validation function takes input as exit status and what command they tried to install
VALIDATE (){
    if [ $1 -eq 0 ]
    then
        echo -e "Installing $2 is.. $G success $N"
    else
        echo -e "Installing $2 is.. $R failure $N"
    exit 1
    fi
}

dnf list installed mysql
if [ $? -ne 0 ]
then
    echo "MySQL is not installed ... Going to install on it"
    dnf install mysql -y
    VALIDATE $? "MYSQL"
else
    echo -e "$Y MySQL is already installed... nothing to do $N" 
fi

dnf list installed python3
if [ $? -ne 0 ]
then
    echo "python3 is not installed ... Going to install on it"
    dnf install python3 -y
    VALIDATE $? "python3"
else
    echo -e "$Y python3 is already installed... nothing to do $N"
fi

dnf list installed nginx
if [ $? -ne 0 ]
then
    echo "nginx is not installed ... Going to install on it"
    dnf install nginx -y
    VALIDATE $? "nginx"
else
    echo -e "$Y nginx is already installed... nothing to do $N"
fi