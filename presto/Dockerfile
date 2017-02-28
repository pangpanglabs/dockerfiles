FROM pangpanglabs/java8

MAINTAINER pangpanglab <pangpanglab@p2shop.cn> 

RUN groupadd -r pangpang && useradd -ms /bin/bash -r -g pangpang pangpang

ENV PRESTO_VERSION 0.167

RUN mkdir -p /opt/pangpang \
	&& curl -SL https://repo1.maven.org/maven2/com/facebook/presto/presto-server/${PRESTO_VERSION}/presto-server-${PRESTO_VERSION}.tar.gz \ 
  	| tar -xzC /opt/pangpang \
	&& chown -R pangpang.pangpang /opt/pangpang

USER pangpang

ADD https://repo1.maven.org/maven2/com/facebook/presto/presto-cli/${PRESTO_VERSION}/presto-cli-${PRESTO_VERSION}-executable.jar /opt/pangpang/presto-server-${PRESTO_VERSION}/bin
RUN chmod a+x /opt/pangpang/presto-server-${PRESTO_VERSION}/bin

EXPOSE $HTTP_PORT

ENTRYPOINT ["/opt/pangpang/presto-server-${PRESTO_VERSION}/bin/launcher", "run"]
