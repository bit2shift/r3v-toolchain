FROM ubuntu:16.04
ARG DEB_REPOSITORY
ARG DEB_DISTRIBUTION
ARG DEB_COMPONENT
ARG DEB_FINGERPRINT
ARG DEB_PACKAGES
RUN echo "deb $DEB_REPOSITORY $DEB_DISTRIBUTION $DEB_COMPONENT" >> /etc/apt/sources.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys $DEB_FINGERPRINT
RUN apt-get update
RUN apt-get dist-upgrade -y build-essential cmake pkg-config $DEB_PACKAGES
RUN apt-get autoremove -y
RUN apt-get clean
