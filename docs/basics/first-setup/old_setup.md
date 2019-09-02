# First setup on Turris 1.X and Omnia

Both Turris 1.X and Omnia were produced in several batches and the actual
system you are starting from depends on what batch your router is from. Also as
part of updates some old factory images were updated therefor depending on
whether your router was online and updating, you might start from entirely
different version as well.

But regardless of the image you are starting from, the basics are the same.
You need to connect your computer to LAN port on your Turris router (see the
labels on the back of your router). Then start the router and open up a web browser and
navigate to configuration wizard. It can be found by default on
<http://192.168.1.1>. Older firmwares do not support zero-conf, so you have to
use IP address. Once there, you will be asked for password, to configure WAN
interface and whether you want to enable updates.

**Disabling updates is not recommended.** This documentation documents the
latest version of Turris OS. If you have older version, it might be inaccurate.
Apart from that disabling updates poses **security risk** as all the security
and bug fixes wouldn't be installed.

!!! warning
    During update during frist setup your router might reboot itself or it's
    Web UI might become temporarly unavailable. That is part of normal process.
    Do not reboot your router, do not disconnect it from power supply.

Once update finishes, you will be redirected to the new Foris Guide and guided
through the rest of the setup.

!!! tip
    On Turris Omnia, you can download the latest [medkit](https://repo.turris.cz/hbs/medkit/omnia-medkit-latest.tar.gz) and [flash your router
    via USB](../../hw/omnia/rescue_modes.md#re-flash-router) and therefore
    significantly decrease update time.
