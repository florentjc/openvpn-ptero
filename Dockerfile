FROM alpine:latest
RUN apk update && apk add openvpn easy-rsa git bash

RUN adduser -D -h /home/container container
ENV USER=container HOME=/home/container

WORKDIR /home/container

STOPSIGNAL SIGINT

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]