#!/bin/bash
#5- write bash script to perform calculator operations

read -p "Enter First Number : " Num1
read -p "Enter Second Number: " Num2
read -p "Enter The operator : " ope

if [ "$ope" = "+" ];then
    result=$(( Num1 + Num2))
    echo "Result= $result "
elif [ "$ope" = "-" ];then
    result=$(( Num1 - Num2 ))
    echo "Result= $result"
elif [ "$ope" = "*" ];then
    result=$(( Num1 * Num2 ))
    echo "Result= $result"
elif [ "$ope" = "/" ];then
    result=$(( Num1 / Num2 ))
    echo "Result= $result"
elif [ "$ope" = "%" ];then
    result=$(( Num1 % Num2 ))
    echo "Result= $result"
else
    echo "Try again please!"
    echo "Goodbye"
fi