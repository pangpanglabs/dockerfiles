FROM golang:1.9

# setup swagger-ui
ENV SWAGGER_UI_VERSION=3.13.4
RUN mkdir -p /swagger-ui && \
    curl -fsSL https://github.com/swagger-api/swagger-ui/archive/v$SWAGGER_UI_VERSION.tar.gz | tar xzC / && \
    mv /swagger-ui-$SWAGGER_UI_VERSION/dist/* /swagger-ui/
ONBUILD ARG SWAGGER_PATH=/swagger
ONBUILD RUN sed -i "s|http://petstore.swagger.io/v2/swagger.json|$SWAGGER_PATH|g" /swagger-ui/index.html && \
    sed -i "s|http://example.com/api|$SWAGGER_PATH|g" /swagger-ui/index.html

# install packages
RUN go get github.com/dgrijalva/jwt-go && \
    go get github.com/denisenkom/go-mssqldb && \
    go get github.com/go-sql-driver/mysql && \
    go get github.com/mattn/go-sqlite3 && \
    go get github.com/spf13/viper && \
    go get github.com/labstack/echo/... && \
    go get github.com/go-xorm/xorm && \
    go get github.com/urfave/cli && \
    go get github.com/pangpanglabs/goutils/... && \
    go get github.com/sirupsen/logrus && \
    go get gopkg.in/mgo.v2 && \
    go get github.com/gorilla/mux && \
    go get github.com/gorilla/context && \
    go get github.com/jinzhu/configor && \
    go get github.com/patrickmn/go-cache && \
    go get github.com/unrolled/render && \
    go get github.com/urfave/negroni && \
    go get github.com/gomodule/redigo/redis
