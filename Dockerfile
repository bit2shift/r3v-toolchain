FROM ubuntu:focal
SHELL ["bash", "-c"]
ARG TOOLCHAIN
RUN trap exit ERR;\
    readonly -A toolchains=(\
        [clang]='clang-8 libc++-8-dev libc++abi-8-dev'\
        [gcc]='g++-8'\
    );\
    read -ra packages <<< "${toolchains[$TOOLCHAIN]}";\
    packages+=(cmake git jq make pkg-config);\
    packages+=(libvulkan-dev xorg-dev);\
    apt-get update;\
    DEBIAN_FRONTEND=noninteractive apt-get dist-upgrade --auto-remove --no-install-recommends --purge --yes "${packages[@]}";\
    apt-get clean
