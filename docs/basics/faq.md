# Frequently asked questions

## Turris OS and updates

### What is Turris OS?

Turris OS is a Linux distribution based on top of
[OpenWrt](https://openwrt.org/). It means that we provide patches with some
modifications together with our own feed Turris OS packages. It includes
reForis, Updater-ng and more packages to be user-friendly, ensure
full-featured packages. Turris OS provides continuous updates for OpenWrt, easy
to use web interface reForis and integration with
[Turris Sentinel](apps/sentinel.md). Feel free to checkout our
[website](https://www.turris.com/turris-os/).

### Is Turris OS 3.11 stable and recommended software version?

Turris OS 3.11 is a stable version that is still supported. It means, that we
keep providing security updates if needed. It does not contain the newest
software though. Therefore we would rather recommend switching to the newest
version (Turris OS 5.3 at the time of actualization of this text).

#### Possibilities:

- re-flash to the actual version
    - [Turris Omnia](../hw/omnia/rescue-modes.md#re-flash-router)
    - [Turris 1.x](../geek/btrfs_turris1x.md#how-to-use-turris-os-5x)
- [migration](../geek/tos3-migration.md)

There is a [list of different Turris OS versions](tos-versions.md) in our
documentation.

### Is Turris OS 5.3 stable and recommended software version?

Yes, it is a current stable version. It is recommended to keep automatic
updates on though.

### How to migrate settings from Turris OS 3.x to actual Turris OS version?

A how to on the migration is available at our
[documentation page](../geek/tos3-migration.md).

### How do the automatic updates work?

Turris routers check our servers for possible availability of a new update
every four hours. If a new Turris OS version - newer than the currently used
one - is available, the router would download and install it.

After that, an automatic restart of the router will be planned according to
the settings (usually at night after three days). You can restart the router
earlier at a moment, when you do not mind a current Internet connection loss.

### Can I use plain OpenWrt without Turris additions?

In principle, yes, because we send the modifications to the Linux kernel and
other OpenWrt components needed for Turris back to the OpenWrt project. However,
we cannot guarantee the right function or provide any support.

### Where to find and download the latest Turris OS version or a recovery image?

The installation images of Turris OS are available on
[repo.turris.cz](https://repo.turris.cz/). You can find stable versions in
the directory [/hbs/medkit/](https://repo.turris.cz/hbs/medkit/). For Omnia it
is the file `omnia-medkit-latest.tar.gz`, for MOX `mox-medkit-latest.tar.gz`
and for Shield `mox-medkit-contract-shield-latest.tar.gz`.

For each file, you can also find the hash files `*.md5` and `*.sha256` and
the electronic signature files `*.sig`. We strongly recommend checking at
least the hash (better SHA-256) and, if possible, the signature for
the downloaded image.


## Documentation and community

### What is our user forum for?

The user forum is primarily used for communication between users of Turris
devices. Users can share their experiences, recommend appropriate solutions
to certain situations, consult on device integration into different
environments, etc.

Sometimes members of the Turris team are involved in communication (especially
they announce new versions of Turris OS and other news in the project). But
the forum is not designed for user support. Please contact us by e-mail:
[tech.support@turris.cz](mailto:tech.support@turris.cz).


## Hardware

### What SFP modules can be used in Turris devices?

All of those, which fulfill
the [SFP standard](https://www.snia.org/technology-communities/sff/specifications),
work on 100Mbps / 1Gbps / 2.5Gbps / SGMII. There are some others, which work too,
despite not fulfilling the standard, if they are supported by the Linux kernel.

It is needed to ask the producer for information about the standard fulfilling
or the Linux kernel support. Although they often respond, that it works only
on their own devices. On our
[community forum](https://gitlab.nic.cz/turris/biz/online/org/-/wikis/forum.turris.cz),
there are messages from our users, who test different SFP modules on Turris
Omnia or MOX. There is a list of compatible SFP modules, which can be found in our
[community documentation](https://wiki.turris.cz/doc/en/public/sfp) too. Anyone can
register there and log in and then add their own SFP module, which they tried.
