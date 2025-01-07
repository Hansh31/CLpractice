#!/bin/bash


USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"

VALIDATE(){
   if [ $1 -ne 0 ]
    then  
        echo -e "$2....$R Failure"
        exit 1
    else 
        echo -e "$2.....$G success"
    fi  
}

if [ $USERID -ne 0 ]
then
    echo "ERROR:: You must have sudo access to execute the script"
    exit 1 #other than 0
fi

dnf list installed mysql 

if [ $? -ne 0 ]
then # not installed 
    dnf install mysql -y
    VALIDATE $? "Installing mysql"
else 
     echo -e "MySQL is already ...$Y installed"
fi

dnf list installed git
 if [ $? -ne 0 ]
 then # not installed 
    dnf install git -y
    VALIDATE $? "Installing git"
else 
     echo -e "Git is already ....... $Y installed"
fi
