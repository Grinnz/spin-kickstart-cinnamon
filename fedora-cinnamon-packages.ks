# fedora-livecd-cinnamon.ks
#
# Description:
# - Fedora Live Spin with the Cinnamon Desktop Environment
#
# Maintainer(s):
# - Dan Book <grinnz@grinnz.com>

%packages

@networkmanager-submodules
@cinnamon-desktop
@libreoffice

# unlock default keyring. FIXME: Should probably be done in comps
gnome-keyring-pam

# save some space
-fedora-icon-theme
-PackageKit*                # we switched to yumex, so we don't need this

# no bluetooth support
-bluez
-bluez-cups
-NetworkManager-bluetooth

%end
