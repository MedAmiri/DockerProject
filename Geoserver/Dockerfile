FROM tomcat:8.0
MAINTAINER <groupe AMIRI>
# Paramètres du poxy, enlever si besoin
RUN export http_proxy="http://10.0.4.2:3128/";
RUN export https_proxy="https://10.0.4.2:3128/";
RUN echo 'Acquire::http::proxy "http://10.0.4.2:3128/";' >> /etc/apt/apt.conf
RUN echo 'Acquire::https::proxy "https://10.0.4.2:3128/";' >> /etc/apt/apt.conf
# Mise à jouer
RUN apt-get update && apt-get upgrade -y
# Installation de geoserver
ENV work /usr/local/tomcat
RUN wget http://netcologne.dl.sourceforge.net/project/geoserver/GeoServer/2.8.2/geoserver-2.8.2-war.zip -e http_proxy=10.0.4.2:3128
RUN unzip $work/geoserver-2.8.2-war.zip 
RUN mv $work/geoserver.war $work/webapps/
RUN sh $work/bin/startup.sh
# On expose le port sur lequel fonctionne le geoserver
EXPOSE 8080
