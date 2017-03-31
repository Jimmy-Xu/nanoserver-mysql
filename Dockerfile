FROM microsoft/nanoserver
#REF: https://github.com/Microsoft/Virtualization-Documentation/blob/live/windows-container-samples/mysql/Dockerfile

LABEL Description="NanoServer-MySql" Version="5.6.29"

ADD mysql-5.6.29-winx64 /mysql-5.6.29-winx64

RUN powershell -Command \
    $ErrorActionPreference = 'Stop'; \
    pwd ; dir /

RUN SETX /M Path %path%;C:\mysql-5.6.29-winx64\bin

RUN powershell -Command \
	$ErrorActionPreference = 'Stop'; \
	mysqld.exe --install ; \
	Start-Service mysql ; \
	Stop-Service mysql ; \
	Start-Service mysql

RUN mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '' WITH GRANT OPTION;"

EXPOSE 3306

CMD [ "ping localhost -t" ]
