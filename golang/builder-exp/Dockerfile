FROM golang:1.13

# setup swagger-ui
ENV SWAGGER_UI_VERSION=3.23.6
RUN mkdir -p /swagger-ui && \
    curl -fsSL https://github.com/swagger-api/swagger-ui/archive/v$SWAGGER_UI_VERSION.tar.gz | tar xzC / && \
    mv /swagger-ui-$SWAGGER_UI_VERSION/dist/* /swagger-ui/
ONBUILD ARG SWAGGER_PATH=/swagger
ONBUILD RUN sed -i "s|http://petstore.swagger.io/v2/swagger.json|$SWAGGER_PATH|g" /swagger-ui/index.html && \
    sed -i "s|http://example.com/api|$SWAGGER_PATH|g" /swagger-ui/index.html

RUN git clone https://github.com/pangpanglabs/xorm.git /go/src/github.com/go-xorm/xorm
# install packages
RUN go get go.uber.org/zap && \
    go get github.com/dgrijalva/jwt-go && \
    go get github.com/go-sql-driver/mysql && \
    go get github.com/mattn/go-sqlite3 && \
    go get github.com/spf13/viper && \
    go get github.com/labstack/echo && \
    go get github.com/go-xorm/core && \
    go get github.com/go-xorm/builder && \
    go get github.com/urfave/cli && \
    go get github.com/satori/go.uuid && \
    go get github.com/google/go-querystring/query && \
    go get github.com/go-kit/kit/endpoint && \
    go get github.com/go-kit/kit/transport/http && \
    go get github.com/go-kit/kit/transport/grpc && \
    go get github.com/pangpanglabs/goutils/... && \
    go get github.com/pangpanglabs/echoswagger && \
    go get github.com/asaskevich/govalidator && \
    go get github.com/sirupsen/logrus && \
    go get github.com/gomodule/redigo/redis && \
    go get github.com/denisenkom/go-mssqldb && \
    go get gopkg.in/mgo.v2 && \
    go get github.com/gorilla/mux && \
    go get github.com/gorilla/context && \
    go get github.com/gorilla/securecookie && \
    go get github.com/gorilla/sessions && \
    go get github.com/gorilla/websocket && \
    go get github.com/jinzhu/configor && \
    go get github.com/patrickmn/go-cache && \
    go get github.com/unrolled/render && \
    go get github.com/urfave/negroni && \
    go get github.com/Shopify/sarama && \
    go get github.com/colinmarc/go-presto && \
    go get github.com/prestodb/presto-go-client/presto && \
    go get github.com/aliyun/aliyun-oss-go-sdk/oss && \
    go get github.com/360EntSecGroup-Skylar/excelize && \
    go get gopkg.in/go-playground/validator.v9 && \
    go get github.com/renstrom/shortuuid && \
    go get github.com/json-iterator/go && \
    go get github.com/pkg/errors && \
    go get github.com/kardianos/govendor && \
    go get github.com/lib/pq