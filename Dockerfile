FROM ubuntu:focal
SHELL ["bash", "-xec"]
ARG TOOLCHAIN
RUN readonly -A toolchains=(\
        [clang]='clang-10 libc++-10-dev libc++abi-10-dev'\
        [gcc]='g++-10'\
    );\
    read -ra packages <<< "${toolchains[$TOOLCHAIN]}";\
    packages+=(cmake git jq make pkg-config);\
    packages+=(libvulkan-dev xorg-dev);\
    apt-get update;\
    DEBIAN_FRONTEND=noninteractive apt-get dist-upgrade --auto-remove --no-install-recommends --purge --yes "${packages[@]}";\
    apt-get clean
