FROM pangpanglabs/java8

MAINTAINER pangpanglab <pangpanglab@p2shop.cn> 

RUN groupadd -r $PRESTO_USER && useradd -ms /bin/bash -r -g $PRESTO_USER $PRESTO_USER

ENV HADOOP_VERSION 2.7.3

RUN mkdir -p /opt/pangpang \
	&& mkdir -p /opt/pangpang/bin \
	&& curl -SL http://apache.fayea.com/hadoop/common/hadoop-${HADOOP_VERSION}/hadoop-${HADOOP_VERSION}.tar.gz \ 
  	| tar -xzC /opt/pangpang

ADD etc /opt/pangpang/hadoop-${HADOOP_VERSION}/etc
ADD entrypoint.sh /opt/pangpang/bin/entrypoint.sh
RUN chmod +x /opt/pangpang/bin/entrypoint.sh

RUN chown -R $PRESTO_USER.$PRESTO_USER /opt/pangpang/hadoop

USER $PRESTO_USER

ENTRYPOINT [ "/opt/pangpang/bin/entrypoint.sh" ]
