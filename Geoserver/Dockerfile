FROM tomcat:8.0
MAINTAINER AMIRI
RUN apt-get update
RUN apt-get upgrade -y
ENV work /usr/local/tomcat
RUN wget http://netcologne.dl.sourceforge.net/project/geoserver/GeoServer/2.8.2/geoserver-2.8.2-war.zip
RUN unzip $work/geoserver-2.8.2-war.zip 
RUN mv $work/geoserver.war $work/webapps/
RUN sh $work/bin/startup.sh

