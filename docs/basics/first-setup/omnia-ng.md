---
board: omnia-ng
---

# First setup on Omnia NG

Omnia NG has multiple ports. Four Ethernet ports (TH0-ETH3) and two SFP ports
(SFP0-SFP1). In factory default settings, you can connect your internet uplink
to either ETH0 or SFP0.

{! include-markdown './no-password.md' !}

{! include-markdown './cables.md' !}

Then start the router and connect your computer to the LAN network of the
router. You can connect your computer to SFP1 or one of the ethernet ports:
ETH1, ETH2 or ETH3. You can also connect via Wi-Fi. During the first boot,
a random Wi-Fi password is generated and displayed as a QR code on the display. By
scrolling to the left, you can display the SSID and password.

Once connected to the network, open up a web browser and navigate to
the configuration wizard. It can be found by default on <http://192.168.1.1>.
Alternatively, if your device supports zero-conf, you might be able to use
<http://turris.local>. Once you enter the first setup wizard, you will be
guided through the initial setup.

You can follow this tutorial on the
[reForis first steps](../reforis/guide/index.md) guide.

!!! tip
    [Switch to https](../reforis/https/https.md) as soon as possible to avoid
    local network attacks. This requires a trusted connection and accepting
    a self-signed certificate.

!!! note
    Internet connectivity will be enabled only during the configuration. By
    default, internet connectivity is not enabled to force people to set up the
    router properly.

**Disabling updates is not recommended.** This documentation describes the
latest version of Turris OS. If you have an older version, it might be inaccurate.
Apart from that, disabling updates poses **security risk** as all the security
and bug fixes wouldn't be installed.

!!! warning
    During an update or the first setup, your router might reboot itself or its
    Web UI might become temporarily unavailable. That is a part of the normal process.
    Do not reboot your router, do not disconnect it from the power supply. Once
    the update finishes, you will be redirected back to the updated reForis Guide
    and guided through the rest of the setup.

!!! tip
    You can download the latest
    [medkit](https://repo.turris.cz/hbs/medkit/omnia-ng-medkit-latest.tar.gz) and
    [flash your router via USB](../../hw/omnia-ng/rescue-modes.md#re-flash-router)
    or update your factory image
    [directly from the internet](../../hw/omnia-ng/rescue-modes.md#flash-from-the-internet).
    This will significantly decrease the update time and will get you the latest
    features right a way.

After your router is fully set up, you can start setting up additional services.
For some inspiration, you might want to check some
[highlights](../highlights.md) that we prepared.
