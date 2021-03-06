FROM alpine:latest
MAINTAINER haniokasai <htek@haniokasai.com>

RUN mkdir -p /data /scripts
RUN touch /minecraft/initialstart


RUN apk add --upgrade \
    bash \
    openssh \
    openssh-sftp-server 
    
COPY ./resources/*  /scripts/

WORKDIR /scripts/

ENTRYPOINT sh /scripts/run-Main.sh
