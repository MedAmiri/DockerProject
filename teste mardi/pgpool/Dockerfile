FROM postgres:9.4
MAINTAINER <Groupe Amiri>

RUN echo 'Acquire::http::proxy "http://10.0.4.2:3128/";' > /etc/apt/apt.conf.d/proxy.conf

RUN  apt-get update \
  && apt-get install -y wget 
  

RUN apt-get update
RUN apt-get install -y postgresql-server-dev-9.4 apache2 libapache2-mod-php5 curl build-essential

RUN wget http://www.pgpool.net/download.php?f=pgpool-II-3.3.3.tar.gz -e http_proxy=10.0.4.2:3128
RUN tar xvfz download.php?f=pgpool-II-3.3.3.tar.gz

RUN apt-get update && apt-get install -y \
    build-essential \
    make \
    gcc

WORKDIR /pgpool-II-3.3.3
RUN ./configure
RUN make
RUN make install

WORKDIR /pgpool-II-3.3.3/sql
RUN make
RUN make install
RUN ldconfig

RUN apt-get install -y apache2 libapache2-mod-php5 curl build-essential

RUN apt-get install -y postgresql-client-common 


ENV work /var/www/html/
WORKDIR $work

RUN wget http://www.pgpool.net/download.php?f=pgpoolAdmin-3.3.1.tar.gz -e http_proxy=10.0.4.2:3128
#RUN mv /download.php?f=pgpoolAdmin-3.3.1.tar.gz /var/www/html/

RUN tar -zxvf download.php?f=pgpoolAdmin-3.3.1.tar.gz
ADD ./install-functions.sh /temp/install-functions.sh

WORKDIR /
#RUN service pgpool2 start

EXPOSE 9999

ADD ./pcp.conf /usr/local/etc/pcp.conf
RUN chmod 666 /usr/local/etc/pcp.conf
ADD ./pgpool.conf /usr/local/etc/pgpool.conf
RUN chmod 666 /usr/local/etc/pgpool.conf
ADD ./pool_hba.conf /usr/local/etc/pool_hba.conf

RUN touch /var/log/postgresql/pgpool_status && chown root:postgres /var/log/postgresql/pgpool_status && \
		chmod 0664 /var/log/postgresql/pgpool_status



RUN chmod 777 /var/www/html/pgpoolAdmin-3.3.1/templates_c
RUN chmod 777 /var/www/html/pgpoolAdmin-3.3.1/conf/pgmgt.conf.php

#RUN service apache2 start
ENTRYPOINT ["/bin/sh", "-c"]
CMD ["pgpool && while true; do sleep 1000; done"]

