@echo off
docker run -p 8080:8080 --privileged=true -v %cd%/webapps:/usr/local/tomcat/webapps/ -v %cd%/logs:/usr/local/tomcat/logs/ --name mall-tomcat --link mall-redis:mall_redis --link mall-mysql:mall_db -d tomcat