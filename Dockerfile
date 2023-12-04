FROM jlesage/baseimage-gui:ubuntu-20.04

RUN apt-get update

RUN apt-get install -y curl wget software-properties-common gnupg2 winbind xvfb

RUN dpkg --add-architecture i386
RUN wget -nc https://dl.winehq.org/wine-builds/winehq.key
RUN apt-key add winehq.key
RUN add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ focal main'
RUN apt-get update
RUN apt install -y --install-recommends wine32

RUN apt-get install -y winetricks

RUN apt-get clean -y
RUN apt-get autoremove -y

ENV WINEPREFIX /config/wine/
    
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y locales

RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8

ENV LANG en_US.UTF-8

ENV APP_NAME="GRC DNS Benchmark"

# Disable WINE Debug messages
ENV WINEDEBUG -all

EXPOSE 5900

COPY startapp.sh /startapp.sh

COPY rc.xml /etc/xdg/openbox/rc.xml
