FROM archlinux

RUN pacman --noconfirm -Sy libdvdcss handbrake-cli

RUN mkdir /dvd  && \
    mkdir /finish

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT /entrypoint.sh
