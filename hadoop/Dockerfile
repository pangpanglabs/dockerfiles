FROM pangpanglabs/java8

MAINTAINER pangpanglab <pangpanglab@p2shop.cn> 

ENV HADOOP_VERSION 2.7.3
ENV HIVE_VERSION 2.1.1

RUN mkdir -p /opt/pangpang \
	&& mkdir -p /opt/pangpang/bin \
	&& curl -SL http://apache.fayea.com/hadoop/common/hadoop-${HADOOP_VERSION}/hadoop-${HADOOP_VERSION}.tar.gz \ 
  	| tar -xzC /opt/pangpang \
        && curl -SL http://apache.fayea.com/hive/stable-2/apache-hive-${HIVE_VERSION}-bin.tar.gz
        | tar -xzC /opt/pangpang
