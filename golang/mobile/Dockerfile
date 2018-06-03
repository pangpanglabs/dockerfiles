FROM openjdk:8

MAINTAINER Jang Jaehue <jaehue@jang.io>


ENV ANDROID_SDK_URL="https://dl.google.com/android/repository/sdk-tools-linux-3859397.zip" \
    ANDROID_BUILD_TOOLS_VERSION=27.0.3 \
    ANDROID_HOME="/opt/android" \
    ANDROID_NDK_HOME="/opt/android-ndk"

ENV PATH $PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$ANDROID_HOME/build-tools/$ANDROID_BUILD_TOOLS_VERSION:$ANDROID_NDK_HOME

WORKDIR /opt

RUN dpkg --add-architecture i386 && \
    apt-get -qq update && \
    apt-get -qq install -y build-essential wget curl libncurses5:i386 libstdc++6:i386 zlib1g:i386 && \

    # Installs Android SDK
    mkdir android && cd android && \
    wget -O tools.zip ${ANDROID_SDK_URL} && \
    unzip tools.zip && rm tools.zip && \
    mkdir ~/.android && touch ~/.android/repositories.cfg && \
    yes | /opt/android/tools/bin/sdkmanager --licenses && \
    /opt/android/tools/bin/sdkmanager "build-tools;27.0.3" "platform-tools" "tools"  "platforms;android-27" && \
    /opt/android/tools/bin/sdkmanager --update && \
    chmod a+x -R $ANDROID_HOME && \
    chown -R root:root $ANDROID_HOME && \

    # Install NDK
    rm -rf /opt/android-ndk-tmp && \
    mkdir /opt/android-ndk-tmp && \
    cd /opt/android-ndk-tmp && wget -q https://dl.google.com/android/repository/android-ndk-r14b-linux-x86_64.zip && \
    cd /opt/android-ndk-tmp && unzip -q android-ndk-r14b-linux-x86_64.zip && \
    cd /opt/android-ndk-tmp && mv ./android-ndk-r14b ${ANDROID_NDK_HOME} && \
    rm -rf /opt/android-ndk-tmp && \

    # Copy platforms
    cp -R $ANDROID_HOME/platforms/* $ANDROID_NDK_HOME/platforms/ && \

    # Clean up
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    apt-get autoremove -y && \
    apt-get clean

## install golang
ENV GOLANG_VERSION 1.10
ENV GOLANG_DOWNLOAD_URL https://golang.org/dl/go$GOLANG_VERSION.linux-amd64.tar.gz
ENV GOLANG_DOWNLOAD_SHA256 b5a64335f1490277b585832d1f6c7f8c6c11206cba5cd3f771dcb87b98ad1a33

RUN curl -fsSL "$GOLANG_DOWNLOAD_URL" -o golang.tar.gz \
	&& echo "$GOLANG_DOWNLOAD_SHA256  golang.tar.gz" | sha256sum -c - \
	&& tar -C /usr/local -xzf golang.tar.gz \
	&& rm golang.tar.gz

ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH

RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH"
WORKDIR $GOPATH

# install gomobile
RUN go get golang.org/x/mobile/cmd/gomobile && gomobile init -ndk $ANDROID_NDK_HOME

# install go package
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
    go get github.com/sirupsen/logrus
