<script type="text/javascript">
async function fetchAndRenderChangelog(releaseVersion, changelogSpanId) {
    const element = document.getElementById(changelogSpanId);

    const response = await fetch(
        `https://gitlab.nic.cz/api/v4/projects/turris%2fos%2fbuild/repository/tags/?search=${releaseVersion}`
    );

    if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
    }

    const data = await response.json();

    renderChangelog(data, element);
}

function renderChangelog(changelog, element) {
    element.innerHTML = "";

    if (changelog.length === 0) {
        element.innerHTML += `<p>There is no detailed changelog yet.<p>`;
    }

    for (let i in changelog) {
        const release = changelog[i];
        const message = release.message.split("\n");
        const releaseVersion = release.name;
        console.log(releaseVersion);
        const releaseDate = new Date(release.commit.created_at);

        element.innerHTML += `
        <h4 id="${releaseVersion}">${message[0].replace("release", "")}</h4>
        <h5>Date of release</h5>
        <p>${releaseDate.toDateString()}</p>
        <h5>Sources</h5>
        <p>Available on <a target="_blank" href="https://gitlab.nic.cz/turris/os/build/tree/${releaseVersion}">GitLab</a>.</p>
        <h5>Release notes</h5>
        <ul id="release-notes-${releaseVersion}"></ul>`;

        renderDetailedChangelog(message, releaseVersion);
    }
}

function renderDetailedChangelog(message, releaseVersion) {
    const releaseNotesList = document.getElementById(
        `release-notes-${releaseVersion}`
    );

    message.map((line) => {
        const newListItem = document.createElement("li");
        const newSubListItem = document.createElement("ul");

        // Matches the first level line with an asterisks
        const firstListItem = line.match(/^\s?\* (.*)/);
        // Matches the second level line with an asterisks
        const secondListItem = line.match(/^\s+\* (.+)$/);
        // Matches the second level line with a bullet character
        const secondListItemDot = line.match(/^\s{2}\•(.+)$/);
        // Matches the third level line with a bullet character
        const thirdListItemDot = line.match(/^\s{4}\•(.+)$/);
        // Matches the fourth level line with a bullet character
        const fourthListItemDot = line.match(/^\s{6}\•(.+)$/);
        // Matches the line with emoji symbols at the beginning of a string
        const firstListItemEmoji = line.match(
            /(?:^[\u2700-\u27bf]|(?:\ud83c[\udde6-\uddff]){2}|[\ud800-\udbff][\udc00-\udfff]|[\u0023-\u0039]\ufe0f?\u20e3|\u3299|\u3297|\u303d|\u3030|\u24c2|\ud83c[\udd70-\udd71]|\ud83c[\udd7e-\udd7f]|\ud83c\udd8e|\ud83c[\udd91-\udd9a]|\ud83c[\udde6-\uddff]|\ud83c[\ude01-\ude02]|\ud83c\ude1a|\ud83c\ude2f|\ud83c[\ude32-\ude3a]|\ud83c[\ude50-\ude51]|\u203c|\u2049|[\u25aa-\u25ab]|\u25b6|\u25c0|[\u25fb-\u25fe]|\u00a9|\u00ae|\u2122|\u2139|\ud83c\udc04|[\u2600-\u26FF]|\u2b05|\u2b06|\u2b07|\u2b1b|\u2b1c|\u2b50|\u2b55|\u231a|\u231b|\u2328|\u23cf|[\u23e9-\u23f3]|[\u23f8-\u23fa]|\ud83c\udccf|\u2934|\u2935|[\u2190-\u21ff])/
        );

        if (firstListItem) {
            newListItem.innerHTML = firstListItem[1];
            releaseNotesList.appendChild(newListItem);
        }

        if (secondListItem) {
            newListItem.innerHTML = secondListItem[1];
            newSubListItem.appendChild(newListItem);
            releaseNotesList.lastChild.appendChild(newSubListItem);
        }

        if (firstListItemEmoji) {
            newListItem.innerHTML = firstListItemEmoji.input;
            newListItem.style.listStyleType = "none";
            newListItem.style.marginLeft = 0;
            releaseNotesList.appendChild(newListItem);
        }

        if (secondListItemDot) {
            newListItem.innerHTML = secondListItemDot[1];
            newSubListItem.appendChild(newListItem);
            releaseNotesList.lastChild.appendChild(newSubListItem);
        }

        if (thirdListItemDot) {
            newListItem.innerHTML = thirdListItemDot[1];
            newSubListItem.appendChild(newListItem);
            releaseNotesList.lastChild.lastChild.appendChild(newSubListItem);
        }

        if (fourthListItemDot) {
            newListItem.innerHTML = fourthListItemDot[1];
            newSubListItem.appendChild(newListItem);
            releaseNotesList.lastChild.lastChild.lastChild.appendChild(
                newSubListItem
            );
        }
    });
}
</script>

