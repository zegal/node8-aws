FROM node:8.16.2
MAINTAINER pmag <pomba.magar@zegal.com>

RUN DEBIAN_FRONTEND=noninteractive apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends \
    build-essential g++ python2.7 python2.7-dev unzip curl\
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /tmp \
    && cd /tmp \
    && curl -O https://bootstrap.pypa.io/get-pip.py \
    && python get-pip.py \
    && pip install awscli \
    && rm -f /tmp/get-pip.py

RUN mkdir /root/.ssh/ && touch /root/.ssh/config && echo "StrictHostKeyChecking no" >> /etc/ssh/ssh_config
RUN echo "IdentityFile /root/.ssh/id_rsa" >> /etc/ssh/ssh_config
RUN touch /root/.ssh/id_rsa
RUN npm install yarn
