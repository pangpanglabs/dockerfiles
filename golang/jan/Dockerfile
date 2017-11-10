FROM golang:1.9

# setup swagger-ui
ENV SWAGGER_UI_VERSION=3.1.7
ENV API_URL=/swagger
RUN mkdir -p /swagger-ui && \
    curl -fsSL https://github.com/swagger-api/swagger-ui/archive/v$SWAGGER_UI_VERSION.tar.gz | tar xzC / && \
    mv /swagger-ui-$SWAGGER_UI_VERSION/dist/* /swagger-ui/ && \
    sed -i "s|http://petstore.swagger.io/v2/swagger.json|$API_URL|g" /swagger-ui/index.html && \
    sed -i "s|http://example.com/api|$API_URL|g" /swagger-ui/index.html

# install packages
RUN go get go.uber.org/zap && \
    go get github.com/dgrijalva/jwt-go && \
    go get github.com/go-sql-driver/mysql && \
    go get github.com/mattn/go-sqlite3 && \
    go get github.com/spf13/viper && \
    go get github.com/labstack/echo && \
    go get github.com/go-xorm/xorm && \
    go get github.com/urfave/cli && \
    go get github.com/satori/go.uuid && \
    go get github.com/google/go-querystring/query && \
    go get github.com/go-kit/kit/... && \
    go get github.com/pangpanglabs/goutils/... && \
    go get github.com/asaskevich/govalidator && \
    go get github.com/sirupsen/logrus && \
    go get github.com/garyburd/redigo/redis

