FROM archlinux

RUN pacman --noconfirm -Sy libdvdcss handbrake-cli

RUN mkdir /dvd

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT /entrypoint.sh
