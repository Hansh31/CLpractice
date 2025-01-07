#!/bin/bash


USERID=$(id -u)

VALIDATE(){
   if [ $1 -ne 0 ]
    then  
        echo "$2....Failure"
        exit 1
    else 
        echo "$2.....success"
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
     echo "MySQL is already ... installed"
fi

dnf list installed git
 if [ $? -ne 0 ]
 then # not installed 
    dnf install git -y
    VALIDATE $? "Installing git"
else 
     echo "Git is already ....... installed"
fi