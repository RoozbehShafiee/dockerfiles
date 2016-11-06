## Containerized VSFTPD Service Based on CentOS 7

FROM centos
MAINTAINER Roozbeh Shafiee <me@roozbeh.cloud>

## system update and package installation
RUN yum -y update; yum clean all
RUN yum -y install httpd; yum clean all
RUN yum install -y vsftpd db4-utils db4; yum clean all

## environment variables
ENV FTP_USER **String**
ENV FTP_PASS **Random**
ENV LOG_STDOUT **Boolean**

## manage files, directories and permissions:
ADD ./conf_files/vsftpd.conf /etc/vsftpd/
ADD ./conf_files/vsftpd_virtual /etc/pam.d/
ADD ./conf_files/run-vsftpd.sh /usr/sbin/
RUN chmod +x /usr/sbin/run-vsftpd.sh
RUN mkdir -p /data
RUN chown -R ftp:ftp /data
ADD ./conf_files/virtual_users.txt /etc/vsftpd/virtual_users.txt

## create ftp accounts
RUN /usr/bin/db_load -T -t hash -f /etc/vsftpd/virtual_users.txt /etc/vsftpd/virtual_users.db

## volumes and storage
VOLUME ["/data"]

## expose port
EXPOSE 20 21 21100 21101 21102 21103 21104 21105 21106 21107 21108 21109 21110

## running commands to start services
CMD ["/usr/sbin/run-vsftpd.sh"]
