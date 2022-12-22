FROM alpine:edge

RUN apk update
RUN apk add git neovim nodejs npm php81 composer
# Laravel composer install
RUN apk add php81-tokenizer php81-dom php81-xml php81-xmlwriter php81-fileinfo

COPY ./nvim /root/.config/nvim

RUN mkdir /root/workspace

VOLUME [ "/root/.config/nvim", "/root/workspace" ]

CMD [ "sleep", "infinity"]