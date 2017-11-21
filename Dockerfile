FROM ubuntu

ARG DEBIAN_FRONTEND=noninteractive

COPY .bashrc /root/
COPY .dircolors /root/
COPY .vim /root/

RUN apt-get update \
	&& apt-get install apt-utils -y \
	&& apt-get install man-db -y \
	&& apt-get install iproute2 wget vim ed dnsutils net-tools iputils-ping subversion curl texinfo g++ bison flex cvs yasm automake libtool autoconf gcc cmake git make pkg-config zlib1g-dev mercurial unzip pax nasm gperf autogen bzip2 -y \
	&& apt-get dist-upgrade -y
