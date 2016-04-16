FROM postgres:9.4
MAINTAINER <Groupe Amiri>

RUN  apt-get update \
  && apt-get install -y wget \
  && rm -rf /var/lib/apt/lists/*

RUN apt-get update
RUN apt-get install -y postgresql-server-dev-9.4 apache2 libapache2-mod-php5 curl build-essential

RUN wget http://www.pgpool.net/download.php?f=pgpool-II-3.3.3.tar.gz
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

RUN mkdir /var/run/pgpool

ADD ./pgpool.conf /usr/local/etc/pgpool.conf
ADD ./pcp.conf /usr/local/etc/pcp.conf
ADD ./pgpool.conf /usr/local/etc/pgpool.conf
ADD ./pool_hba.conf /usr/local/etc/pool_hba.conf

WORKDIR /
EXPOSE 9999

ADD start.sh /tmp/start.sh
RUN chmod 777 /tmp/start.sh
ENTRYPOINT ["/tmp/start.sh"]
