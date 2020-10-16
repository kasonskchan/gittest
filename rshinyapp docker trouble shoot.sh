>>ERROR: dependency ‘httr’ is not available for package ‘plotly’

httr depends on the openssl and curl package. The openssl package needs as system requirement libssl-dev

------------------------- ANTICONF ERROR ---------------------------
Configuration failed because openssl was not found. Try installing:
 * deb: libssl-dev (Debian, Ubuntu, etc)
...
The curl package needs as system requirement libcurl4-openssl-dev:

------------------------- ANTICONF ERROR ---------------------------
Configuration failed because libcurl was not found. Try installing:
 * deb: libcurl4-openssl-dev (Debian, Ubuntu, etc)
...
So, to install you will need to run:

sudo apt-get install libssl-dev libcurl4-openssl-dev
afterwards install.packages("plotly") should work.


#--------------------------------------------------
>>exec: \"/usr/bin/shiny-server.sh\": permission denied

When building the image with the current Dockerfile and subsequently starting a container I get the above message. I have fixed this myself by adding

RUN ["chmod", "+x", "/usr/bin/shiny-server.sh"]
to the Dockerfile. I am not sure if this problem is specific to me, but I just wanted to notify you guys.

#--------------------------------------------------
>>standard_init_linux.go:195: exec user process caused "no such file or directory"

原来是dos字符与unix字符的问题。
原因是我使用的Notepad++默认是以DOS文本格式来创建的，所以才导致这样的问题。
使用以下命令确认是不是这个原因：
cat -v run-lamp.sh 
#!/bin/bash^M
^M
# enable php short tags:^M
/bin/sed -i "s/short_open_tag\ \=\ Off/short_open_tag\ \=\ On/g" /etc/php.ini^M
^M
就是^M这个造成的问题。
解决方法：
安装dos2unix
 yum install dos2unix
将相关文件转换一下字符即可：
dos2unix Dockerfile
dos2unix run-lamp.sh
重新build可以正常运行了。


#--------------------------------------------------
>>Warning messages:
1: In install.packages(c("rJava", "RJDBC")) :
  installation of package ‘rJava’ had non-zero exit status
2: In install.packages(c("rJava", "RJDBC")) :
  installation of package ‘RJDBC’ had non-zero exit status

RUN apt-get update && apt-get install -y \
    r-cran-rjava \
    default-jdk 
RUN R CMD javareconf  && \
    R -e "install.packages(c('rJava', 'RJDBC'))" 


#--------------------------------------------------
>>Warning: Error in .jfindClass: java.lang.ClassNotFoundException
  54: <Anonymous>
Error in .jfindClass(as.character(driverClass)[1]) :
  java.lang.ClassNotFoundException

RUN mkdir -p /usr/
COPY phoenix-4.7.0.2.6.2.0-205-client.jar /usr/


#--------------------------------------------------
>>log4j:WARN No appenders could be found for logger (org.apache.hadoop.metrics2.lib.MutableMetricsFactory).
log4j:WARN Please initialize the log4j system properly.
log4j:WARN See http://logging.apache.org/log4j/1.2/faq.html#noconfig for more info.
Warning: Error in .jcall: java.sql.SQLException: ERROR 103 (08004): Unable to establish connection.
  56: <Anonymous>
Error in .jcall(drv@jdrv, "Ljava/sql/Connection;", "connect", as.character(url)[1],  :
  java.sql.SQLException: ERROR 103 (08004): Unable to establish connection.

docker run
    --dns 10.189.128.36



#--------------------------------------------------
>>Warning: unable to access index for repository http://cran.rstudio.com/src/contrib:
  cannot open URL 'http://cran.rstudio.com/src/contrib/PACKAGES'

In R studio go at: Tools > Global Options > packages > uncheck the option: "Use secure download for HTTP". Only check the options: "Enable packages pane" and "Use Internet Explorer library/proxy for HTTP"



#--------------------------------------------------
>>rJava, RJDBC

apt-get update && apt-get install -y \
    sudo \
    gdebi-core \
    pandoc \
    pandoc-citeproc \
    libcairo2-dev \
    libxt-dev \
    xtail \
    wget \
    libssl-dev \
    libcurl4-openssl-dev \
    ant \
    r-cran-rjava \
    libssh2-1-dev \
    libpq-dev \
    zlib1g-dev \
    default-jdk \
    default-jre \
    openjdk-8-jdk

R CMD javareconf  && \
  R -e "install.packages(c('rJava', 'RJDBC'), repos='http://cran.rstudio.com/', dependencies=TRUE)"

docker cp phoenix-4.7.0.2.6.2.0-205-client.jar 416fff205f6029ce0995184817c0c12ac63c8fc7704e3bfdf60a48851111ce22:/usr/
docker cp gcc-4.8.5.tar.gz 416fff205f6029ce0995184817c0c12ac63c8fc7704e3bfdf60a48851111ce22:/usr/gccfile2/

docker cp gcc-6.3.0.tar.gz 416fff205f6029ce0995184817c0c12ac63c8fc7704e3bfdf60a48851111ce22:/usr/local/



#--------------------------------------------------
>>log4j:WARN No appenders could be found for logger (org.apache.hadoop.metrics2.lib.MutableMetricsFactory).
log4j:WARN Please initialize the log4j system properly.
log4j:WARN See http://logging.apache.org/log4j/1.2/faq.html#noconfig for more info.
Exception: java.lang.StackOverflowError thrown from the UncaughtExceptionHandler in thread "process reaper"