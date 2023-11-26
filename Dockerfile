FROM archlinux:latest

RUN pacman -Syu --noconfirm && \
    pacman -S --noconfirm sudo && \
    pacman -Scc --noconfirm

RUN useradd dev-env -m
RUN echo 'dev-env ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER dev-env
WORKDIR /home/dev-env

COPY . .

RUN ./dependencies.sh
