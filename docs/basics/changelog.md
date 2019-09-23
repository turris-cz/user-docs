# Changelog

Here you can find a list of all releases and release notes starting from Turris
OS 4.0. Those releases are made from combination of
[turris-build](https://gitlab.labs.nic.cz/turris/turris-build) repository and
various repositories with additional packages like
[turris-os-packages](https://gitlab.labs.nic.cz/turris/turris-os-packages).
In our repositories, all releases are tagged and you can read specific git
commit hashes the release is built from.

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

<span id="tos4"></span>

<script type="text/javascript">
//<!--
function render_changelog(changelog) {
    const element = document.getElementById("tos4");

    for (let i in changelog) {
        const release = changelog[i];
        const message = release.message.split('\n');
        const release_date = new Date(release.commit.created_at);
        element.innerHTML += `
<h4 id="${release.name}">${message[0].replace('release','')}</h4>
<h5>Date of release</h5>
<p>${release_date.toString()}</p>
<h5>Sources</h5>
<p>Available on <a href="https://gitlab.labs.nic.cz/turris/turris-build/tree/${release.name}">Gitlab</a>.</p>
<h5>Release notes</h5>
<p><ul>`;
        message.pop();
        for (let line in message) {
            const li = line.match(/^\s?\* (.*)/)
            if (li) {
                element.innerHTML += '<li>' + li[1] + '</li>';
            }
        }
        element.innerHTML += '</ul></p>';
    };
}

fetch('https://gitlab.labs.nic.cz/api/v4/projects/turris%2fturris-build/repository/tags/?search=v4.').
    then(res => res.json()).
    then((json) => {
        render_changelog(json);
});
//-->
</script>
