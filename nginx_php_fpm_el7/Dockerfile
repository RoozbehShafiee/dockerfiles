## Containerized NGINX PHP FPM Web Server Based on EL 7

FROM centos
MAINTAINER Roozbeh Shafiee <me@roozbeh.cloud>

## system update and package installation
RUN yum -y update; yum clean all
RUN yum -y install epel-release; yum clean all
RUN yum -y install nginx php-mysql php-fpm php-mysql pwgen supervisor psmisc net-tools hostname; yum clean all

## edit configuration files
RUN sed -ie 's/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/g' /etc/php.ini
RUN sed -ie "s|listen = 127.0.0.1:9000|listen = /var/run/php-fpm/php-fpm.sock|g" /etc/php-fpm.d/www.conf
RUN sed -ie 's/;listen.owner = nobody/listen.owner = nginx/g’ /etc/php-fpm.d/www.conf
RUN sed -ie 's/;listen.group = nobody/listen.group = nginx/g’ /etc/php-fpm.d/www.conf
RUN sed -ie 's/user = apache/user = nginx/g' /etc/php-fpm.d/www.conf
RUN sed -ie 's/group = apache/group = nginx/g' /etc/php-fpm.d/www.conf

## create phpinfo page
RUN echo "<?php phpinfo(); ?>" >> /usr/share/nginx/html/info.php

## manage files, directories and permissions:
ADD ./conf_files/conf.d/*.conf /etc/nginx/conf.d/
ADD ./conf_files/nginx.conf /etc/nginx.conf
ADD ./conf_files/supervisor-nginx.ini /etc/supervisord.d/nginx.ini
ADD ./conf_files/supervisor-php-fpm.ini /etc/supervisord.d/php-fpm.ini
ADD ./conf_files/start.sh /start.sh
RUN chmod 755 /start.sh

## nginx service deamon off
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

## expose port
EXPOSE 80

## running commands to start services
CMD ["/bin/bash", "/start.sh"]
