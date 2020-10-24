FROM ubuntu:20.04

LABEL maintainer="Christoph Witzany <christoph@doublemalt.net"

ENV DEBIAN_FRONTEND noninteractive 
ENV PYTHON /usr/bin/python3

RUN apt-get update -y && apt-get install -y software-properties-common julia curl
WORKDIR /test

RUN add-apt-repository ppa:fenics-packages/fenics -y 
RUN apt-get update -q -y
RUN apt-get install fenics -y

ADD setup.jl . 

RUN julia  setup.jl

