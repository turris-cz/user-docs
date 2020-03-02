# LuCI

## What is LuCI?
Since Turris OS is based on OpenWrt, it comes with LuCI configuration web interface. LuCI is a powerful and exhaustive
configuration interface. It can be considered to be a step forward from setting up a router via configuration
files through the command line to doing it via a web interface. Thus, it attempts to cover all configuration
possibilities which can be enabled using config files.

LuCI uses UCI which is meant to centralize the configuration of OpenWrt.

## What is UCI?
From [UCI docs](https://openwrt.org/docs/guide-user/base-system/uci):
> The abbreviation UCI stands for Unified Configuration Interface and is a system to centralize the configuration of
OpenWrt services.

## How is it different from Foris?
Turris team has decided to develop its own web administration interface due to complexity of the existing LuCI interface
for basic users. Thus, came into being Foris, which is a simplified interface for administration
requirements of Turris routers. It has been created in order to provide users with a simple and extensible administration
and network configuration tool.

Although, there is a set of advanced administration requirements which are only possible to get done with LuCI. Such as
[static IP addresses assignment](static_dhcp/static_dhcp.md).
