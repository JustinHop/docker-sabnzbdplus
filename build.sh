#!/bin/bash

docker build . -t jhoppensteadt/sabnzbdplus:$(date +%F) -t jhoppensteadt/sabnzbdplus:latest
