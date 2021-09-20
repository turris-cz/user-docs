---
board: mox, omnia, 1.x
competency: advanced
---
# How to try future releases of Turris OS?

Do you want to contribute to better stability of Turris OS? Or would you just
like to try the latest and greatest that is not yet released? Do you want to
try even unstable features that developers are still working on? You can do all
of that! This manual will tell you how.

Turris OS is currently released in various branches, which have different
functions and varying stability – you can pick, which branch you want to test.

## Branches available

Following list describes various branches you might want to try and their main
functions. They are ordered from the most stable to the most experimental.

### HBS – _Here Be Snails (Stable)_

Default and most stable branch. Suggested for all users. This contains
official releases and is what everybody is running by default.

### HBT – _Here Be Turtles (Testing)_

Release candidate. This branch contains next Turris OS release just before the
official release. Please join this branch to help us test the next release.
It's mostly considered stable but can contain minor bugs that escaped the
testing.

Suitable to help test the releases, might require some manual intervention from
time to time, but not too often.

### HBK – _Here Be Kittens_

Automatic builds the next fixup (e.g. 5.1.8) release will be based on. Combines the
latest stable OpenWrt and stable Turris features.

Suitable for people interested in testing future fixes and not minding occasional
bugs. As this is an integration branch, it breaks from time to time. But nothing
that experienced user can't recover from.

### HBL – _Here Be Lions_

Automatic builds the next minor (e.g. 5.2.0) release will be based on. Combines the
latest stable OpenWrt and the latest of our features.

Suitable for people interested in testing latest features and not minding
occasional bugs. As this is an integration branch, it breaks from time to time.
But nothing that experienced user can't recover from.

### HBD – _Here Be Dragons_

Automatic builds of next major (e.g. 6.0.0) release based on next OpenWrt release.
Mainly considered as a preview to test for integration problems.

Suitable for distribution developers or people in desperate need of new
OpenWrt. Generallly considered dangerous and can seriously break or stop being
built for some time without any warning.

More information about development workflow can be found in the
[turris-build repository](https://gitlab.nic.cz/turris/os/build/blob/hbk/WORKFLOW.adoc).

## How to switch to various branches

Connect to your router as root through `ssh` and enter the following command:

```
switch-branch hbt
```

After having entered this command, you have switched permanently to the
_"turtles"_ branch and an automatic update will start and let you test the next
release before it is actually released publicly. If you want to switch to a
different branch, just replace the `hbt` argument with the name of the branch
of your choice.

### Switching back


Switching from less stable branches to more stable branches (from HBD to HBL, HBL to HBK, etc.)
is possible but it is not a supported scenario. Because of that, we don't recommend it.
You can brick your router.

It is recommended to use a snapshot and rollback to the last stable version.
(see [schnapps](./schnapps/schnapps.md))


