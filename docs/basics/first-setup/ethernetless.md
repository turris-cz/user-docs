---
board: mox, omnia
competency: intermediate
---
# First setup of Turris Omnia and Mox without Ethernet LAN

These days it is common that laptops do not have Ethernet sockets and that can
make initiate configuration of Turris routers pretty complicated. An alternative
initial configuration was added in Turris OS 5.2.0. It uses a configuration file
on a USB flash drive to set the password for the web configuration interface and
to enable the Wi-Fi.

The configuration file is in the [JSON](https://en.wikipedia.org/wiki/JSON) file
format. You can use the following example as a base for your configuration file.
```
{
	"foris_password": "ForisPassword_ChangeThis!",
	"wireless": {
		"ssid": "TurrisConfigWifi",
		"key": "WiFiPassword_ChangeThis!"
	}
}
```
Make sure that you change all passwords!

Save your configuration file to a file named `medkit-config.json` to the root
directory of the USB drive. The following file systems are supported: _ext4_,
_Btrfs_, _XFS_, and _FAT32_.

With the prepared USB drive you can connect it to the router and perform either
factory reset ([Omnia](../../hw/omnia/rescue-modes.md#rollback-to-factory-reset),
[Mox](../../hw/mox/rescue-modes.md#rollback-to-factory-reset)) or flash via USB
([Omnia](../../hw/omnia/rescue-modes.md#re-flash-router),
[Mox](../../hw/mox/rescue-modes.md#re-flash-router)). Note that flash via USB is
highly suggested as the factory version of Turris OS in your device might not
support this feature. It also removes possibility of exploit of old security
holes.

!!! warning
	The configuration file as described here can be used with __factory reset__
	only if router's [factory
	version](../tos-versions.md#versions-of-turris-os-provided-from-factory) is
	Turris OS 5.2.0 or newer.

The configuration is applied on the first boot of the device (the USB drive with
the configuration file has to be connected at that time). You should eventually be
able to connect to the Wi-Fi network with the name as you set (`ssid`) device you
plan to use for configuration. The Wi-Fi is protected by the password you set
(`key`). With that you are connected to router's LAN network and you can continue
by accessing the web configuration interface as described in your router's
specific first setup guide.

The USB drive can be safely removed when you access router's configuration
interface.

Don't forget to remove the configuration file from the USB drive afterward or
change all auto-configured passwords to prevent password leakage when you reuse
the drive for something else.
