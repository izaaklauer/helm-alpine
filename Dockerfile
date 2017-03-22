FROM alpine:3.5

RUN apk add --update --no-cache ca-certificates
RUN apk add bash

ENV VERSION v2.2.2
ENV FILENAME helm-${VERSION}-linux-amd64.tar.gz

WORKDIR /

ADD http://storage.googleapis.com/kubernetes-helm/${FILENAME} /tmp

RUN tar -zxvf /tmp/${FILENAME} -C /tmp \
  && mv /tmp/linux-amd64/helm /bin/helm \
  && rm -rf /tmp
