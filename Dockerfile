FROM archlinux

RUN pacman --noconfirm -Sy libdvdcss handbrake-cli

RUN mkdir /dvd  && \
    mkdir /fished

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT /entrypoint.sh
