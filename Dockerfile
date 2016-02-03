FROM golang:1.6-alpine
RUN apk update
RUN apk add git

RUN go get -u github.com/googlecloudplatform/gcsfuse
ENV GO15VENDOREXPERIMENT=1
WORKDIR ['/go/']
RUN go build github.com/googlecloudplatform/gcsfuse
RUN mkdir /data
VOLUME ['./data:/data']
WORKDIR ['/data']

ENTRYPOINT /go/gcsfuse
