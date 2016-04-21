FROM ubuntu
MAINTAINER <.....>

RUN  apt-get update \
  && apt-get install -y wget \
  && rm -rf /var/lib/apt/lists/*

RUN wget http://www.pgpool.net/download.php?f=pgpool-II-3.3.3.tar.gz
RUN tar xvfz download.php?f=pgpool-II-3.3.3.tar.gz

RUN apt-get update && apt-get install -y \
    build-essential \
    make \ 
    libpq-dev \
    gcc

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


EXPOSE 9999
ENTRYPOINT ["/bin/sh", "-c"]
CMD ["pgpool && while true; do sleep 1000; done"]

