# Changelog

Here you can find a list of all releases and release notes starting from Turris
OS 4.0. Those releases are made from combination of
[turris-build](https://gitlab.labs.nic.cz/turris/turris-build) repository and
various repositories with additional packages like
[turris-os-packages](https://gitlab.labs.nic.cz/turris/turris-os-packages).
In our repositories, all releases are tagged and you can read specific git
commit hashes the release is built from.

<script>
function render_changelog(changelog) {
    const element = document.getElementById("changelog").parentNode;

    for (let i in changelog) {
        const release = changelog[i];
        const message = release.message.split('\n');
        const release_date = new Date(release.commit.created_at);
        element.innerHTML += `
<h3 id="${release.name}">${message[0].replace('release','')}</h3>
<h4>Date of release</h4>
<p>${release_date.toString()}</p>
<h4>Sources</h4>
<p>Available on <a href="https://gitlab.labs.nic.cz/turris/turris-build/tree/${release.name}">Gitlab</a>.</p>
<h4>Release notes</h4>
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

fetch('https://gitlab.labs.nic.cz/api/v4/projects/turris%2fturris-build/repository/tags').
    then(res => res.json()).
    then((json) => {
        render_changelog(json);
});
</script>
