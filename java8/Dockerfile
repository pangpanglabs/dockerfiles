FROM ubuntu:14.04 

MAINTAINER pangpanglab <pangpanglab@p2shop.cn> 

RUN apt-get update

RUN apt-get install -y apt-utils
RUN apt-get install -y build-essential libpq-dev

# net tools
RUN apt-get install -y net-tools

# wget
RUN apt-get install -y wget

RUN wget --no-cookies \
	--no-check-certificate \
	--header "Cookie: oraclelicense=accept-securebackup-cookie" \
	http://download.oracle.com/otn-pub/java/jdk/8u121-b13/e9e7ea248e2c4826b92b3f075a80e441/jdk-8u121-linux-x64.tar.gz \
	-O jdk-8-linux-x64.tar.gz

RUN tar xzf jdk-8-linux-x64.tar.gz

RUN mkdir /usr/java; \
	mv ./jdk1.8.0_12 /usr/java/. 

RUN cd /usr/java; \
	ln -s jdk1.8.0_12 latest

ENV JAVA_HOME /usr/java/latest
RUN export JAVA_HOME
RUN export PATH=$JAVA_HOME/bin:$PATH

# for mysql client
RUN apt-get install -y mysql-client libmysqlclient-dev

RUN apt-get clean
