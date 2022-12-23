FROM alpine:edge

RUN apk update
RUN apk add git neovim nodejs npm php81 composer

COPY ./nvim /root/.config/nvim

RUN mkdir /root/workspace

VOLUME [ "/root/.config/nvim", "/root/workspace" ]

CMD [ "sleep", "infinity"]