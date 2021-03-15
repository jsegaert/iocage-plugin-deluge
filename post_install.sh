#!/bin/sh

# Temporary hack to downgrade libtorrent-rasterbar as per https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=254118
pkg install -y libiconv
pkg add -f https://github.com/jsegaert/binaries/releases/download/V0%2C1/libtorrent-rasterbar-1.2.10.txz
pkg add -f https://github.com/jsegaert/binaries/releases/download/V0%2C1/py37-libtorrent-rasterbar-1.2.10.txz


# Prepare the system
pw useradd -n deluge -u 8675309 -m -c "Deluge BitTorrent Client" -s /usr/sbin/nologin -w no
mkdir -p /home/deluge/.config/deluge     
chown -R deluge:deluge /home/deluge/

mkdir /Downloads
chown deluge:deluge /Downloads

# Configure the services
sysrc -f /etc/rc.conf deluged_enable="YES"
sysrc -f /etc/rc.conf deluged_user="deluge"
sysrc -f /etc/rc.conf deluged_confdir="/home/deluge/.config/deluge"

sysrc -f /etc/rc.conf deluge_web_enable="YES"
sysrc -f /etc/rc.conf deluge_web_user="deluge"
sysrc -f /etc/rc.conf deluge_web_confdir="/home/deluge/.config/deluge"

echo "The initial password for the WebUI is: deluge" > /root/PLUGIN_INFO
echo "To change, login and you will be prompted." >> /root/PLUGIN_INFO
echo "The default download directory is: /Downloads" >> /root/PLUGIN_INFO

# Start the services
service deluged start
service deluge_web start

