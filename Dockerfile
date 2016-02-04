# Must run as priviledged

FROM golang:1.6-alpine
RUN apk update
RUN apk add git
RUN apk add fuse
RUN go get -u github.com/googlecloudplatform/gcsfuse
ENV GO15VENDOREXPERIMENT=1
WORKDIR '/go/'
RUN go build github.com/googlecloudplatform/gcsfuse
RUN mkdir /data
VOLUME ['/data']
WORKDIR '/data'
ENV PATH=$PATH:/go/bin



