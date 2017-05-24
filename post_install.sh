#!/bin/sh
sysrc -f /etc/rc.conf deluged_enable="YES"
sysrc -f /etc/rc.conf deluged_user="nobody"
sysrc -f /etc/rc.conf deluged_confdir="/usr/local/etc/deluge"
sysrc -f /etc/rc.conf deluge_web_enable="YES"
sysrc -f /etc/rc.conf deluge_web_user="nobody"
sysrc -f /etc/rc.conf deluge_web_confdir="/usr/local/etc/deluge"
mkdir -p /usr/local/etc/deluge
chown -R nobody:nobody /usr/local/etc/deluge

echo "Deluge Web UI Password: deluge"
echo "To change, login and you will be prompted."

# Start the services
service deluged start
service deluge_web start
