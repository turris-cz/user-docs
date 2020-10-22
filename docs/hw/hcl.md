# Hardware compatibility list

Turris routers are universal, powered by Linux kernel and running open
source Linux distribution (OpenWrt). Having USB port and in some cases mPCIe port brings
multitude of possible hardware to connect to your Turris router.

Often it works out of the box, sometimes you need to install additional drivers
or software and configure it to make sure that it works. But there are also
some devices that require special hack to make them work or even devices that
have no open-source drivers at all.

It is impossible for Turris team to ensure compatibility with every piece of
hardware available on the market. But what we can do is provide a place where
our users can exchange their experience. That is the goal of hardware
compatibility list.

You can find our [hardware compatibility list](https://wiki.turris.cz/doc/en/hcl)
in our wiki. For easier navigation it is divided into several subcategories:

* [LTE modems (both internal and external)](https://wiki.turris.cz/doc/en/hcl/lte)
* [WiFi cards](https://wiki.turris.cz/doc/en/hcl/wifi)
* [DVB tunners](https://wiki.turris.cz/doc/en/hcl/dvb)
* [USB devices](https://wiki.turris.cz/doc/en/hcl/usb)
* [mini PCIe devices](https://wiki.turris.cz/doc/en/hcl/usb)
* [Other devices](https://wiki.turris.cz/doc/en/hcl/other)

When contributing, always use the most specific category. For example for USB
LTE modem, use _LTE modems_ category and not _USB devices_ or _Other devices_.
And always try to use predefined template to make it easier for others to
compare various accessories and not to forget anything important.
