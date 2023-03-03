---
board: omnia, mox
competency: advanced
---

# LTE connection setup

!!! warning
    This manual is intended to be used with the modem we provide in retail as
    a part of the LTE kit. In case you use any other modem ePCIe card this
    might not apply.

## Prerequisties

### Support packages and drivers

For the modem to work, we first need to install drivers and utilities.

| Component             | Description                                                                       |
|-----------------------|-----------------------------------------------------------------------------------|
| kmod-usb-net-qmi-wwan | QMI WWAN driver for Qualcomm MSM based 3G and LTE modems.                         |
| libqmi                | Helper library talk to QMI enabled modems. Add qmi-utils for extra utilities.     |
| uqmi                  | Command line tool for controlling mobile broadband modems using the QMI-protocol. |

We can do it simply in CLI (via ssh) using the following commands:

```shell
opkg update
opkg install kmod-usb-net-qmi-wwan libqmi uqmi luci-proto-qmi
```

## UCi setup

First we need to determine if the settings are on place.

```shell
uci show network.LTE
```

Standard settings (common for most configurations)

```shell
network.LTE=interface
network.LTE.pincode='0000'
network.LTE.proto='qmi'
network.LTE.device='/dev/cdc-wdm0'
network.LTE.auth='none'
network.LTE.apn='internet'
network.LTE.pdptype='ipv4'
```

The setting ``network.LTE.apn`` depends on your mobile network operator.

### Footnote

Some mobile operators require additional authentication setup with

- auth type (NONE/PAP/CHAP)
- username
- password
