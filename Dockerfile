FROM ubuntu:disco
SHELL ["bash", "-c"]
ARG PACKAGES
RUN trap exit ERR;\
    apt-get update;\
    apt-get dist-upgrade --yes --no-install-recommends $PACKAGES cmake git jq make pkg-config libvulkan-dev xorg-dev;\
    apt-get autoremove --yes --purge;\
    apt-get clean
