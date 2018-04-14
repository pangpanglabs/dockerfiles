FROM golang:1.10
MAINTAINER jang.jaehue@eland.co.kr

# setup swagger-ui
ENV SWAGGER_UI_VERSION=3.13.4
RUN mkdir -p /swagger-ui && \
    curl -fsSL https://github.com/swagger-api/swagger-ui/archive/v$SWAGGER_UI_VERSION.tar.gz | tar xzC / && \
    mv /swagger-ui-$SWAGGER_UI_VERSION/dist/* /swagger-ui/
ONBUILD ARG SWAGGER_PATH=/swagger
ONBUILD RUN sed -i "s|http://petstore.swagger.io/v2/swagger.json|$SWAGGER_PATH|g" /swagger-ui/index.html && \
    sed -i "s|http://example.com/api|$SWAGGER_PATH|g" /swagger-ui/index.html

# install go package
RUN go get golang.org/x/sys/... && \
    go get golang.org/x/text/... && \
    go get golang.org/x/net/... && \
    go get golang.org/x/crypto/...
