#!/bin/bash
TODAY=$(date +%Y%m%d)
sudo setarch i686 livecd-creator --verbose --config=fedora-livecd-cinnamon.ks --fslabel=F21Live-Cinnamon-i686-$TODAY --cache=/var/cache/live
