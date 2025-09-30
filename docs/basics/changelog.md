<!--javascript-start-->
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
<!--javascript-end-->

# Changelog

Here you can find a list of all releases and release notes starting from Turris
OS 4.0. Those releases are made from combination of
[turris-build](https://gitlab.nic.cz/turris/os/build) repository and
various repositories with additional packages like
[turris-os-packages](https://gitlab.nic.cz/turris/os/packages).
In our repositories, all releases are tagged and you can read specific git
commit hashes the release is built from.

## Turris OS 7.2

Turris OS 7.2 is based on the top of [OpenWrt 22.03](https://openwrt.org/releases/22.03/start)
with our feed and a few patches. It supports [Turris MOX](../hw/mox/intro.md),
[Turris Omnia](../hw/omnia/omnia.md) and [Turris 1.x](../hw/turris-1x/turris-1x.md)
routers.

New features:

* Port forwarding integrated into reForis WebUI
* Add link to the documentation (reForis)
* Diagnostics - add mwan3, watchcat and nftables information to help debugging LTE/5G
* New package to play sounds over the serial port

### Detailed changelog

<span id="tos72">Loading changelog...</span>
<script type="text/javascript">fetchAndRenderChangelog("v7.2.", "tos72");</script>

## Turris OS 7.1

Turris OS 7.1 is based on the top of [OpenWrt 22.03](https://openwrt.org/releases/22.03/start)
with our feed and a few patches. It supports [Turris MOX](../hw/mox/intro.md),
[Turris Omnia](../hw/omnia/omnia.md) and [Turris 1.x](../hw/turris-1x/turris-1x.md)
routers.

TOS 7.1 is the first version that uses `nftables` instead of `iptables`.

New features:

* Switch to `nftables`
* Major rework of reForis under the hood
* Dark mode in reForis

### Detailed changelog

<span id="tos71">Loading changelog...</span>
<script type="text/javascript">fetchAndRenderChangelog("v7.1.", "tos71");</script>

## Turris OS 7.0

Turris OS 7 is based on the top of [OpenWrt 22.03](https://openwrt.org/releases/22.03/start)
with our feed and a few patches. It supports [Turris MOX](../hw/mox/intro.md),
[Turris Omnia](../hw/omnia/omnia.md) and [Turris 1.x](../hw/turris-1x/turris-1x.md)
routers.

In 7.0, we are still using `iptables` for the firewall while the upstream is moving
towards `nftables`. We decided to stick with it to limit the amount of changes
in the new release.

Apart from that, Turris OS 7.0 is the first one to use [staging updates](os-faq.md#what-are-the-staging-updates).

### Detailed changelog

<span id="tos70">Loading changelog...</span>
<script type="text/javascript">fetchAndRenderChangelog("v7.0.", "tos70");</script>

## Turris OS 6.5

Turris OS 6.5 is based on top of [OpenWrt
21.02](https://openwrt.org/releases/21.02/start) with our feed and a few
patches. It supports [Turris MOX](../hw/mox/intro.md), [Turris
Omnia](../hw/omnia/omnia.md), [Turris Shield](../hw/shield/shield.md), and
[Turris 1.x](../hw/turris-1x/turris-1x.md) routers.

New features:

* Option to update the firmware to the latest version
* Support for new features in MCU firmware
* Support for pref64 (RFC 8781)
* Aggregated notifications and ignore list in Morce
* OpenSSH upgraded to 9.6p1

### Detailed changelog

<span id="tos65">Loading changelog...</span>
<script type="text/javascript">fetchAndRenderChangelog("v6.5.", "tos65");</script>

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

## Older versions

Older versions than TOS 6.0 have been moved to the [archive](changelog-archive.md).
