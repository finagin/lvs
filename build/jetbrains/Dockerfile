FROM ubuntu:${UBUNTU_VERSION:-22.04}

LABEL maintainer="Igor Finagin"

ARG USERNAME=lvs
ARG PASSWORD=lvs
ARG LVSGROUP

RUN apt-get update \
 && mkdir -p /etc/apt/keyrings \
 && apt-get install -y vim sudo curl openssh-server apt-transport-https ca-certificates software-properties-common \
 && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg \
 && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null \
 && apt-get update \
 && apt-get install -y docker-ce docker-ce-cli containerd.io \
 && service ssh start

RUN useradd -rm -d /home/lvs -s /bin/bash -g $LVSGROUP -G sudo,docker -u 1337 $USERNAME \
  # todo: fix docker.sock permission and delete next line
 && usermod -aG root $USERNAME \
 && echo "$USERNAME:$PASSWORD" | chpasswd

# todo: install fish shell

VOLUME /home/lvs/.cache/JetBrains
VOLUME /home/lvs/projects
VOLUME /var/run/docker.sock

EXPOSE 22

CMD ["/usr/sbin/sshd","-D"]
