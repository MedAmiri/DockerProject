FROM ubuntu

MAINTAINER amiri

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y \
            postgresql-9.3 -y \
            postgresql \
	    postgresql-client-9.3 \
            postgresql-contrib-9.3 

RUN apt-get install -y \
            postgis \
            postgresql-9.3-postgis-2.1 \ 
	    postgresql-9.3-pgpool2 \
            postgresql-9.3-postgis-scripts 

EXPOSE 5432
CMD [""]
