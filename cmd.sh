##啟動bokeh服務並指定執行ip
bokeh serve fs_cmm_bokeh.py --port 5006 --allow-websocket-origin=10.189.127.64:5006

#執行python file
python pythonfile.py

#安裝python package
python setup.py install

#模糊搜尋檔名為fs_cmm_bokeh的檔案
hdfs dfs -ls -R / | grep  fs_cmm_bokeh

#查找port為40開頭的所有狀態
lsof -i -P -n | grep *:40

#查找port為8888的所有狀態
lsof -i :8888 | grep LISTEN

#刪除進程
kill [PID]

#建立windows shared folder from linux
mount -t cifs //10.189.65.70/DataLake/BLC/MCF/MESLOAD -o username=Administrator,password="a.123456",vers=2.1 /mnt/MESLOAD

#列出所有用戶名稱
awk -F':' '{ print $1}' /etc/passwd

#停掉RStudio服務（要加sudo）（/start/restart）
sudo rstudio-server stop

#查rstudio下的process
ps -ef|grep  rstudio

#開通Rstudio帳號的方法
1. root 登入Rserver (10.189.127.62)
2. 新增用戶並加入rstudio Group # useradd -G rstudio-users -p 密碼 帳號
3. 密碼明碼化 # passwd 帳號
4. 輸入密碼兩次

#Server CPU
vmstat 1

#Server Memory
cat /proc/meminfo
free

#mount FTP
curlftpfs -o codepage=utf8 ftp://mesautodn:mesautodn2016@10.178.1.55/Datalake_Fileserver/BLC/MCF/EQPREPORT/ /mnt/NH_SPM_FRAME

#啟用jupyter服務
jupyter notebook --ip=fsrserver --port=8888 --notebook-dir="/home/dev.user/user/" --allow-root --no-browser &

#批量刪除thumb開頭的jpg
find /home/dev.user/user/ -name 'thumb*.jpg' -exec rm -rf '{}' \;

#安裝R Package
sudo R CMD INSTALL package.tar.gz

#查看MOUNTS
grep 'SMT' /proc/mounts

#重新配置Rstudio 8787 port
1) check the process that used 8787
sudo fuser 8787/tcp
2) with the -k option to kill all process
sudo fuser -k 8787/tcp
3) start rstudio-server
sudo rstudio-server start

#查詢已啟動所有服務
netstat -tlunp

#查詢正在监听端口命令
netstat -nltp

#尋找/hadoop/hdfs/journal/ns/下txt結尾的檔案
find /hadoop/hdfs/journal/ns/ -name *.txt

#查找服務
ps -aux | grep ambari-server

#ambari重啟
ambari-server restart