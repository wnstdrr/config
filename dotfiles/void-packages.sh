#!/bin/bash 

# Collection of packages needed for void linux
# to start i3-gaps, feh, compton/picom, etc.

sudo xbps-install -Syu
sudo xbps-install -Sy \
    i3-gaps \
    xorg \
    feh \
    compton \
    dmenu \
