#!/bin/bash

if [ -f /etc/os-release ]; then
  . /etc/os-release
  echo "Detected OS: $NAME"
elif [ -f /etc/issue ]; then
  OS_NAME=$(cat /etc/issue | awk '{print $1}')
  echo "Detected OS: $OS_NAME"
else
  echo "Unable to determine the operating system."
fi
