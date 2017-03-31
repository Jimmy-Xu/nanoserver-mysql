#!/bin/bash

echo "----- Download MySQL -----"
curl  -C - -O https://cdn.mysql.com//archives/mysql-5.6/mysql-5.6.29-winx64.zip

echo "----- Uncompress MySQL -----"
unzip mysql-5.6.29-winx64.zip

echo "----- Build -----"
docker build -t xjimmyshcn/nanoserver-mysql .
