#!/bin/bash

Number1=100
Number2=200

Timestamp=$(date)
echo "Script executed at $Timestamp"
#sum=$Number1+$Number2
SUM=$(($Number1+$Number2))
echo "sum is :$SUM