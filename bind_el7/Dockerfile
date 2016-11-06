## Containerized Bind Service Based on CentOS 7

FROM centos:latest
MAINTAINER Roozbeh Shafiee <me@roozbeh.cloud>

## system update and package installation
RUN yum -y update; yum clean all;
RUN yum -y install bind bind-utils; yum clean all;

## generate rndc key:
RUN rndc-confgen -a -c /etc/rndc.key
RUN chown named:named /etc/rndc.key

## manage files, directories and permissions:
RUN mkdir -p /var/named/zones
ADD ./conf_files/*.zone /var/named/zones/
RUN chown -R root:named /var/named/zones; chmod 750 /var/named/zones
ADD ./conf_files/named.conf /etc/named.conf
RUN chown root:named /etc/named.conf; chmod 640 /etc/named.conf
ADD ./conf_files/named.rfc1912.zones  /etc/named.rfc1912.zones
RUN chown root:named /etc/named.rfc1912.zones; chmod 640 /etc/named.rfc1912.zones

## expose port
EXPOSE 53

## run commands to start services
CMD /usr/sbin/named -u named; /bin/bash -i
