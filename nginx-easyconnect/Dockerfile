FROM hagb/docker-easyconnect:cli

RUN apt-get -y update && apt-get -y install nginx

EXPOSE 80
EXPOSE 443

ENV _EC_CLI=1

CMD ["/bin/sh", "-c",  "/usr/sbin/nginx && start.sh"]
