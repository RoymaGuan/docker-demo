FROM openjdk:8-jdk-alpine
FROM tomcat:9.0
MAINTAINER SeanGuan
LABEL name="demo-image-war" version="1.0" author="SeanGuan"
WORKDIR /usr/local/tomcat/webapps
ADD target/docker-demo.war .
COPY . .
EXPOSE 80
CMD ["catalina.sh","run"]
