<script type="text/javascript">
function render_changelog(changelog, element) {
    element.innerHTML = '';
    for (let i in changelog) {
        const release = changelog[i];
        const message = release.message.split('\n');
        const release_date = new Date(release.commit.created_at);
        element.innerHTML += `
<h4 id="${release.name}">${message[0].replace('release','')}</h4>
<h5>Date of release</h5>
<p>${release_date.toString()}</p>
<h5>Sources</h5>
<p>Available on <a target="_blank" href="https://gitlab.nic.cz/turris/os/build/tree/${release.name}">Gitlab</a>.</p>
<h5>Release notes</h5>
<ul id="release-notes-${release.name}"></ul>`;
        message.map(line => {
            const firstListItem = line.match(/^\s?\* (.*)/); // Matches a line with a first level item
            const secondListItem = line.match(/^\s+\* (.+)$/); // Matches a line with a second level item
            const secondListItemDot = line.match(/^\s+\• (.+)$/); // Matches a line with a bullet character
            const firstListItemEmoji = line.match(/(?:[\u2700-\u27bf]|(?:\ud83c[\udde6-\uddff]){2}|[\ud800-\udbff][\udc00-\udfff]|[\u0023-\u0039]\ufe0f?\u20e3|\u3299|\u3297|\u303d|\u3030|\u24c2|\ud83c[\udd70-\udd71]|\ud83c[\udd7e-\udd7f]|\ud83c\udd8e|\ud83c[\udd91-\udd9a]|\ud83c[\udde6-\uddff]|\ud83c[\ude01-\ude02]|\ud83c\ude1a|\ud83c\ude2f|\ud83c[\ude32-\ude3a]|\ud83c[\ude50-\ude51]|\u203c|\u2049|[\u25aa-\u25ab]|\u25b6|\u25c0|[\u25fb-\u25fe]|\u00a9|\u00ae|\u2122|\u2139|\ud83c\udc04|[\u2600-\u26FF]|\u2b05|\u2b06|\u2b07|\u2b1b|\u2b1c|\u2b50|\u2b55|\u231a|\u231b|\u2328|\u23cf|[\u23e9-\u23f3]|[\u23f8-\u23fa]|\ud83c\udccf|\u2934|\u2935|[\u2190-\u21ff])/); // Matches a line with emoji symbols

            const releaseNotesList = document.getElementById(`release-notes-${release.name}`);
            const newListItem = document.createElement("li");
            const newSubListItem = document.createElement("ul");
            const firstChild = releaseNotesList.firstChild;
            const lastChild = releaseNotesList.lastChild;

            if (firstListItem) {
                newListItem.innerHTML = firstListItem[1];
                releaseNotesList.appendChild(newListItem);
            }

            if (secondListItem) {
                newListItem.innerHTML = secondListItem[1];
                newSubListItem.appendChild(newListItem);
                // Insert nested list item inside the first one
                firstChild.insertAdjacentElement('beforeend', newSubListItem);
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
                lastChild.insertAdjacentElement('beforeend', newSubListItem);
            }
        })
    };
}

function changelog(version, span_id) {
    const element = document.getElementById(span_id);
	fetch('https://gitlab.nic.cz/api/v4/projects/turris%2fos%2fbuild/repository/tags/?search=' + version).
		then(res => res.json()).
		then((json) => {
			render_changelog(json, element);
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

## Turris OS 5.3

Turris OS 5.3 is based on top of [OpenWrt
19.07](https://openwrt.org/releases/19.07/start) with our feed and a few
patches. It supports [Turris MOX](../hw/mox/intro.md), [Turris
Omnia](../hw/omnia/omnia.md), [Turris Shield](../hw/shield/shield.md) and
[Turris 1.x](../hw/turris-1x/turris-1x.md) routers.

New features:

* Sentinel improvements (the ability to control and see state of intrusion
  detection tools)
* Foris and reForis start on demand

### Detailed changelog

<span id="tos53">Loading changelog...</span>
<script type="text/javascript">changelog("v5.3.", "tos53");</script>

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
<script type="text/javascript">changelog("v5.2.", "tos52");</script>

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
<script type="text/javascript">changelog("v5.1.", "tos51");</script>


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
<script type="text/javascript">changelog("v5.0.", "tos50");</script>

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
<script type="text/javascript">changelog("v4.", "tos4");</script>
