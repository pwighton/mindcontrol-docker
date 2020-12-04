FROM ubuntu:20.04

RUN apt-get update \
    && apt-get install -y -q \
          curl \
          git \
          sudo \
          wget \
    && curl https://install.meteor.com/ | sh \
    && useradd -ms /bin/bash ubuntu 

USER ubuntu
RUN git clone https://github.com/akeshavan/mindcontrol /home/ubuntu/mindcontrol \
    && cd /home/ubuntu/mindcontrol \
    && meteor update

USER root
RUN  cd /home/ubuntu/mindcontrol \
     && meteor npm install --save @babel/runtime \
     && meteor npm install --save bcrypt

USER ubuntu
WORKDIR /home/ubuntu/mindcontrol
CMD meteor --settings settings.dev.json
