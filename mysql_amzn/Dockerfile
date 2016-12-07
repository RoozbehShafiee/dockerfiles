## Containerized MariaDB 10.1 Database Based on Amazon Linux

FROM amazonlinux:latest
MAINTAINER Roozbeh Shafiee <me@roozbeh.cloud>

## system update and package installation
RUN yum -y update; yum clean all
RUN yum -y install mysql56-server https://ftp-stud.hs-esslingen.de/pub/epel//6/x86_64/pwgen-2.07-1.el6.x86_64.rpm

## manage files, directories and permissions:
RUN rm -rf /var/lib/mysql/*
ADD ./conf_files/setup.sh /setup.sh
ADD ./conf_files/run.sh /run.sh
RUN chmod +x /*.sh

## volumes and storage
VOLUME ["/var/lib/mysql"]

## environment variables
ENV TERM dumb

## expose port
EXPOSE 3306

## run commands to start services
CMD ["/run.sh"]
