FROM ubuntu:14.04 

MAINTAINER pangpanglab <pangpanglab@p2shop.cn> 

RUN apt-get update && apt-get install -y openjdk-8-jdk

# Fix certificate issues, found as of # https://bugs.launchpad.net/ubuntu/+source/ca-certificates-java/+bug/983302 
RUN apt-get update && \ 
	apt-get install ca-certificates-java && \ 
	update-ca-certificates -f; 

RUN apt-get install --assume-yes apt-utils
RUN apt-get install -y build-essential libpq-dev

# net tools
RUN apt-get install -y net-tools

# for mysql client
RUN apt-get install -y mysql-client libmysqlclient-dev

RUN apt-get clean

#Setup JAVA_HOME, this is useful for docker commandline
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/ RUN export JAVA_HOME
RUN export JAVA_HOME
RUN export PATH=$JAVA_HOME/bin:$PATH
