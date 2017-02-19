FROM golang:1.8
MAINTAINER jaehue@jang.io

# install go package
RUN go get golang.org/x/sys/unix && \
    go get golang.org/x/text/transform && \
    go get golang.org/x/text/unicode/norm && \
    go get golang.org/x/net/context/ctxhttp
