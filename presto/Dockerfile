FROM pangpanglabs/java8

MAINTAINER pangpanglab <pangpanglab@p2shop.cn> 

ARG PRESTO_USER=test

RUN groupadd -r $PRESTO_USER && useradd -ms /bin/bash -r -g $PRESTO_USER $PRESTO_USER

ENV PRESTO_VERSION 0.167

RUN mkdir -p /opt/pangpang \
	&& mkdir -p /opt/pangpang/bin \
	&& curl -SL https://repo1.maven.org/maven2/com/facebook/presto/presto-server/${PRESTO_VERSION}/presto-server-${PRESTO_VERSION}.tar.gz \ 
  	| tar -xzC /opt/pangpang \
	&& chown -R $PRESTO_USER.$PRESTO_USER /opt/pangpang

RUN curl https://repo1.maven.org/maven2/com/facebook/presto/presto-cli/${PRESTO_VERSION}/presto-cli-${PRESTO_VERSION}-executable.jar -o /opt/pangpang/presto-server-${PRESTO_VERSION}/bin/presto
RUN chmod a+x /opt/pangpang/presto-server-${PRESTO_VERSION}/bin/presto

ADD etc /opt/pangpang/presto-server-${PRESTO_VERSION}/etc
ADD conf /opt/pangpang/conf
ADD entrypoint.sh /opt/pangpang/bin/entrypoint.sh
RUN chmod +x /opt/pangpang/bin/entrypoint.sh

RUN chown -R $PRESTO_USER.$PRESTO_USER /opt/pangpang/presto-server-${PRESTO_VERSION} /opt/pangpang/bin /opt/pangpang/conf

USER $PRESTO_USER

ENTRYPOINT [ "/opt/pangpang/bin/entrypoint.sh" ]

EXPOSE 8080
