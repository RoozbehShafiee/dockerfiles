## Containerized ElasticSearch Service Based on CentOS 7

FROM centos:latest
MAINTAINER Roozbeh Shafiee <me@roozbeh.cloud>

## system update and package installation
RUN yum -y update; yum clean all

## install elasticsearch
ADD ./config_files/elasticsearch.repo /etc/yum.repos.d/
RUN \
  rpm --import http://packages.elastic.co/GPG-KEY-elasticsearch; \
  yum -y install elasticsearch java-1.8.0-openjdk

## manage users, directories and permissions:
RUN cp -r /etc/elasticsearch /usr/share/elasticsearch/config
RUN chown elasticsearch:elasticsearch -R /usr/share/elasticsearch
RUN usermod -s /bin/bash elasticsearch

## expose port
EXPOSE 9200

## start elasticsearch service
CMD su - elasticsearch -c "/usr/share/elasticsearch/bin/elasticsearch --network.bind_host 0.0.0.0"
