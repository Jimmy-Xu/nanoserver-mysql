FROM microsoft/nanoserver
#REF: https://github.com/Microsoft/Virtualization-Documentation/blob/live/windows-container-samples/mysql/Dockerfile

LABEL Description="NanoServer-MySql" Version="5.6.29"

# add mysql
ADD mysql-5.6.29-winx64 /mysql-5.6.29-winx64
RUN SETX /M Path %path%;C:\mysql-5.6.29-winx64\bin

RUN powershell -Command \
	$ErrorActionPreference = 'Stop'; \
  dir /

RUN powershell -Command \
	$ErrorActionPreference = 'Stop'; \
	mysqld.exe --install ; \
	Start-Service mysql ; \
	Stop-Service mysql ; \
	Start-Service mysql
RUN mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '' WITH GRANT OPTION;"
EXPOSE 3306

# add virtio driver
ADD virtio-win /virtio-win
RUN powershell -Command \
  $ErrorActionPreference = 'Stop'; \
  pnputil /add-driver 'c:\virtio-win\NetKVM\2k16\amd64\netkvm.inf' /install; \
  pnputil /add-driver 'c:\virtio-win\viostor\2k16\amd64\viostor.inf' /install; \
  pnputil /add-driver 'c:\virtio-win\vioscsi\2k16\amd64\vioscsi.inf' /install

CMD [ "ping localhost -t" ]
