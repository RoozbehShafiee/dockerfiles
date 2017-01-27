## Containerized NGINX Web Server Based on Amazon Linux

FROM amazonlinux:latest
MAINTAINER Roozbeh Shafiee <me@roozbeh.cloud>

## system update and package installation
RUN yum -y update; yum clean all
RUN yum -y install nginx php70-mysqlnd php70-fpm php70-xml hostname; yum clean all

## edit configuration files
RUN sed -ie 's/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/g' /etc/php-7.0.ini
RUN sed -ie "s|listen = 127.0.0.1:9000|listen = /var/run/php-fpm/php-fpm.sock|g" /etc/php-fpm-7.0.d/www.conf
RUN sed -ie 's/;listen.owner = nobody/listen.owner = nginx/g' /etc/php-fpm-7.0.d/www.conf
RUN sed -ie 's/;listen.group = nobody/listen.group = nginx/g' /etc/php-fpm-7.0.d/www.conf
RUN sed -ie 's/user = apache/user = nginx/g' /etc/php-fpm-7.0.d/www.conf
RUN sed -ie 's/group = apache/group = nginx/g' /etc/php-fpm-7.0.d/www.conf

## manage files, directories and permissions:
ADD ./conf_files/conf.d/*.conf /etc/nginx/conf.d/
ADD ./conf_files/nginx.conf /etc/nginx.conf
ADD ./conf_files/start.sh /start.sh
RUN chmod 755 /start.sh

## volumes and storage
VOLUME ["/data"]

## create phpinfo page
RUN echo "<?php phpinfo(); ?>" >> /data/info.php

## expose port
EXPOSE 80 443

## running commands to start services
CMD ["/start.sh"]
