FROM postgres:9.4
MAINTAINER <groupe Amiri>
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y postgis
RUN echo "host    all             all             0.0.0.0/0               md5" >> /var/lib/pgsql/9.2/data/pg_hba.conf
RUN echo "host    all             docker          0.0.0.0/0               trust" >> /var/lib/pgsql/9.2/data/pg_hba.conf
RUN echo "listen_addresses = '*'" >> /var/lib/pgsql/9.2/data/postgresql.conf
RUN echo "port = 5432" >> /var/lib/pgsql/9.2/data/postgresql.conf
EXPOSE 5432
