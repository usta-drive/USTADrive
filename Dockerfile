FROM tomcat:jdk8-adoptopenjdk-hotspot
MAINTAINER mohamed

COPY usta.war /usr/local/tomcat/webapps/
