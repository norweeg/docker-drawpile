FROM ubuntu:xenial

RUN apt-get update && \
    apt-get install -y git cmake extra-cmake-modules qtbase5-dev g++ libkf5archive-dev pkg-config libkf5dnssd-dev libmicrohttpd-dev && \
    rm -rf /var/lib/apt/lists/*; \
    cd /tmp && \
    git clone https://github.com/drawpile/Drawpile.git && \
    mkdir -p /tmp/Drawpile/build && \
    cd /tmp/Drawpile/build && \
    cmake /tmp/Drawpile -DCMAKE_INSTALL_PREFIX=/usr -DCLIENT=off && \
    make install && \
    useradd --system drawpile && \
    cd / && rm -rf /tmp/Drawpile


ENTRYPOINT ["/usr/bin/drawpile-srv"]

USER drawpile
EXPOSE 27750
