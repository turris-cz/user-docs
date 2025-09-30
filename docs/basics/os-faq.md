---
board: mox, omnia, omnia-ng, 1.x
---

# Frequently asked questions about Turris OS

## What is Turris OS?

Turris OS is a Linux distribution based on top of
[OpenWrt](https://openwrt.org/). It means that we provide patches with some
modifications together with our own feed Turris OS packages. It includes
reForis, Updater-ng, and more packages to be user-friendly, ensure
full-featured packages. Turris OS provides continuous updates for OpenWrt, easy
to use web interface reForis, and integration with
[Turris Sentinel](apps/sentinel.md). Feel free to check out our
[website](https://www.turris.com/turris-os/).

## What versions of Turris OS are supported?

The history of the supported list can be found on [our website](../basics/tos-versions.md),
where you can see when each major version was released and when it is
end-of-life. It means that we will not provide any support for it anymore.

You should have your router up-to-date as soon as possible. We are testing and
suggesting updates from the previous version to the recent version. We can not
ensure that updates over two or more versions will be smooth and user-friendly.

## How can I join testing of upcoming versions?

Each configuration of the router could be unique. If you would like to help us
to improve the Turris OS releases or even use the Turris OS development
versions, which are using development versions of OpenWrt, you can. Still,
there can be some issues with which you need to deal with from time to time.
For example, a missing package or router does not work as it should. That
depends on the selected branch.

Take a look at our dedicated article for [Early testing](../geek/testing.md).

## User interface (reForis, LuCI)

In Turris routers except one device [Turris Shield](../hw/shield/shield.md),
you can find two interfaces.

### reForis

The user interface [reForis](../basics/reforis/intro.md) is developed in-house
and it is simplified to provide safe defaults and the most common features.
Among other things, it contains notifications about updates. Configurations
done in reForis are heavily tested and fully supported.

### LuCI

OpenWrt's administration interface LuCI is developed and available on every
OpenWrt router. Users are able to configure what they desire and even
complicated configurations, but keep in mind that we do not support most
changes done here. It is advised to be used only by experienced users because
LuCI does not verify any values if they are correct. It is possible that some
services do not start because of misconfigurations.

This one is not available on [Turris Shield](../hw/shield/shield.md).

## How do the automatic updates work?

Turris routers check our servers for possible availability of a new update
every two hours (with some variability to spread the load of the update
servers and speed-up the update process). If a new Turris OS version

- newer than the currently used one - is available, the router will download
  and install it.

After that, an automatic restart of the router will be planned according to
the settings (usually at night after three days). You can restart the router
earlier at a moment when you do not mind a current Internet connection loss.

Updates may be delayed or manually approved. If you use delayed updates or
approvals, we suggest configuring sending notifications to your e-mail to be
in the loop about updates.

## What are the _staging updates_?

Releases of Turris OS starting from 7.0 are using a staging updates mechanism.
Although we do automatic updates, we can distribute those over a longer period
of time. When the update will be actually installed on the router is decided
randomly during each release.

If you are one of the routers held back, you will see the following message
when running `pkgupdate` from CLI.

```
There is a newer version available, but update is scheduled after another XYZ
hours. If you want the latest and greatest all the time, switch to one of the
development branches.
```

How many roll-outs are there and which routers will be part of which batch is
determined during the release. But individual routers are assigned to batches
randomly, so if you are in the last batch of people to receive the particular
update, there is a high chance, that the next time, you will get update sooner.

On top of default behaviour, Turris can also decide not to stage any particular
update (for example in case of severe security issue), or update just the
release that people are updating into while keeping the routers waiting for the
update on the same version (just in case new release needs fixup before
everybody hits the problem).

## What I want to re-flash my router with the latest version?

If you somehow end up that the router is not working after some configuration,
you can use snapshots and rollback to the previous state by using schnapps tool.

If you want to start over or simply use re-flash your router by using USB flash
drive, take a look at specific articles for

- [Turris 1.x](../geek/btrfs_turris1x.md#how-to-perform-factory-reset-medkit)
- [Turris Omnia](../hw/omnia/rescue-modes.md#re-flash-router)
- [Turris MOX](../hw/mox/rescue-modes.md#re-flash-router)

## What are the differences between Turris OS and OpenWrt?

Turris OS is a Linux distribution based on OpenWrt. It has multiple features
over OpenWrt, like automatic updates, notifications, snapshots, and much more.
It offers a more straightforward web interface (reForis) that allows you
to configure Turris devices easily. It contains [Sentinel](sentinel/intro.md),
a unique security system that detects various types of attacks and can block
malicious IP addresses in a few seconds. Simply put, Turris OS attempts to be
more user-friendly and secure than OpenWrt.

## Can I use plain OpenWrt without Turris additions?

In principle, yes, because we send the modifications to the Linux kernel and
other OpenWrt components needed for Turris back to the OpenWrt project. However,
we cannot guarantee the right function or provide any support.

## Open-source

All software available within Turris OS and the OpenWrt itself are open-source.
This means that all [the source code](https://gitlab.nic.cz/turris/os/build) is
available. We are based on [OpenWrt](https://openwrt.org/), but for using Wi-Fi
cards and specially ath10k, there are a few blobs required.

About hardware, we release schematics and pinouts. Once, we would not
manufacture any new PCBs, we will release the complete HW documentation like we
do it for [Turris 1.x routers](../hw/turris-1x/turris-1x.md#various-documentation-files).

# Software available within Turris OS

## Updater-ng

One of the objectives of the Turris router is to increase the security of
routers by using regular firmware. That is managed by
[Updater-ng](https://gitlab.nic.cz/turris/updater/updater).

## Schnapps

Turris routers use the Btrfs file system to utilize the advantages of snapshots.
This lets you take all files to the state they were at when the snapshot was
created. It enables the user to simply return to a functional configuration or
to temporarily return to an earlier version of the system.

[Schnapps](../geek/schnapps/schnapps.md) is available in reForis or in CLI.

## Knot Resolver

[Knot Resolver](https://www.knot-resolver.cz/) is the default DNS resolver for
Turris Omnia, Turris MOX and Turris Shield. It is developed by CZ.NIC,
the `.cz` domain registry and many provides are using it.

## Syslog-ng

[Syslog-ng](https://www.syslog-ng.com/products/open-source-log-management/) is
a system log management tool.

## Honeypot as a Service

[Honeypot as a Service](https://haas.nic.cz/) is a public service, which can be
used on any device with a public IPv4 address. It uses the SSH protocol to catch
attackers and provide you details, what credentials they used and what they
were trying to do. To be able to use it, you need to register on their website
and then fill a token in reForis. For more details, take a look at
[dedicated article](../basics/sentinel/haas.md) for this feature.

This is created and maintained by CZ.NIC.

## LibreSpeed

[LibreSpeed](apps/librespeed/index.md) is a too to measure Internet
connection speed. It automatically selects the best available
measurement server worldwide. We provide our own server located
in the Czech Republic (where another server is available too; it
is managed by [CESNET][https://www.cesnet.cz/]).

!!! notice
    LibreSpeed is currently not available for Turris 1.x devices.

## OpenVPN

In reForis and also in LuCI, you can configure [VPN server](../basics/apps/openvpn-server/openvpn.md)
and [VPN client](../basics/apps/openvpn-client/openvpn.md) by using OpenVPN.

## LXC Containers

Many of our users are using some virtualization via LXC or Docker.
This feature is completely untested and not supported by us. We can not
troubleshoot all GNU/Linux distributions for their issues and help to fix them.
It requires knowledge to configure it on an external device to avoid unnecessary
writes to the internal storage to prevent it to be worn out. Also, you need to
be familiar with using SSH.

## NetMetr

[NetMetr](https://www.netmetr.cz/) was another tool to measure connection
speed. It has been discontinued and superseded by LibreSpeed.

# Turris Sentinel

## What it is?

It is a threat detection and cyberattack prevention system.

## How does it work?

First we collect data about suspicious and malicious network traffic on routers.
The data is sent to our servers and analyzed. Each recorded IP address is ranked
with a score based on the analyzes. If the score reaches the given threshold it
is considered as malicious. The list of malicious IP addresses is then supplied
back to routers which update their firewall rules accordingly to block all
network traffic from the malicious IP addresses. This process is happening
completely automatically in real time so we are always up to date with the
newest threats. Beside of that we also do some interesting statistics on the
collected data.

## Which data on router do we collect?

We collect only data incoming from Internet utilizing our minipots and by
parsing firewall logs about rejected and dropped packets.
In general no outgoing data originated from a user is disclosed.

## How can I join the malicious traffic detection / data collection?

To send us data about malicious traffic you have to first agree with our EULA.
It can be then turned on and off any time from our web administration interface
reForis in the Sentinel Sentinel. However for maximal protection we recommend
to leave it on all the time.

## What are the minipots

Minipot is an abbreviation for a minimal honeypot. A honeypot is a decoy system
intended to mimic likely targets of cyberattacks. Its purpose is to collect
information about malicious activities made by cybercriminals. Usually it is a
complex system but this is not our case. Our minipots are lightweight emulations
of well known services running on the application layer (HTTP, FTP, SMTP,
Telnet) and collecting data about connections and login attempts made to them.

## Where I can see any statistics?

You can find all the statistics and also regular daily snapshots of the list of
detected malicious IP addresses at our web interface
[view.sentinel.turris.cz](https://view.sentinel.turris.cz/).

