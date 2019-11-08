#!/bin/bash

docker run \
    -it --rm \
    --publish 8080:8080 \
    --env DBUS_SESSION_BUS_ADDRESS="$DBUS_SESSION_BUS_ADDRESS" \
    --volume /run/user/$(id -u)/bus:/run/user/$(id -u)/bus \
    --volume ${HOME}/.sabnzbd:/.sabnzbd \
    --volume ${HOME}/Downloads:/Downloads \
    --volume /mnt/auto/1/tmp:/mnt/auto/1/tmp \
    --volume /mnt/auto/1/share/torrent:/mnt/auto/1/share/torrent \
    --user $(id -u) \
    --workdir $HOME \
    --name sabnzbd \
    jhoppensteadt/sabnzbdplus:latest /usr/local/bin/python3 -OO /usr/local/sabnzbd/SABnzbd.py -f /.sabnzbd/sabnzbd.ini
