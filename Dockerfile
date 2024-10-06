FROM debian:bookworm-slim

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y openvpn easy-rsa git wget && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN useradd -m -d /home/container/ -s /bin/bash container
ENV USER=container HOME=/home/container

WORKDIR /home/container

STOPSIGNAL SIGINT

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]