#!/bin/bash
TODAY=$(date +%Y%m%d)
sudo livecd-creator --verbose --config=fedora-livecd-cinnamon.ks --fslabel=F21Live-Cinnamon-x86_64-$TODAY --cache=/var/cache/live
