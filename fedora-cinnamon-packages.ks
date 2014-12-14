# fedora-livecd-cinnamon.ks
#
# Description:
# - Fedora Live Spin with the Cinnamon Desktop Environment


%packages

@networkmanager-submodules
@cinnamon-desktop
@libreoffice

# unlock default keyring. FIXME: Should probably be done in comps
gnome-keyring-pam

# save some space
-desktop-backgrounds-basic
-realmd                     # only seems to be used in GNOME
-PackageKit*                # we switched to yumex, so we don't need this
-aspell-*                   # dictionaries are big

%end
