FROM ubuntu:18.04
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install -y gcc make git sudo python curl wget locales nginx g++ tmux

RUN locale-gen en_US en_US.UTF-8

RUN useradd -m -s /bin/bash ubuntu
RUN usermod -aG sudo ubuntu

RUN echo "ubuntu    ALL=(ALL)   NOPASSWD:ALL" | tee "/etc/sudoers.d/ubuntu"

RUN rm -rf /etc/nginx/sites-enabled/default
COPY ./nginx.conf /etc/nginx/sites-enabled/default

USER ubuntu
WORKDIR /home/ubuntu

RUN git clone https://github.com/c9/core.git c9sdk
WORKDIR /home/ubuntu/c9sdk

RUN ./scripts/install-sdk.sh

RUN sudo ln -rs /home/ubuntu/.c9/node/bin/node /usr/local/bin/
RUN sudo ln -rs /home/ubuntu/.c9/node/bin/npm /usr/local/bin/

RUN mkdir -p /home/ubuntu/workspace
VOLUME ["/home/ubuntu/workspace"]

EXPOSE 80

RUN nohup ./server.js -p 8080 &> /dev/null &

USER root

# RUN ls -la /etc/nginx/sites-enabled && sleep 9999;
CMD ["nginx", "-g", "daemon off;"]
ADD ./entrypoint.sh /entrypoint.sh
ENTRYPOINT /entrypoint.sh