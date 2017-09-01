FROM alpine:3.5

RUN apk add --no-cache bash tar curl

# install caddy
RUN curl https://getcaddy.com | bash

EXPOSE 80 443 2015

ENTRYPOINT ["/usr/local/bin/caddy"]
CMD ["--conf", "/etc/Caddyfile", "--log", "stdout"]
