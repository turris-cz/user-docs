---
board: mox
---
# MOX D (SFP)

## Key features

The MOX D module contains an SFP connector for an optical connection with
speeds of up to 2.5 Gbps.

## Specification

![Picture of the board](d.jpg)

* 1× WAN port up to 2,5 Gbps SFP
* 1× 64 pin female connector and 1× 64 pin male connector for connection additional modules
* 2 years warranty
* Size: 105 mm × 58 mm × 30 mm (without case)
* Ambient operating temperature: 0 °C to 40 °C (40 °F to 104 °F)
* Humidity: 10% to 90% RH, Non-condensing

## Compatibility

There can be only one MOX D module in the configuration; the SGMII bus is
terminated there. For this reason, the MOX D cannot be combined with MOX C.

This module can be used **only as an extension in a set**. You will need at
least [MOX Start](../sets/start.md). If you’re combining it with other
modules, make sure they are compatible. You can verify the order of modules and
pass-through of PCIe and SGMII signals in the configurator on
<https://mox-configurator.turris.cz>.
