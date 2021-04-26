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
## Important note about Internet Service Providers

Some [Internet Service Providers](https://en.wikipedia.org/wiki/Internet_service_provider)
(ISPs) actively detect potentially vulnerable services running by their
customers. If they find such services they send notification or even block
external access to such ports.

!!! info
    The same applies for some community, municipal or other networks as well.

Some parts of Sentinel ([Minipots and HaaS](collect.md)) may be detected as
such vulnerable services because they emulate them to catch potential
attackers without any risk (the attackers do not enter any real environment).

What to say to your ISP if you receive such warning:

1. Those services are operated intentionally as a part of the Sentinel security
   research project.
2. They are provided by honeypots and not vulnerable software.
3. The results of the project are instantly deployed to routers and improve
   security of the routers and the networks beyond them.
4. You want to keep those ports/service accessible from the Internet.

Please let us to know ([tech.support@turris.cz](mailto:tech.support@turris.cz))
if your ISP sends you such warning or event applies some "protective" measures
on your Internet connection.

!!! warning
    Some ISPs silently block access to some ports (they do not declare that
    they do so). It is useful to ask explicitly which ports are blocked.
