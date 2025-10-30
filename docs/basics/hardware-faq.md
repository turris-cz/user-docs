# Frequently asked questions about hardware in general

## Supported devices

### SFP

All of those, which fulfill the
[SFP standard](https://www.snia.org/technology-communities/sff/specifications),
work on 100Mbps / 1Gbps / 2.5Gbps / SGMII. Some others work, too,
despite not fulfilling the standard, if supported and worked by the Linux
kernel.

We manufacture our own
[Turris SFP+ Copper module (RJ45)](https://www.discomp.cz/turris-sfp-2-5gbps-rj45-modul_d113354.html)
supported under Turris OS.

It is needed to ask the producer for information about the standard fulfillment
or the Linux kernel support. Although they often respond that it works only
on their own devices. On our
[community forum](https://forum.turris.cz),
there are messages from our users who test different SFP modules on Turris
Omnia or MOX. There is a community-maintained list of compatible SFP modules,
which can be found in our [community documentation](https://wiki.turris.cz/doc/en/public/sfp).
Anyone can register there, log in, and then add their own SFP module, which
they tried.

### miniPCIe Wi-Fi cards

You can find many mini PCIe Wi-FI cards, which you can use in Turris routers,
but they need to be supported in OpenWrt and the Linux kernel. We tested the
following mini PCIe Wi-Fi cards, which we support.

- WNC DNXA-H1 (Wi-Fi 4 works at 2.4 GHz or 5 GHz)
- DNXA-97-H (Wi-Fi 4 only 2.4 GHz)
- Compex WLE200N2 (Wi-Fi 4 only 2.4 GHz)
- Compex WLE900VX (Wi-Fi 5 Wave 1)
- AsiaRF AW7615-NP1 (Wi-Fi 5 Wave 2, MU-MIMO)
- AsiaRF AW7915-NP1 4x4 (Wi-Fi 6) since Turris OS 6.0
- AsiaRF AW7915-NPD 2x2 (Wi-Fi 6, DBDC) since Turris OS 6.0
- AsiaRF AW7916-NPD (Wi-Fi 6E, DBDC) requires LTS kernel 5.15

### Cellular network (LTE/5G)

We support LTE components, which we were selling as an LTE pack. We have
a good experience with the LTE model Quectel EP06. The whole pack, including
antennas, heatsink, and so on, can be found on
[Discomp.cz](https://www.discomp.cz/turris-omnia-lte-kit-lte-modem-cables-antenas-heatsink_d113352.html).

The configuration for the LTE connection needs to be done in the advanced
administration LuCI.

We are investigating and testing 5G modems, and if there is anything new,
we will let you know through our social media.

## Replacement parts

There is a possibility that you lost the power supply or somehow there was
managed that the power supply was damaged. We sell replacement parts like
antennas, diplexers, and Wi-Fi cards through our distributors.

The full list of available replacement parts can be found on
[our community forum](https://forum.turris.cz/t/where-to-buy-replacements-power-supply-antennas-etc/15428/).
If you did not find anything, don't forget to reach our
[Technical support department](../basics/support.md)
