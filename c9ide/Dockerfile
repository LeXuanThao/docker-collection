FROM ubuntu:18.04
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install -y software-properties-common gcc make git sudo python python-pip curl wget locales nginx
RUN add-apt-repository -y ppa:ondrej/php
RUN apt-get update
RUN apt -y install php7.4

RUN locale-gen en_US en_US.UTF-8

RUN useradd -m -s /bin/bash ubuntu
RUN usermod -aG sudo ubuntu

RUN echo "ubuntu    ALL=(ALL)   NOPASSWD:ALL" | tee "/etc/sudoers.d/ubuntu"

RUN rm -rf /etc/nginx/sites-enabled/default
COPY ./nginx.conf /etc/nginx/sites-enabled/default

# CMD ["nginx", "-g", "daemon off;"]

USER ubuntu

# install phpintel
RUN sudo pip install -U virtualenv
RUN virtualenv --python=python2 $HOME/.c9/python2
RUN . $HOME/.c9/python2/bin/activate \
    && mkdir /tmp/codeintel \
    && pip download -d /tmp/codeintel codeintel==0.9.3 \
    && cd /tmp/codeintel \
    && tar xf CodeIntel-0.9.3.tar.gz \
    && mv CodeIntel-0.9.3/SilverCity CodeIntel-0.9.3/silvercity \
    && tar czf CodeIntel-0.9.3.tar.gz CodeIntel-0.9.3 \
    && pip install -U --no-index --find-links=/tmp/codeintel codeintel

WORKDIR /home/ubuntu

RUN git clone https://github.com/LeXuanThao/c9-core.git c9sdk
WORKDIR /home/ubuntu/c9sdk

RUN ./scripts/install-sdk.sh

RUN sudo ln -rs /home/ubuntu/.c9/node/bin/node /usr/local/bin/
RUN sudo ln -rs /home/ubuntu/.c9/node/bin/npm /usr/local/bin/

RUN mkdir -p /home/ubuntu/workspace
VOLUME ["/home/ubuntu/workspace"]

EXPOSE 80

USER root
ADD ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]