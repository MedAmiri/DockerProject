FROM postgres:9.4
MAINTAINER <Groupe Amiri>

## installation and update 
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y postgis
RUN apt-get clean && apt-get autoremove

## define the postgres logging
ENV POSTGRES_USER docker
ENV POSTGRES_PASSWORD docker
ENV POSTGRES_DB dockerdb

## starting the postgres service  
ADD initdb.sh /docker-entrypoint-initdb.d/
RUN chmod 777 /docker-entrypoint-initdb.d/initdb.sh
RUN /docker-entrypoint-initdb.d/initdb.sh

EXPOSE 5432
CMD[]
