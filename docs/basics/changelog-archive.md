{!
  include-markdown "./changelog.md"
  start="<!--javascript-start-->"
  end="<!--javascript-end-->"
!}


## Turris OS 5.4

Turris OS 5.4 is based on top of [OpenWrt
19.07](https://openwrt.org/releases/19.07/start) with our feed and a few
patches. It supports [Turris MOX](../hw/mox/intro.md), [Turris
Omnia](../hw/omnia/omnia.md), [Turris Shield](../hw/shield/shield.md), and
[Turris 1.x](../hw/turris-1x/turris-1x.md) routers.

New features:

* Timezone in email notifications
* Updated Nextcloud to version 21
* Updated PHP to version 7.4

### Detailed changelog

<span id="tos54">Loading changelog...</span>
<script type="text/javascript">fetchAndRenderChangelog("v5.4.", "tos54");</script>

## Turris OS 5.3

Turris OS 5.3 is based on top of [OpenWrt
19.07](https://openwrt.org/releases/19.07/start) with our feed and a few
patches. It supports [Turris MOX](../hw/mox/intro.md), [Turris
Omnia](../hw/omnia/omnia.md), [Turris Shield](../hw/shield/shield.md), and
[Turris 1.x](../hw/turris-1x/turris-1x.md) routers.

New features:

* Sentinel improvements (the ability to control and see state of intrusion
  detection tools)
* Foris and reForis start on demand

### Detailed changelog

<span id="tos53">Loading changelog...</span>
<script type="text/javascript">fetchAndRenderChangelog("v5.3.", "tos53");</script>

## Turris OS 5.2

Turris OS 5.2 is based on top of [OpenWrt
19.07](https://openwrt.org/releases/19.07/start) with our feed and a few patches. It
supports [Turris MOX](../hw/mox/intro.md), [Turris Omnia](../hw/omnia/omnia.md)
and [Turris Shield](../hw/shield/shield.md). There is also an experimental
support for [Turris 1.x](../hw/turris-1x/turris-1x.md) routers.

New features:

* reForis (configuration web interface) additions
    * Overview tab
    * Storage plugin with option for persistent system logs
    * Factory reset from web interface
    * Support for Honeypot as a Service (haas.nic.cz)
    * Add option to change hostname in reForis
    * Fix DHCP range configuration check
    * A few design improvements
* WebApps: New graphical design with optional dark mode
* Sentinel: Introduce replacement for firewall logs collector
* Turris MOX: Update firmware for SDIO card
* Add RIPE Atlas SW probe and common passwords as package lists
* Automatic installation of drivers for limited amount of LTE and DVB devices

### Detailed changelog

<span id="tos52">Loading changelog...</span>
<script type="text/javascript">fetchAndRenderChangelog("v5.2.", "tos52");</script>

## Turris OS 5.1

Turris OS 5.1 is based on top of [OpenWrt 19.07](https://openwrt.org/releases/19.07/start)
with our feed and few patches. It supports [Turris MOX](../hw/mox/intro.md),
[Turris Omnia](../hw/omnia/omnia.md) and [Turris Shield](../hw/shield/shield.md).
There is also an experimental support for [Turris 1.x](../hw/turris-1x/turris-1x.md) routers.

This release contains new configuration frontend named reForis and several tabs
in Foris were deprecated in favor of reForis. In reForis you can find more
detailed package selection as well as basic integration of Turris Sentinel.

New features:

* Introduced new data collection system Sentinel
* reForis (future default web interface)
    * Now installed by default
    * Added NetMetr, OpenVPN client, and remote devices plugins
* Package lists
    * Expanded with labels and additional options
    * Added option to select alternative WiFi drivers
* Nextcloud updated to version 18

### Detailed changelog

<span id="tos51">Loading changelog...</span>
<script type="text/javascript">fetchAndRenderChangelog("v5.1.", "tos51");</script>


## Turris OS 5.0

Turris OS 5 is based on top of [OpenWrt 19.07](https://openwrt.org/releases/19.07/start)
with our feed and few patches. It supports [Turris MOX](../hw/mox/intro.md) and [Turris Omnia](../hw/omnia/omnia.md) and
there is an experimental support for [Turris 1.x](../hw/turris-1x/turris-1x.md) routers.

One important feature from Turris OS 3.x is still missing – possibility to
configure honeypots and various aspects of security data collection from web ui.
This is going to be added to the minor versions of Turris OS 5.x.

New features:

* Added support for secondary IP addresses for DNS servers
* Added possibility to add custom DNS forwarder
* Added support for DVB tuners – Astrometa DVB-T2 and Xbox One
* Redesigned Foris, which is being in development (opt-in)
* Optional WPA3 support

### Detailed changelog

<span id="tos50">Loading changelog...</span>
<script type="text/javascript">fetchAndRenderChangelog("v5.0.", "tos50");</script>

## Turris OS 4

Turris OS 4 is based on [OpenWrt 18.06](https://openwrt.org/releases/18.06/start).
It poses a huge milestone in terms of Turris OS development as it was used to
test the feasibility of developing on top of moving upstream release with just
our feed and few patches. Everything had to be rebuilt from scratch so it was a
huge task to move away from our forked distribution and we took the opportunity
to get rid of some of the skeletons in our closets.

First final release was 4.0 after long series of alphas betas and after long
development and testing. Initially supported devices were only [Turris
MOX](../hw/mox/intro.md) and [Turris Omnia](../hw/omnia/omnia.md). It was
missing some of the features that were in 3.X series, but on the other hand it
contained some features never included in 3.X series.

Missing features:

* samba4 not back-ported
* cloud backups
* ability to configure various honeypots and security data collection from web UI

New features:

* [Nextcloud](../geek/nextcloud/nextcloud.md) integration
* multiple drives support in [Storage plugin](foris/storage-plugin/storage-plugin.md)

### Detailed changelog

<span id="tos4">Loading changelog...</span>
<script type="text/javascript">fetchAndRenderChangelog("v4.", "tos4");</script>
