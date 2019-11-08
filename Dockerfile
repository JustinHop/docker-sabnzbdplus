FROM python:3.7-alpine3.10

RUN apk --no-cache add -t .build-dependencies \
        autoconf \
        automake \
        dbus-dev \
        libffi-dev \
        openssl-dev \
        glib-dev \
        python3-dev \
        g++ \
        gcc \
        git \
        make \
    && apk --no-cache add \
        dbus \
        libffi \
        openssl \
        p7zip \
        unrar \
    && /usr/local/bin/pip3 install \
        chardet \
        cheetah3 \
        cherrypy \
        configobj \
        cryptography \
        dbus-python \
        feedparser \
        gntp \
        portend \
        pynotify \
        sabyenc3 \
        six \
    && mkdir -p /home/justin \
    && cd /tmp \
    && git clone https://github.com/ifsnop/par2cmdline-tbb.git \
    && cd par2cmdline-tbb \
    && ./configure \
    && make \
    && make install \
    && cd /tmp \
    && rm -rf par2cmdline \
    && cd /usr/local \
    && git clone --depth 1 https://github.com/sabnzbd/sabnzbd.git \
    && apk del .build-dependencies \
    && rm -rf /root

#    && git clone https://github.com/Parchive/par2cmdline.git \
#    && cd par2cmdline \
#    && ./automake.sh \
#    && ./configure --disable-dependency-tracking \

WORKDIR /usr/local/sabnzbd
EXPOSE 8080

CMD ["/usr/local/bin/python3", "-OO", "/usr/local/sabnzbd/SABnzbd.py"]
