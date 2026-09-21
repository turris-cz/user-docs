---
board: mox, omnia, 1.x, shield
competency: novice
---

# Diagnostics

The _Administration → Diagnostics_ reForis page is intended to get the system
logs and many other important diagnostics objects that can help us to
investigate and resolve your problems.

!!! important
    If you come across any error and it is possible not to reboot the router,
    please **don’t reboot it** before collecting the diagnostics (or system
    logs). All this data is saved in the router memory, and it will be erased
    if you reboot.

If you just rebooted the router, let it gather some data first. Diagnostics
from a freshly rebooted router, which have been downloaded before
the occurrence of the error, usually don’t help us to identify the cause of
the error.

## How to get information

Various modules can be included in the generated diagnostics report.
The modules, which are usually the most interesting, are `disk-full`,
`messages`, `dns`, `installed`, and `network`. If the nature of the problem
suggests that other modules could also be useful, you can check them.

![Selection of modules](modules.png)

Then press the _Generate report_ button. The process may take some time.
When done, you can press _Download_ to download the report. Multiple reports
may be available, but they don’t persist over reboots.

![Available reports](reports.png)

!!! warning
    The diagnostics data may contain sensitive information. Don't allow it
    to be publicly available, e.g. on the forum or in GitLab issues.
    Use it only for communication to our support or for your internal
    purposes.

### If you can’t find the diagnostics

In that case, your router is, for some reason, stuck in some old version
of the Turris OS. That is the first problem to solve: make sure you have
updates enabled and your internet connection is working.

!!! tip
    For more information about getting support from us, please visit
    the [Troubleshooting → Support](../../support.md) documentation page.
