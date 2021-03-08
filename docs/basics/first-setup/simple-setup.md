---
board: omnia, 1.x
---
# First setup on Turris 1.X and Omnia

Both Turris 1.X and Omnia were produced in several batches and the actual
system you are starting from depends on which batch your router is from. Also as
part of updates some old factory images were updated therefor depending on
whether your router was online and updating, you might start from entirely
different version as well.

But regardless of the image you are starting from, the basics are the same.
You need to connect your computer to LAN port on your Turris router (see the
labels on the back of your router).

!!! caution
    You may also use your LAN to interconnect the computer and the router.
    But ensure that there is no (other) DHCP server in the LAN as it would
    interfere with the one in your router. There is no password during
    initial setup. To eliminate potential security risks, setup your router
    first, go through the update procedure and connect other untrusted devices
    only afterwards.

Then start the router and open up a web browser and navigate to configuration
wizard. It can be found by default on <http://192.168.1.1>. Older firmware do
not support zero-conf, so you have to use IP address. Newer ones starting
Turris OS 4.0 do, so you might be able to use <http://turris.local>. Once you
enter the first setup wizard, you will be asked for a password, to configure
WAN interface and whether you want to enable updates.

**Disabling updates is not recommended.** This documentation describes the
latest version of Turris OS. If you have older version, it might be inaccurate.
Apart from that disabling updates poses **security risk** as all the security
and bug fixes wouldn't be installed.

!!! warning
    During an update or the first setup your router might reboot itself or it's
    Web UI might become temporarly unavailable. That is part of normal process.
    Do not reboot your router, do not disconnect it from power supply.

Once update finishes, you will be redirected to the new Foris Guide and guided
through the rest of the setup.

!!! tip
    On Turris Omnia, you can download the latest [medkit](https://repo.turris.cz/hbs/medkit/omnia-medkit-latest.tar.gz) and [flash your router
    via USB](../../hw/omnia/rescue-modes.md#re-flash-router) and therefore
    significantly decrease update time.

After your router is fully set up you can start setting up additional services.
For some inspiration, you might want to check some
[highlights](../highlights.md) that we prepared.
