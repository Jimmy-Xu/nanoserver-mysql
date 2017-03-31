#!/bin/bash

echo "##########################################"
echo "# run this script in git bash of windows #"
echo "##########################################"

echo "----- show mysql version -----"
winpty docker exec -it nano-mysql mysql --version

echo "----- show MySQL Service in windows registry -----"
winpty docker exec -it nano-mysql powershell 'REG QUERY HKLM\system\CurrentControlSet\Services\MySQL'

echo "----- show process -----"
winpty docker exec -it nano-mysql powershell Get-Process
