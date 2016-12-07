## Containerized NGINX Web Server Based on CentOS 7

FROM centos:latest
MAINTAINER Roozbeh Shafiee <me@roozbeh.cloud>

## system update and package installation
RUN yum -y update; yum clean all
RUN yum -y install haproxy

## manage files, directories and permissions:
ADD ./conf_files/haproxy.cfg /etc/haproxy/haproxy.cfg

EXPOSE 80

## running commands to start services
CMD haproxy -f /etc/haproxy/haproxy.cfg -db
