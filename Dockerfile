# Front Nginx

FROM ubuntu:latest

ADD ./install-nginx.sh /tmp/install-nginx.sh
RUN /bin/bash /tmp/install-nginx.sh

ADD ./nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

VOLUME ["/www"]

CMD ["/usr/sbin/nginx", "-c", "/etc/nginx/nginx.conf"]
