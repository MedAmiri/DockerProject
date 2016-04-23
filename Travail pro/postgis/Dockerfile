FROM postgres:9.4

MAINTAINER <.....>

RUN echo 'Acquire::http::proxy "http://10.0.4.2:3128/";' >> /etc/apt/apt.conf.d/proxy.conf

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y postgis postgresql-9.4-postgis-scripts

ADD ./postgresql.conf /etc/postgresql/9.4/main/postgresql.conf
ADD ./pg_hba.conf /etc/postgresql/9.4/main/pg_hba.conf

ADD ./initdb.sh /home/

RUN chmod -R 777 /home
