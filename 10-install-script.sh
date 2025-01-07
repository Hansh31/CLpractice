#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR:: You must have sudo access to execute the script"
    exit 1 #other than 0
fi

dnf list installed mysql 

if [ $? -ne 0 ]
then # not installed 
    dnf install mysql -y
    if [ $? -ne 0 ]
    then  
        echo "installing mysql....Failure"
        exit 1
    else 
        echo "installing mysql.....success"
    fi 
else 
     echo "MySQL is already ... installed"
fi
# if [ $? -ne 0 ]
# then  
#      echo "installing mysql....Failure"
#      exit 1
# else 
#      echo "installing mysql.....success"
# fi 
dnf list installed git
 if [ $? -ne 0 ]
 then # not installed 
    dnf install git -y
    if [ $? -ne 0 ]
    then  
        echo "installing git....Failure"
        exit 1
    else 
        echo "installing git.....success"
    fi 
else 
     echo "Git is already ....... installed"
fi
# if [ $? -ne 0 ]
# then  
#      echo "installing git....Failure"
#      exit 1
# else 
#      echo "installing git.....success"
# fi