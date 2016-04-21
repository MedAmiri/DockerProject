FROM ubuntu
MAINTAINER <.....>
RUN echo 'Acquire::http::proxy "http://10.0.4.2:3128/";' >> /etc/apt/apt.conf.d/proxy.conf
RUN  apt-get update \
  && apt-get install -y wget \
  postgres-client \
  postgresql-9.4
  
  


RUN wget http://www.pgpool.net/download.php?f=pgpool-II-3.3.3.tar.gz -e http_proxy=10.0.4.2:3128
RUN tar xvfz download.php?f=pgpool-II-3.3.3.tar.gz

RUN apt-get update && apt-get install -y \
    build-essential \
    make \ 
    libpq-dev \
    gcc \
    postgis postgresql-9.4-postgis-scripts

WORKDIR /pgpool-II-3.3.3
RUN ./configure
RUN make
RUN make install

WORKDIR /

ADD ./pcp.conf /usr/local/etc/pcp.conf
RUN chmod 666 /usr/local/etc/pcp.conf
ADD ./pgpool.conf /usr/local/etc/pgpool.conf
RUN chmod 666 /usr/local/etc/pgpool.conf
ADD ./pool_hba.conf /usr/local/etc/pool_hba.conf

ADD ./postgresql.conf /etc/postgresql/9.4/main/postgresql.conf
ADD ./pg_hba.conf /etc/postgresql/9.4/main/pg_hba.conf

ADD ./initdb.sh /home/

RUN chmod -R 777 /home

EXPOSE 9999
ENTRYPOINT ["/bin/sh", "-c"]
CMD ["pgpool && while true; do sleep 1000; done"]





