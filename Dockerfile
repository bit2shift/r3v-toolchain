FROM ubuntu:18.04
ARG DEB_SOURCE
ARG DEB_FINGERPRINT
ARG DEB_PACKAGES
RUN apt-get update;\
    apt-get install -y gnupg;\
    echo "deb $DEB_SOURCE" >> /etc/apt/sources.list;\
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys $DEB_FINGERPRINT;\
    apt-get update;\
    apt-get dist-upgrade -y --no-install-recommends $DEB_PACKAGES cmake make pkg-config libvulkan-dev xorg-dev;\
    apt-get autoremove -y;\
    apt-get clean
