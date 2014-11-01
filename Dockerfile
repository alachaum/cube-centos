FROM centos:centos6
MAINTAINER Maestrano <it@maestrano.com>

# Install base packages
RUN yum -y update && yum -y install \ 
  gcc-c++ patch readline readline-devel zlib zlib-devel \
  libyaml-devel libffi-devel openssl-devel make \
  bzip2 autoconf automake libtool bison iconv-devel \
  which tar curl wget

# Add ruby environment
RUN gpg2 --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3 
RUN curl -L get.rvm.io | bash -s stable
RUN /usr/local/rvm/bin/rvm install 2.1.2

# Install higher level packages
RUN yum install -y httpd

VOLUME ["/storage"]

COPY ./rootfs /

ENTRYPOINT ["/nx/entrypoint"]

EXPOSE 80

CMD ["/nx/entrypoint-run"]
