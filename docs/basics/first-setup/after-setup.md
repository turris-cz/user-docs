---
competency: novice
board: omnia, mox, 1.x, shield
---
# First steps after setup

There are some settings that should be considered just after finishing
the first setup guide.

## E-mail notifications

Various events in Turris devices can be notified not only in the web
interface but also by e-mail. We recommend configuring e-mail notifications
at least for "Reboot or attention is required". See the
[Notifications](../../basics/reforis/notifications/reforis-notifications.md)
page for more information.

## Automatic restarts

!!! important
    This section doesn't apply to Turris Shield. Restarts after updates are
    managed automatically.

After some updates, it's necessary to restart your device to apply the changes.
We recommend restarting as soon as possible for maximum security but you can
configure this feature to fit your needs.

Automatic restart can't be disabled but you can change the delay (which is
3 days by default) and the time of day (03:30 by default). See the
[Updates](../../basics/reforis/updates/reforis-updates.md)
page for more information.

## Turris Sentinel

!!! important
    On Turris Shield, Turris Sentinel is enabled by default. You can disable
    the thread detection part if you don't accept the Terms of Participation.
    But the dynamic firewall is always enabled.

Turris Sentinel is an important part of the Turris devices' security.
We strongly encourage you to use it. See the
[relevant pages](../sentinel/intro.md) of our documentation. You can learn
what Sentinel provides, how it works and how to set up it.
