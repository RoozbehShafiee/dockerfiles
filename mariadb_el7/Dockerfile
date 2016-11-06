## Containerized MariaDB 10.1 Database Based on CentOS 7

FROM centos
MAINTAINER Roozbeh Shafiee <me@roozbeh.cloud>

# add repository
ADD ./conf_files/MariaDB.repo /etc/yum.repos.d/

## system update and package installation
RUN yum -y update; yum clean all
RUN yum -y install epel-release; yum clean all
RUN yum -y install MariaDB-server pwgen

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
