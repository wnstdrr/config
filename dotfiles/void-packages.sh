#!/bin/bash 

# Collection of packages needed for void linux
# to start i3-gaps, feh, compton/picom, etc.
#
# Other QOL apps to make the desktop enviroment
# look better than it should.

sudo xbps-install -Syu
sudo xbps-install -Sy xbps
sudo xbps-install -Sy \
    i3-gaps \  # Window Manager
    xorg \     # xorg/x11 server
    feh \      # Desktop Backgrounds
    compton \  # Window Composition
    dmenu \    # Interactive Menu
    glava \    # Desktop Audio Visualization
