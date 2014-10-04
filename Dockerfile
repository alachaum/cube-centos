FROM centos:centos6
MAINTAINER Maestrano <it@maestrano.com>
RUN yum -y update && yum -y install \ 
  gcc-c++ patch readline readline-devel zlib zlib-devel \
  libyaml-devel libffi-devel openssl-devel make \
  bzip2 autoconf automake libtool bison iconv-devel \
  which tar curl

RUN curl -L get.rvm.io | bash -s stable
RUN /usr/local/rvm/bin/rvm install 2.1.2

RUN yum install -y httpd

VOLUME ["/storage"]

COPY ./rootfs /

EXPOSE 80
ENTRYPOINT ["/docker/entrypoint"]
