spin-kickstart-cinnamon
=======================

Custom Cinnamon LiveCD Spin for Fedora 22

##Official Spin

The Cinnamon Spin has been accepted for Fedora 23 and the kickstart files are now managed in the [fedora-kickstarts](https://pagure.io/fedora-kickstarts) repository. The spin can be downloaded at https://spins.fedoraproject.org/cinnamon/.

##Spinning

To create a respin, you must have `fedora-kickstarts` and `livecd-tools` installed.

    sudo dnf install fedora-kickstarts livecd-tools

Then, run the provided script (requires sudo permissions):

    ./spin.sh

