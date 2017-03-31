Run MySQL in windows container example
======================================

# build image

> build image xjimmyshcn/nanoserver-mysql from base microsoft/nanoserver

```
$ ./build.sh

$ docker images
REPOSITORY                    TAG                 IMAGE ID            CREATED             SIZE
xjimmyshcn/nanoserver-mysql   latest              a2431650609a        14 hours ago        2.91 GB
microsoft/nanoserver          latest              18a0d32a4b98        3 weeks ago         1 GB
```

# run container
```
$ ./run.sh
----- remove old container nano-mysql -----
----- run new container nano-mysql -----
2833c88225f70c351f2b149166c22a4bb9216614f132ee4691579e6c12d3bf53
----- show container nano-mysql ------
CONTAINER ID     IMAGE                         COMMAND               CREATED             STATUS                  PORTS                     NAMES
2833c88225f7     xjimmyshcn/nanoserver-mysql   "ping localhost -t"   23 seconds ago      Up Less than a second   0.0.0.0:61062->3306/tcp  
```

# execute cmd in container
```
$ ./exec.sh
----- show mysql version -----
mysql  Ver 14.14 Distrib 5.6.29, for Win64 (x86_64)

----- show MySQL Service in windows registry -----
HKEY_LOCAL_MACHINE\system\CurrentControlSet\Services\MySQL
    Type    REG_DWORD    0x10
    Start    REG_DWORD    0x2
    ErrorControl    REG_DWORD    0x1
    ImagePath    REG_EXPAND_SZ    C:\mysql-5.6.29-winx64\bin\mysqld.exe MySQL
    DisplayName    REG_SZ    MySQL
    ObjectName    REG_SZ    LocalSystem

----- show process -----
Handles  NPM(K)    PM(K)      WS(K)     CPU(s)     Id  SI ProcessName
-------  ------    -----      -----     ------     --  -- -----------
      0       5     1048       4488       0.17   1272   1 CExecSvc <<<<<<<<
      0       6      692       1900       3.11    904   1 csrss
      0       0        0          4                 0   0 Idle
      0      17     2620       8744       0.95    980   1 lsass
      0      15   585400     450004       2.50   1340   1 mysqld <<<<<<<<
      0       5      692       3432       0.14   1452   1 PING
      0      37    46732      69848       2.52   1804   1 powershell
      0       9     1984       5304       0.61    960   1 services
      0       3      324       1128       1.05    864   0 smss
      0      14     5544      10032       0.63     72   1 svchost
      0       8     1832       5780       0.28    288   1 svchost
      0      13     1536       5992       0.13    552   1 svchost
      0      11     2692       8912       0.30   1048   1 svchost
      0       6     1384       4724       0.05   1096   1 svchost
      0      27     5692      12420       0.42   1124   1 svchost
      0      11     2912       9176       0.53   1240   1 svchost
      0       0      128        128       4.98      4   0 System
      0       8     1372       4232       0.28    932   1 wininit
```

# enter container
```
$ docker exec -it nano-mysql powershell
```

# show container ip
```
$ docker inspect nano-mysql | grep -i IPAddress
            "SecondaryIPAddresses": null,
            "IPAddress": "",
                    "IPAddress": "172.20.50.232",
```

# connect to mysqld with MySQL Workbench

download link: https://dev.mysql.com/downloads/workbench/

```
//connection information
  hostname: 172.20.50.232
  port: 3306
  username: root
  password: <empty>
```
