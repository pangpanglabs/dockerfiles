FROM golang:1.8
MAINTAINER jaehue@jang.io

# setup swagger-ui
ENV SWAGGER_UI_VERSION=2.2.8
ENV API_URL=/swagger
RUN mkdir -p /swagger-ui && \
    curl -fsSL https://github.com/swagger-api/swagger-ui/archive/v$SWAGGER_UI_VERSION.tar.gz | tar xzC / && \
    mv /swagger-ui-$SWAGGER_UI_VERSION/dist/* /swagger-ui/ && \
    sed -i "s|http://petstore.swagger.io/v2/swagger.json|$API_URL|g" /swagger-ui/index.html && \
    sed -i "s|http://example.com/api|$API_URL|g" /swagger-ui/index.html

# install go package
RUN go get golang.org/x/sys/... && \
    go get golang.org/x/text/... && \
    go get golang.org/x/net/... && \
    go get golang.org/x/crypto/...
