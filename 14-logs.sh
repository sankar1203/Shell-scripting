#!/bin/bash

#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOGS_FOLDER=/var/log/shellscript-logs
echo " Logs Folder is : $LOGS_FOLDER"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
echo " Script name is: $SCRIPT_NAME "
LOG_FILE= "$LOGS_FOLDER/$SCRIPT_NAME.log"
echo "Log File IS: $(LOG_FILE)"

mkdir -p $LOGS_FOLDER
echo "Script Started executing at: $(date)" | tee -a $LOG_FILE

if [ $USERID -ne 0 ]
then
    echo -e "$R ERROR: Please run this script with root access" | tee -a $LOG_FILE
    exit 1   #give  otherthan 0 upto 127
else
    echo -e "$G you are running with root access $N" | tee -a $LOG_FILE
fi

# Validation function takes input as exit status and what command they tried to install
VALIDATE (){
    if [ $1 -eq 0 ]
    then
        echo -e "Installing $2 is.. $G success $N" | tee -a $LOG_FILE
    else
        echo -e "Installing $2 is.. $R failure $N" | tee -a $LOG_FILE
        exit 1
    fi
}

dnf list installed mysql &>>$LOG_FILE
if [ $? -ne 0 ]
then
    echo "MySQL is not installed ... Going to install on it" | tee -a $LOG_FILE
    dnf install mysql -y &>>$LOG_FILE
    VALIDATE $? "MYSQL"
else
    echo -e "$Y MySQL is already installed... nothing to do $N" | tee -a $LOG_FILE
fi

dnf list installed python3 &>>$LOG_FILE
if [ $? -ne 0 ]
then
    echo "python3 is not installed ... Going to install on it" | tee -a $LOG_FILE
    dnf install python3 -y &>>$LOG_FILE
    VALIDATE $? "python3"
else
    echo -e "$Y python3 is already installed... nothing to do $N" | tee -a $LOG_FILE
fi

dnf list installed nginx &>>$LOG_FILE
if [ $? -ne 0 ]
then
    echo "nginx is not installed ... Going to install on it" | tee -a $LOG_FILE
    dnf install nginx -y &>>$LOG_FILE
    VALIDATE $? "nginx"
else
    echo -e "$Y nginx is already installed... nothing to do $N" | tee -a $LOG_FILE
fi