# Changelog

Here you can find a list of all releases and release notes starting from Turris
OS 4.0. Those releases are made from combination of
[turris-build](https://gitlab.nic.cz/turris/os/build) repository and
various repositories with additional packages like
[turris-os-packages](https://gitlab.nic.cz/turris/os/packages).
In our repositories, all releases are tagged and you can read specific git
commit hashes the release is built from.

## Turris OS 6.4

Turris OS 6.4 is based on top of [OpenWrt
21.02](https://openwrt.org/releases/21.02/start) with our feed and a few
patches. It supports [Turris MOX](../hw/mox/intro.md), [Turris
Omnia](../hw/omnia/omnia.md), [Turris Shield](../hw/shield/shield.md), and
[Turris 1.x](../hw/turris-1x/turris-1x.md) routers.

New features:

* Add support for Neoway N75-EA, Quectel EP06 and Sierra Wireless WP7607
* Nextcloud now uses the upstream updating solution which automatically
  updates it to the last Nextcloud version

### Detailed changelog

<span id="tos64">Loading changelog...</span>
<script type="text/javascript">fetchAndRenderChangelog("v6.4.", "tos64");</script>

## Turris OS 6.3

Turris OS 6.3 is based on top of [OpenWrt
21.02](https://openwrt.org/releases/21.02/start) with our feed and a few
patches. It supports [Turris MOX](../hw/mox/intro.md), [Turris
Omnia](../hw/omnia/omnia.md), [Turris Shield](../hw/shield/shield.md), and
[Turris 1.x](../hw/turris-1x/turris-1x.md) routers.

New features:

* Syncthing and Transmission WebApps now use Turris Auth
* LibreSpeed reForis plugin for measuring network speed replacing Netmetr

### Detailed changelog

<span id="tos63">Loading changelog...</span>
<script type="text/javascript">fetchAndRenderChangelog("v6.3.", "tos63");</script>

## Turris OS 6.2

Turris OS 6.2 is based on top of [OpenWrt
21.02](https://openwrt.org/releases/21.02/start) with our feed and a few
patches. It supports [Turris MOX](../hw/mox/intro.md), [Turris
Omnia](../hw/omnia/omnia.md), [Turris Shield](../hw/shield/shield.md), and
[Turris 1.x](../hw/turris-1x/turris-1x.md) routers.

New features:

* Redesigned WebApps
* Syncthing integration

### Detailed changelog

<span id="tos62">Loading changelog...</span>
<script type="text/javascript">fetchAndRenderChangelog("v6.2.", "tos62");</script>

## Turris OS 6.1

Turris OS 6.1 is based on top of [OpenWrt
21.02](https://openwrt.org/releases/21.02/start) with our feed and a few
patches. It supports [Turris MOX](../hw/mox/intro.md), [Turris
Omnia](../hw/omnia/omnia.md), [Turris Shield](../hw/shield/shield.md), and
[Turris 1.x](../hw/turris-1x/turris-1x.md) routers.

New features:

* VLAN support for WAN interface in reForis
* Credentials (username, password) support in OpenVPN reForis client
* Nextcloud updated to 23.0.11 and uses PHP 8

### Detailed changelog

<span id="tos61">Loading changelog...</span>
<script type="text/javascript">fetchAndRenderChangelog("v6.1.", "tos61");</script>

## Turris OS 6.0

Turris OS 6.0 is based on top of [OpenWrt
21.02](https://openwrt.org/releases/21.02/start) with our feed and a few
patches. It supports [Turris MOX](../hw/mox/intro.md), [Turris
Omnia](../hw/omnia/omnia.md), [Turris Shield](../hw/shield/shield.md), and
[Turris 1.x](../hw/turris-1x/turris-1x.md) routers.

New features:

* Morce (integrated IDS)
* Wi-Fi 6 cards supported
* Turris Auth (login gateway)
* Parental control (PaKon) now has a separate page
* New LEDs driver for all routers
* Dashboard in LuCI
* NetMetr supports measurement with IPv6 address
* Improved support for Turris 1.x routers
    * New Device Tree
    * PowerPC SPE utilized – should improve performance
    * Knot Resolver by default

### Detailed changelog

<span id="tos60">Loading changelog...</span>
<script type="text/javascript">fetchAndRenderChangelog("v6.0.", "tos60");</script>

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
