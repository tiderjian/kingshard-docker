FROM golang:alpine

RUN apk --no-cache add make bash

COPY ./src /go/src/github.com/flike/kingshard

WORKDIR /go/src/github.com/flike/kingshard

# RUN source /go/src/github.com/flike/kingshard/dev.sh \
#     && make \
#     && ln -s /go/src/github.com/flike/kingshard/bin/kingshard /usr/local/bin/kingshard 

# VOLUME ["/etc/ks.yaml"]
# EXPOSE 9696 9797

# COPY ./resources/docker-kingshard-entrypoint /usr/local/bin
# CMD ["docker-kingshard-entrypoint"]