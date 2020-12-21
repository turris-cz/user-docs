---
board: omnia
---
# Turris Omnia

Turris Omnia is powerful SOHO router. It is based on **Marvel Armada 385 CPU** -
dual-core armv7 running at **1.6 GHz**. Current version has **two gigs of RAM**.
It uses as main storage **8 GB eMMC**. For **5GHz AC WiFi** connectivity, it
contains Compex WLE900VX card based on Qualcomm Atheros QCA988x chipset
(ath10k). To provide access to older devices capable only of **2,4 GHz** it is
also equipped with Compex WLE200N2 card based on Qualcomm Atheros AR9287
(ath9k). Both cards are placed in miniPCIe slots to be easily replaceable.

During the course of history it was possible to buy Turris Omnia with just one
gig of RAM and also without WiFi.

![Turris Omnia main board](omnia-board.jpg)

## Network interfaces

Turris Omnia has three physical Ethernet ports. One of them (_eth2_) is
dedicated as WAN and connected directly to WAN port. That can be either metallic
or SFP. If you plug in SFP module, the metallic port will get disconnected. If
you unplug the module, metallic port will be functional again. In Turris OS 3.X
this can be done at runtime, on newer version changing the configuration
requires reboot.

!!! warning
    In Turris OS 3.X the names of the _eth1_ and _eth2_ interfaces were
    reversed. So in Turris OS 3.X, _eth1_ was the one connected to WAN. We had
    to rename them in Turris OS 4 due to fixes in vanilla kernel.

The remaining two ports are connected to a fully manageable switch as shown on
the picture below.

![Turris Omnia network interfaces](omnia-net.jpg)

## GPIO and friends

Turris Omnia sold currently in retail and all Omnias sold via Indiegogo
campaign contain extension header providing various embedded buses. There was a
brief period of time, when connectors for those were not equipped. If you bought
Omnia without the header, extending it is much more complex task than just
adding the header.

![Turris Omnia pins](omnia-pinout.png)

## Various documentation files

* [Declaration of Conformity](Omnia-DoC.pdf)
* [Official datasheet for Turris Omnia 2020](omnia2020-datasheet.pdf)
* [Official datasheet for Turris Omnia 2019](omnia2019eu-datasheet.pdf)
* [Original printed manual](omnia-manual-en.pdf)
* [Schematics for Turris Omnia CZ11NIC23](CZ11NIC23-schematics.pdf)
* [Schematics for Turris Omnia CZ11NIC20](CZ11NIC20-schematics.pdf)
* [Schematics for Turris Omnia CZ11NIC13](CZ11NIC13-schematics.pdf)
