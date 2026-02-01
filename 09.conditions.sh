#!/bin/bash

Number=$1

# -lt -->less than
# -gt -->greater than
# -eq --> equal
# -ne -->not equal
# space required for expression in if condition

if [ $Number -lt 5 ]
then
    echo "Given number is $Number is lessthan 5"
else
    echo "Given number is $Number is greaterthan 5"
fi