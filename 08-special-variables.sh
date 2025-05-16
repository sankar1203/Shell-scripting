#!/bin/bash

echo "Load all the variables in shell : $@"
echo "no of variables passed: $#"
echo "script name: $0"
echo "present working directory : $PWD"
echo "Home directory of the user who is running the script : $HOME"
echo "Which user running the script : $USER"
echo "PID of the current script : $$"
sleep 10 &
echo "PID of the last command runningin background: $!"
