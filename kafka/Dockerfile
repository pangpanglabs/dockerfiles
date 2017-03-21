FROM pangpanglabs/java8
MAINTAINER pangpanglab <pangpanglab@p2shop.cn> 

ENV KAFKA_VERSION="0.10.2.0"
ENV SCALA_VERSION="2.12"
ENV KAFKA_HOME /opt/kafka_${SCALA_VERSION}-${KAFKA_VERSION}

RUN apt-get update && apt-get install -y wget && apt-get clean       

RUN url="http://apache.mirror.cdnetworks.com/kafka/${KAFKA_VERSION}/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz" && \
    wget -q "${url}" -O "/tmp/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz" && \
    tar xfz /tmp/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz -C /opt && \
    rm /tmp/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz

ADD start-kafka.sh /usr/bin/start-kafka.sh
ADD create-topics.sh /usr/bin/create-topics.sh

RUN chmod a+x /usr/bin/start-kafka.sh && \
    chmod a+x /usr/bin/create-topics.sh

CMD ["start-kafka.sh"]