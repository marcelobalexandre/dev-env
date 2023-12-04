FROM archlinux:latest

RUN pacman-key --init && \
    pacman -Syu --noconfirm && \
    pacman -S --noconfirm sudo && \
    pacman -Scc --noconfirm

RUN useradd dev-env -m
RUN echo 'dev-env ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER dev-env 
WORKDIR /home/dev-env

COPY . /home/dev-env

RUN ./install-dependencies.sh
