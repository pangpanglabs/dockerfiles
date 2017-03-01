FROM pangpanglabs/presto

MAINTAINER pangpanglab <pangpanglab@p2shop.cn> 

ARG PRESTO_USER

ADD etc /opt/pangpang/presto-server-${PRESTO_VERSION}/etc
ADD conf /opt/pangpang/conf
ADD entrypoint.sh /opt/pangpang/bin/entrypoint.sh
RUN chmod +x /opt/pangpang/bin/entrypoint.sh

RUN groupadd -r $PRESTO_USER && useradd -ms /bin/bash -r -g $PRESTO_USER $PRESTO_USER
RUN chown -R $PRESTO_USER.$PRESTO_USER /opt/pangpang/presto-server-${PRESTO_VERSION} /opt/pangpang/bin /opt/pangpang/conf

USER $PRESTO_USER

ENTRYPOINT [ "/opt/pangpang/bin/entrypoint.sh" ]

EXPOSE 8080
