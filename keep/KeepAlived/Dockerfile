FROM nginx

MAINTAINER <groupe Amiri>
#ENV http_proxy http://10.0.4.2:3128
#ENV https_proxy https://10.0.4.2:3128
#ENV no_proxy localhost,127.0.0.1,.sock
 
#Proxy use for apt-get update
#RUN  echo 'Acquire::http { Proxy "http://10.0.4.2:3128"; };' >> /etc/apt/apt.conf.d/01proxy
#RUN  echo 'Acquire::https { Proxy "http://10.0.4.2:3128"; };' >> /etc/apt/apt.conf.d/01proxy

RUN apt-get update -y && \
  apt-get upgrade -y
RUN apt-get install keepalived -y

ADD entrypoint.sh /
ADD keepalived/ /etc/keepalived/
ADD config_keepalived.sh /

RUN chmod +x /config_keepalived.sh
RUN chmod +x /entrypoint.sh


ENTRYPOINT ["/entrypoint.sh"]
