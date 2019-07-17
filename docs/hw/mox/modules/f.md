# MOX F (USB)

## Key features

The F module expands your configuration with more USB 3.0 ports with transfer
speeds of up to 5 Gbps that you can use to connect external drives, TV tuners
and other devices.

If using module F use this module to power the whole set. It‘s possible to
power the whole set from module F without using a power supply connector on
module A. It is also possible to use both connectors at the same time.

Recommended average load for USB ports on module F while using all ports and
using power supply on module F is 800mA maximum per port. This limit should be
more than enough for ordinary usage. If you need a little bit more we recommend
using additional cooling. While using power supply on module A only the limit
is significantly lower, up to unusable. The real limit depends on other
connected modules.

## Specification

![Picture of the board](f.jpg)

* 4x USB 3.0 ports
* DC input 12 V ± 5 % / 5 A
* 1× 64 pin female connector and 1× 64 pin male connector for connection additional modules
* 2 years warranty
* Size: 110 mm × 58 mm × 19 mm (without case)
* Ambient operating temperature: 0 °C to 40 °C (40 °F to 104 °F)
* Humidity: 10% to 90% RH, Non-condensing

## Compatibility

There can be only one MOX F module in the configuration; the PCIe bus is
terminated there. For this reason, MOX F cannot be combined with MOX B.

This module can be used **only as an extension in a set**. You will need at
least [MOX Start](../sets/start.md). If you’re combining it with other
modules, make sure they are compatible. You can verify the order of modules and
pass-through of PCIe and SGMII signals in the configurator on
<https://mox-configurator.turris.cz>.

