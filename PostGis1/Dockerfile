FROM postgres:9.4
MAINTAINER <Groupe Amiri>

# Configuration du proxy
RUN export http_proxy="http://10.0.4.2:3128/";
RUN export https_proxy="https://10.0.4.2:3128/";
RUN echo 'Acquire::http::proxy "http://10.0.4.2:3128/";' >> /etc/apt/apt.conf
RUN echo 'Acquire::https::proxy "https://10.0.4.2:3128/";' >> /etc/apt/apt.conf

# Mise à jour et installation de postgis
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y postgis postgresql-9.4-postgis-scripts postgresql-9.4-postgis-2.2 wget
RUN apt-get clean && apt-get autoremove

# Installation de pgpool, ajout du fichier de configuration, voir pg_pool.conf
WORKDIR /home
RUN wget http://www.pgpool.net/download.php?f=pgpool-II-3.4.0.tar.gz -e http_proxy=10.0.4.2:3128
RUN tar xvfz download.php?f=pgpool-II-3.4.0.tar.gz
RUN apt-get install -y libpq-dev postgresql-server-dev-9.4 build-essential
WORKDIR /home/pgpool-II-3.4.0
RUN ./configure
RUN make
RUN make install
RUN mkdir /var/run/pgpool
ADD ./pgpool.conf /usr/local/etc/
WORKDIR /home/pgpool-II-3.4.0/src/sql
RUN make
RUN make install
RUN ldconfig

WORKDIR /


# Ajout du fichier permettant la création de la base de donnée à utiliser
ADD ./initdb.sh /home/
RUN chmod -R 777 /home

EXPOSE 5432
EXPOSE 9999