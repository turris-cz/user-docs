---
board: mox, omnia, 1.x
competency: novice
---
## How to set up data collection?

The whole functionality is nowadays provided by [Sentinel](../apps/sentinel.md).
You just need to enable the _Data Collection_ package list in the
_Package Management_ tab and agree with our
[EULA](https://gitlab.nic.cz/turris/sentinel/eula/-/blob/master/eulas/1.txt)
via _Data Collection_ tab in reForis. This will install and enable
[dynamic firewall](dynfw/collect-dynfw.md) and other selected data collection
components.

![Package Sentinel](reforis-pkg-sentinel.png)
![EULA](reforis-collect-eula.png)

You can also install the data collection manually using command line (SSH):
```
opkg update
opkg install turris-survey sentinel-dynfw-client sentinel-nikola sentinel-minipot haas-proxy
uci set sentinel.main.agreed_with_eula_version=1 && uci commit
```

In both cases, few extra steps are needed to activate HaaS:

1. Register on our website - [HaaS.nic.cz](https://haas.nic.cz).
2. There, in section _My Honeypot_ click on _Add new device_. After
naming it, you will get a **token**
![HaaS Device](haas-device.png)
3. Add your token to the router using command line (SSH):
```
uci set haas.settings.token="YOUR_TOKEN"
uci commit
/etc/init.d/haas-proxy enable
/etc/init.d/haas-proxy start
```
