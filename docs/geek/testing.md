# How to try future releases of Turris OS?
 
Do you want to contribute to better stability of Turris OS? Or would you just
like to try the latest and greatest that is not yet released? Do you want to
try even unstable features that developers are still working on? You can do all
of that! This manual will tell you how. 

Turris OS is currently released in various branches, which have different
functions and varying stability - you can pick, which branch you want to test.

## Branches available

Following list describes various branches you might want to try and their main
functions. They are ordered from the most stable to the most experimental.

### HBS -  _Here Be Snails_

Default and most stable branch. Suggested for all users. This contains
official releases and is what everybody is running by default.

### HBT - _Here Be Turtles_

Release candidate. This branch contains next Turris OS release just before the
official release. Please join this branch to help us test the next release.
It's mostly considered stable but can contain minor bugs that escaped the
testing.

Suitable to help test the releases, might require some manual intervention from
time to time, but not too often.

### HBK - _Here Be Kittens_

Automatic builds the next fixup (1.0.X) release will be based on. Combines the
latest stable OpenWRT and stable Turris features.

Suitable for people interested in testing future fixes and not minding occasional
bugs. As this is an integration branch, it breaks from time to time. But nothing
that experienced user can't recover from.

### HBL - _Here Be Lions_

Automatic builds the next minor (1.X.0) release will be based on. Combines the
latest stable OpenWRT and the latest of our features.

Suitable for people interested in testing latest features and not minding
occasional bugs. As this is an integration branch, it breaks from time to time.
But nothing that experienced user can't recover from.

### HBD - _Here Be Dragons_

Automatic builds of next major (X.0.0) release based on next OpenWRT release.
Mainly considered as a preview to test for integration problems.

Suitable for distribution developers or people in desperate need of new
OpenWRT. Generallly considered dangerous and can seriously break or stop being
built for some time without any warning.

More information about development workflow can be found in the
[turris-build repository](https://gitlab.labs.nic.cz/turris/turris-build/blob/master/WORKFLOW.asciidoc).

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
 
If you are done with your testing and want to make sure that you are back at
the stable branch, all you need to do is to switch to it the same way you
switched to the more experimental branch.

```
switch-branch hbs
```

