#!/bin/bash

USERID=$(id -u)

if [ $USERID -eq 0 ]
then
    echo "ERROR:: You must have sudo access to execute the script"
    exit 1 #other than 0
fi

dnf install mysql -y

if [ $? -ne 0 ]
then  
     echo "installing mysql....Failure"
     exit 1
else 
     echo "installing mysql.....success"
fi 

# dnf install git -y

# if [ $? -ne 0 ]
# then  
#      echo "installing git....Failure"
#      exit 1
# else 
#      echo "installing git.....success"
# fi