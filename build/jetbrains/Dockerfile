FROM ubuntu:22.04

LABEL maintainer="Igor Finagin"

ARG USERNAME=lvs
ARG PASSWORD
ARG LVSGROUP

RUN apt-get update \
    && mkdir -p /etc/apt/keyrings \
    && apt-get install -y vim sudo openssh-server

RUN useradd -rm -d /home/lvs -s /bin/bash -g $LVSGROUP -G sudo -u 1337 $USERNAME

RUN usermod -aG sudo $USERNAME

RUN service ssh start

RUN echo "$USERNAME:$PASSWORD" | chpasswd

VOLUME /home/vls/.cache/JetBrains
VOLUME /home/lvs/projects

EXPOSE 22

CMD ["/usr/sbin/sshd","-D"]
