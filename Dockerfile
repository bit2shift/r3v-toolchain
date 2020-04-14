FROM ubuntu:focal
SHELL ["bash", "-c"]
ARG PACKAGES
RUN trap exit ERR;\
    read -ra packages <<< "$PACKAGES";\
    packages+=(cmake git jq make pkg-config);\
    packages+=(libvulkan-dev xorg-dev);\
    apt-get update;\
    DEBIAN_FRONTEND=noninteractive apt-get dist-upgrade --auto-remove --no-install-recommends --purge --yes "${packages[@]}";\
    apt-get clean
