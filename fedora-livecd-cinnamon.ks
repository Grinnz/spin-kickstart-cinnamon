# fedora-livecd-cinnamon.ks
#
# Description:
# - Fedora Live Spin with the Cinnamon Desktop Environment
#
# Maintainer(s):
# - Daniel Book <grinnz@gmail.com>

%include /usr/share/spin-kickstarts/fedora-live-base.ks
%include /usr/share/spin-kickstarts/fedora-live-minimization.ks
%include fedora-cinnamon-packages.ks

%post
# cinnamon configuration

# This is a huge file and things work ok without it
rm -f /usr/share/icons/HighContrast/icon-theme.cache

# create /etc/sysconfig/desktop (needed for installation)

cat > /etc/sysconfig/desktop <<EOF
PREFERRED=/usr/bin/cinnamon-session
DISPLAYMANAGER=/usr/sbin/lightdm
EOF

cat >> /etc/rc.d/init.d/livesys << EOF

#mkdir -p /home/liveuser/.config/cinnamon-session

#cat > /home/liveuser/.config/xfce4/helpers.rc << FOE
#MailReader=sylpheed-claws
#FileManager=Thunar
#WebBrowser=midori
#FOE

# disable screensaver locking (#674410)
#cat >> /home/liveuser/.xscreensaver << FOE
#mode:           off
#lock:           False
#dpmsEnabled:    False
#FOE

# deactivate xfconf-migration (#683161)
#rm -f /etc/xdg/autostart/xfconf-migration-4.6.desktop || :

# deactivate xfce4-panel first-run dialog (#693569)
#mkdir -p /home/liveuser/.config/xfce4/xfconf/xfce-perchannel-xml
#cp /etc/xdg/xfce4/panel/default.xml /home/liveuser/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml

# set up lightdm autologin
sed -i 's/^#autologin-user=.*/autologin-user=liveuser/' /etc/lightdm/lightdm.conf
sed -i 's/^#autologin-user-timeout=.*/autologin-user-timeout=0/' /etc/lightdm/lightdm.conf
#sed -i 's/^#show-language-selector=.*/show-language-selector=true/' /etc/lightdm/lightdm-gtk-greeter.conf

# set Cinnamon as default session, otherwise login will fail
sed -i 's/^#user-session=.*/user-session=cinnamon/' /etc/lightdm/lightdm.conf

# Show harddisk install on the desktop
sed -i -e 's/NoDisplay=true/NoDisplay=false/' /usr/share/applications/liveinst.desktop
mkdir /home/liveuser/Desktop
cp /usr/share/applications/liveinst.desktop /home/liveuser/Desktop

# and mark it as executable
chmod +x /home/liveuser/Desktop/liveinst.desktop

# this goes at the end after all other changes. 
chown -R liveuser:liveuser /home/liveuser
restorecon -R /home/liveuser

EOF

%end

