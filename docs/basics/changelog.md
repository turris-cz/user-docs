<script type="text/javascript">
//<!--
function render_changelog(changelog, element) {
    for (let i in changelog) {
        const release = changelog[i];
        const message = release.message.split('\n');
        const release_date = new Date(release.commit.created_at);
        element.innerHTML += `
<h4 id="${release.name}">${message[0].replace('release','')}</h4>
<h5>Date of release</h5>
<p>${release_date.toString()}</p>
<h5>Sources</h5>
<p>Available on <a href="https://gitlab.nic.cz/turris/turris-build/tree/${release.name}">Gitlab</a>.</p>
<h5>Release notes</h5>`;
        message.pop();
        let notes='<ul>';
        for (let line in message) {
            console.log(message[line]);
            const li = message[line].match(/^\s?\* (.*)/)
            if (li) {
                notes += '<li>' + li[1] + '</li>';
            }
        }
        notes += '</ul>';
        element.innerHTML += notes;
    };
}

function changelog(version, span_id) {
    const element = document.getElementById(span_id);
	element.innerHTML = '';
	fetch('https://gitlab.nic.cz/api/v4/projects/turris%2fturris-build/repository/tags/?search=' + version).
		then(res => res.json()).
		then((json) => {
			render_changelog(json, element);
	});
}
//-->
</script>

# Changelog

Here you can find a list of all releases and release notes starting from Turris
OS 4.0. Those releases are made from combination of
[turris-build](https://gitlab.nic.cz/turris/turris-build) repository and
various repositories with additional packages like
[turris-os-packages](https://gitlab.nic.cz/turris/turris-os-packages).
In our repositories, all releases are tagged and you can read specific git
commit hashes the release is built from.

## Turris OS 5.0

Turris OS 5 is based on top of [OpenWrt 19.07](https://openwrt.org/releases/19.07/start)
with our feed and few patches. It supports [Turris MOX](../hw/mox/intro.md) and [Turris Omnia](../hw/omnia/omnia.md) and
there is an experimental support for [Turris 1.x](../hw/turris-1x/turris-1x.md) routers.

One important feature from Turris OS 3.x is still missing - possibility to
configure honeypots and various aspects of security data collection from web ui.
This is going to be added to the minor versions of Turris OS 5.x.

New features:

* Added support for secondary IP addresses for DNS servers
* Added possibility to add custom DNS forwarder
* Added support for DVB tuners - Astrometa DVB-T2 and Xbox One
* Redesigned Foris, which is being in development (opt-in)
* Optional WPA3 support

### Detailed changelog

<span id="tos50">Loading changelog...</span>
<script type="text/javascript">
//<!--
changelog("v5.0.", "tos50");
//-->
</script>

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
<script type="text/javascript">
//<!--
changelog("v4.", "tos4");
//-->
</script>
