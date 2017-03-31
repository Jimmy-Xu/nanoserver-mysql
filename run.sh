#!/bin/bash
# run in git-bash of windows

echo "----- remove old container nano-mysql -----"
docker rm -fv nano-mysql >/dev/null 2>&1

echo "----- run new container nano-mysql -----"
docker run -d -P --name nano-mysql xjimmyshcn/nanoserver-mysql

echo "----- show container nano-mysql ------"
docker ps --filter name=nano-mysql
