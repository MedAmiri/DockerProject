FROM ioft/armhf-ubuntu:latest
MAINTAINER groupeAmiri
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install openjdk-7-jre -y
RUN apt-get install wget -y
RUN wget http://mirror.olnevhost.net/pub/apache/tomcat/tomcat-7/v7.0.37/bin/apache-tomcat-7.0.37.tar.gz
RUN tar -zvxf apache-tomcat-7.0.37.tar.gz
RUN mv apache-tomcat-7.0.37 tomcat
RUN ENV work /user/local/tomcat
RUN wget http://netcologne.dl.sourceforge.net/project/geoserver/Geoserver/2.8.2/geoserver-2.8.2-war.zip
RUN unzip $work/geoserver.war $work/webapps/
RUN sh $work/bin/startup.sh

