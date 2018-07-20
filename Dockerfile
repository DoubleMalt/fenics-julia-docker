FROM ubuntu:16.04

LABEL maintainer=" Yiannis Simillides <yiannis.simillides@gmail.com>"

RUN apt-get update -y && apt-get install -y make rsync git gcc g++ bzip2 hdf5-tools unzip gfortran curl software-properties-common python-software-properties
WORKDIR /test
RUN mkdir -p /opt/julia-0.7 && \
    curl -s -L https://julialang-s3.julialang.org/bin/linux/x64/0.7/julia-0.7.0-beta2-linux-x86_64.tar.gz | tar -C /opt/julia-0.7 -x -z --strip-components=1 -f -

RUN add-apt-repository ppa:fenics-packages/fenics -y 
RUN apt-get update -q 
RUN apt-get install fenics -y
#link to python3
ENV PYTHON /usr/bin/python3
ADD setup.jl . 
RUN echo "\nPATH=/opt/julia-0.7/bin:\$PATH\n" >> /root/.bashrc
RUN ln -s /opt/julia-0.7/bin/julia /usr/local/bin/
RUN julia  setup.jl

