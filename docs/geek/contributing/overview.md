# Contributing overview
Do you want to help Turris project or do you have some fix or suggestion for
Turris then this page is for you. There are various ways to help Turris
development and Turris project in general. We look in to various areas here, feel
free to go trough them and see if you can do something more.

The contributing possibilities here are sorted by requirements on user's time and
knowledge. Feel free to go trough them from start.

## Enable data collection
The easiest but very helpful way how you can help Turris project grow is to enable
data-collection services on your router. The core busyness of Turris is to
discover new threats on Internet and that can't be done without data provided by
Turris users. This data feeds not only additional protections for your routers but
also helps discover and put out threats on whole Internet.

Please see [appropriate article for more info](../../basics/collect.md).

## Report and debug problems
One of most helpful ways to contribute is to report and debug problems you
encounter. This means to not just wait if it fixes itself or if Turris team
somehow finds out and fixes it. You can actively look in to problem yourself.
There are people on [forum](https://forum.turris.cz) who can help and you can
report your problems by [support channels](../../basics/support.md).

Note that forum is good place to get help with debugging but is not an issue
tracker. Don't be afraid to fill in issue in any repository on our
[Gitlab](https://gitlab.nic.cz/turris) or with our upstream
[OpenWrt](https://openwrt.org/bugs).

!!! tip
    Read [issue submitting guide](issues.md) before you start creating issues to
    know how to formulate them and where to create them exactly.

## Test new releases early
You can set your router to track HBT branch over default HBS. With HBT you are
going to get next stable release few days or weeks early. If there is some problem
then it can be discovered by you, reported and fixed without affecting all
routers. The advantage is of course that you get new features early.

You can get more info on how to change branch in your router and in general how
to test future releases of Turris OS in [following article](../testing.md).

## Help other users on forum
Turris routers are devices that are appealing not only to advanced users but also
to beginners and nobody is saying that advanced users do not need help sometimes
as well. Our forum is a platform where users can ask other users for help and
discuss various subjects regarding Turris routers. It is a nice feeling to help
someone with their problem, try it.

You can find our forum on [forum.turris.cz](https://forum.turris.cz).

!!! caution
    Remember to be nice to others on forum. Please read common
    [guidelines](https://forum.turris.cz/faq).

## Write or improve article on wiki
There is a community wiki available to all Turris users to share ideas and tips.
You can find it on [wiki.turris.cz](https://wiki.turris.cz/doc/en/start).

Please read [instructions for
authors](https://wiki.turris.cz/doc/en/public/instructions) before you start
writing and modifying articles.

!!! tip
    Remember that wiki is open to anyone. If you see some error in wiki page then
    feel free to fix it. You just have to register and that is it. You don't have
    to write new articles to help others trough wiki.

## Translate web interface
Turris base language is English and most of the Turris tools are not localized.
The only exception is Foris/reForis web interface and [LuCI](../../basics/luci/luci.md).

You can help by translating strings from English to your native language (or any
language you know). We use [Weblate](https://weblate.org/) for that purpose.

__Foris__ (old) and __reForis__ (new) web interfaces can be translated in Weblate project
[Turris](https://hosted.weblate.org/projects/turris/).

__LuCI__ web interface can be translated in Weblate project
[OpenWrt](https://hosted.weblate.org/projects/openwrt/).

Please read [how to participate in translation](translation.md) before you start translating.

## Submit code
Turris declaration that _We believe in open-source_ is not just empty statement,
we really believe in open-source. You can modify code and submit it back. This is
power of open-source. Together we can make Turris the best device there is.

Please read [guide on how to submit pull request](pull_request.md) and
[Turris project coding style](style.md).

!!! tip
    Don't forget that Turris OS is based on OpenWrt. You can as well contribute to
    OpenWrt to help Turris, see below.

## Contributing to OpenWrt

Turris OS is based on OpenWrt. Many packages available in Turris OS are
directly acquired from the upstream. If you want to help to fix bugs in
OpenWrt packages or add new features please create issues or submit
code to the upstream repository.

### How to recognize OpenWrt packages

#### From source code

All packages built for Turris OS are maintained in the [Turris OS packages](https://gitlab.nic.cz/turris/turris-os-packages)
project on our GitLab. Please use this directions to determine whether
a package is developed by the Turris Team or by the upstream.

1. Locate the package you want inside the repository tree.
2. Look into the `Makefile`.
3. Find `PKG_MAINTAINER` there and read its value.

If this value is `CZ.NIC <packaging@turris.cz>` then this package is
maitained by the Turris Team. Otherwise it is usually managed by
the upstream.

!!! notice
    There are some packages which are maintained by the same organization
    as Turris OS (CZ.NIC) but not by the Turris Team, e.g. `knot-resolver`.
    These packages may have slightly different processes than those in
    Turris OS but the most approaches are identical or very similar.

#### From installed packages

If you are not familiar with source code you can acquire the maintainer
from installed packages.

1. Log into your device via SSH.
2. Run `cat /usr/lib/opkg/info/[package name here].control | grep Maintainer`

If you can see any e-mail address ending with `@nic.cz`, the given package
is maintained by the Turris Team or possibly by some other team in our
organization (see above). Otherwise it is managed by the upstream.

### How to contribute to OpenWrt

OpenWrt uses [GitHub](https://github.com/openwrt/) for its code repository,
issues and other things. First you can read [how to help/contribute](https://openwrt.org/faq/how_can_i_help_or_contribute),
[report bugs](https://openwrt.org/bugs) a [submit patches](https://openwrt.org/submitting-patches).
