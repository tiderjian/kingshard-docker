FROM golang:alpine

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories \
    && apk update \
    && apk --no-cache add make bash

COPY ./src/ /go/src/github.com/flike/kingshard/
COPY ./resources/docker-kingshard-entrypoint /usr/local/bin/

WORKDIR /go/src/github.com/flike/kingshard

RUN source /go/src/github.com/flike/kingshard/dev.sh \
    && make \
    && ln -s /go/src/github.com/flike/kingshard/bin/kingshard /usr/local/bin/kingshard 

VOLUME ["/etc/ks.yaml"]
EXPOSE 9696 9797

CMD ["docker-kingshard-entrypoint"]