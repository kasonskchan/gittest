###Docker###
#docker run to container
docker run --name R-Test-rstudio -p 42000:8787 --network Test -e PASSWORD=yoya80791 rocker/rstudio
docker run --name R-Test-Shinyapp --network Test -p 42100:3838 -d shinyapp:latest
docker run \
    --name R-Test2-Shinyapp --network bridge1 \
    -p 42101:3838 \
    -v /srv/shinyapps/:/srv/shiny-server/ \
    -v /srv/shinylog/:/var/log/shiny-server/ \
    --dns 10.189.128.36 \
    shinyapp:20200310v63
    #\-d \
    #\--rm

docker run --rm -d -p 42001:8787 -e PASSWORD=yoya80791 kason/rstudio:20200401v02

docker run --rm --dns 10.189.128.36 -d -p 42002:8787 -e PASSWORD=yoya80791 --name rstudio02 rocker/rstudio:latest

#docker pull from hub
docker pull rstudio/r-base:3.6.2-opensuse42

#docker build
docker build --rm --network bridge1 -t innolux_fs/flask_dataapi:dev000 //home/hsinyuan.lin/app/dataapi/Flask_DataApi
docker build --network bridge1 -t shinyapp:20200310v63 .
docker build --network bridge1 -t kason/rstudio:20200401v02 .


#add user on RStudio
docker exec -it <container-id> bash

#rstudio:42000
docker exec -it 416fff205f6029ce0995184817c0c12ac63c8fc7704e3bfdf60a48851111ce22 bash

#rstudio:42001
docker exec -it 8805225918ca61e43fb4d1ff9cd38fe60e2e0b1eb78f1f31bde6fd05612b53cc bash

#rstudio:42002
docker exec -it 31b9fe9cc3c0cc1d537b7c623f01e519b602cb141ea3a8ac81879d48dcfcc5e1 bash


#Shiny server
docker exec -it 0b9739c397347ad2d29c074bec5ce0b1d6bc779fd6a2bc20bb18bccf58f91daa bash



adduser <username>
###Docker###


vim /etc/resolv.conf
nameserver 10.189.128.36

