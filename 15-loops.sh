#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/clscript-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

VALIDATE(){
   if [ $1 -ne 0 ]
    then  
        echo -e "$2....$R Failure $N"
        exit 1
    else 
        echo -e "$2.....$G success$N"
    fi  
}
echo "script started executing at: $TIMESTAMP" &>>$LOG_FILE_NAME
if [ $USERID -ne 0 ]
then
    echo "ERROR:: You must have sudo access to execute the script"
    exit 1 #other than 0
fi

for package in $@
do 
    dnf list installed $package &>>LOG_FILE_NAME
    if [ $? -ne 0 ]
    then 
         dnf install $package -y &>>LOG_FILE_NAME
         VALIDATE $? "Installing $package"
    else 
         echo -e "$package is already ... $Y instaled $N"
    fi     

done 