FROM postgres:9.4
MAINTAINER <Groupe Amiri>

RUN  apt-get update \
  && apt-get install -y wget \
  && rm -rf /var/lib/apt/lists/*

RUN apt-get update
RUN apt-get install -y apache2 libapache2-mod-php5 curl build-essential

RUN apt-get update && apt-get install -y \
    build-essential \
    postgresql-server-dev-9.4 \
    libxml2-dev \
    libgdal-dev \
    libproj-dev \
    libjson0-dev \
    xsltproc \
    docbook-xsl \
    docbook-mathml \
    libpcre3-dev \
    cmake \
    libcgal-dev \
    openscenegraph \
    libopenscenegraph-dev \
    imagemagick \
    wget

#latest osgeo
RUN wget http://download.osgeo.org/geos/geos-3.5.0.tar.bz2; \
    tar xfj geos-3.5.0.tar.bz2; \
    cd geos-3.5.0; \
    ./configure; \
    make -j; \
    make install; \
    cd ..; \
    rm -rf geos-3.5.0*

#latest sfcgal
RUN wget https://github.com/Oslandia/SFCGAL/archive/v1.2.0.tar.gz; \
    tar vzxf v1.2.0.tar.gz; \
    cd SFCGAL-1.2.0; \
    cmake .; \
    make -j 2; \
    make install; \
    cd ..; \
    chmod 755 /usr/local/lib/libSFCGAL.*; \
    rm -rf v1.2.0.tar.gz; \
    rm -rf SFCGAL-1.2.0

RUN wget http://download.osgeo.org/postgis/source/postgis-2.2.0.tar.gz; \
    tar xvzf postgis-2.2.0.tar.gz; \
    cd postgis-2.2.0; \
    ./configure --with-raster --with-topology --with-sfcgal=/usr/local; \
    make -j; \
    make install; \
    cd ..; \
    rm -rf postgis-2.2.0*

RUN ldconfig

ADD update-pgconf.sh /docker-entrypoint-initdb.d/

########################################################

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
RUN apt-get install -y apache2 libapache2-mod-php5 curl build-essential

RUN apt-get install -y wget \
  && rm -rf /var/lib/apt/lists/*

ENV work /var/www/html/
WORKDIR $work

RUN wget http://www.pgpool.net/download.php?f=pgpoolAdmin-3.3.1.tar.gz
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
CMD ["/usr/var/apache2 && pgpool && while true; do sleep 1000; done"]

