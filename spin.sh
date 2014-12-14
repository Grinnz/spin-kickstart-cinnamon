#!/bin/sh
sudo livecd-creator --verbose --config=fedora-livecd-cinnamon.ks --fslabel=F21Live-Cinnamon-x86_64-$(date +%Y%m%d) --cache=/var/cache/live
