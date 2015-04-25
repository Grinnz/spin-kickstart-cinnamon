#!/bin/bash
TODAY=$(date +%Y%m%d)
sudo setarch i686 livecd-creator --verbose --config=fedora-livecd-cinnamon.ks --fslabel=F22Live-Cinnamon-i686-$TODAY --cache=/var/cache/live
