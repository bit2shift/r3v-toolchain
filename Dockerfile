FROM ubuntu:16.04
ARG DEB_SOURCE
ARG DEB_FINGERPRINT
ARG DEB_PACKAGES
RUN echo "deb $DEB_SOURCE" >> /etc/apt/sources.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys $DEB_FINGERPRINT
RUN apt-get update
RUN apt-get dist-upgrade -y --no-install-recommends $DEB_PACKAGES cmake make pkg-config libvulkan-dev xorg-dev
RUN apt-get autoremove -y
RUN apt-get clean
