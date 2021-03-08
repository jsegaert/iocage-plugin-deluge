# iocage-plugin-deluge
Artifact file(s) for Deluge iocage plugin

This plugin will install Deluge and its WebUI from the FreeBSD package

## To install this Plugin
Download the plugin manifest file to your local file system.
```
fetch https://raw.githubusercontent.com/jsegaert/iocage-my-plugins/master/deluge.json
```
Install the plugin.  Adjust the network settings as needed.
```
iocage fetch -P deluge.json -n deluge
```

