## Getting started

```
docker run --rm -d \
    --name nginx-easyconnect \
    --device /dev/net/tun \
    --cap-add NET_ADMIN \
    -p 80:80 -p 443:443 \
    -e EC_VER=7.6.3 \
    -e CLI_OPTS="-d EASYCONNECT_SERVER_URL -u USERNAME -p PASSWORD" \
    pangpanglabs/nginx-easyconnect
```