FROM centos:6

MAINTAINER "rajesh" <rajeshayaldasani.cse18@gmail.com>

ADD http://download.redis.io/releases/redis-3.2.8.tar.gz / 

RUN yum update -y && \
    yum install epel-release -y && \
    yum install wget gcc make tcl -y && \
    tar -xvzf /redis-3.2.8.tar.gz 

WORKDIR  /redis-3.2.8/deps/ 

RUN make hiredis lua jemalloc linenoise && \
    make geohash-int

WORKDIR /redis-3.2.8/

RUN make && \
    make install

WORKDIR /redis-3.2.8/utils

RUN echo -ne '\n' | ./install_server.sh  && \
    yum install system-config-services -y

ENTRYPOINT service redis_6379 restart | tail -f /dev/null


