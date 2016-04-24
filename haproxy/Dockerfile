FROM debian
MAINTAINER <groupe Amiri>
RUN \
echo "deb http://ftp.debian.org/debian/ wheezy-backports main" >> /etc/apt/sources.list && \
apt-get update && \
apt-get install -y  haproxy
RUN sed -i "s/ENABLED=0/ENABLED=1/g" /etc/default/haproxy && \
sed -i "s/ENABLED=0/ENABLED=1/g" /etc/init.d/haproxy
ADD haproxy.cfg /etc/haproxy/haproxy.cfg
ADD start.sh /usr/bin/start.sh
RUN chmod 755 /usr/bin/start.sh
CMD ["start.sh"]
EXPOSE 80
EXPOSE 456
