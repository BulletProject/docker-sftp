FROM ubuntu:20.04

MAINTAINER haniokasai <htek@haniokasai.com>

ENV DEBIAN_FRONTEND=noninteractive

RUN mkdir -p /data /scripts
RUN touch /scripts/initialstart


RUN sed -i.bak -e "s%http://[^ ]\+%http://ftp.jaist.ac.jp/pub/Linux/ubuntu/%g" /etc/apt/sources.list
RUN apt update
RUN apt install zip rsync unzip expect perl curl openssh-server  -y
RUN apt clean

RUN rm -rf /scripts/ & mkdir /scripts/
COPY ./resources/*  /scripts/

WORKDIR /scripts/

ENTRYPOINT sh /scripts/run-Main.sh
