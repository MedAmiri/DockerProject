#! /bin/bash

/etc/init.d/haproxy start
exec haproxy -f /etc/haproxy/haproxy.cfg
