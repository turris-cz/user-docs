---
board: omnia-ng
---

# Frequently asked questions about Turris Omnia NG

## Hardware

### Why 90W power source, is Omnia NG power hungry?

Turris Omnia NG comes with a 90W power source. But the real power consumption is
typically much less. With all three Wi-Fis enabled, it is typically around 10W.
But we ship our devices with a power source strong enough to handle all
possible loads. And Omnia NG can be extended with quite some power-hungry
peripherals. Think about two 10Gbit Ethernet SFP modules, a 5G modem or NVMe. Not to
mention all the possible devices that you can connect to the USB ports. We
choose to ship the power supply strong enough to handle all those cases and
still have some breathing space.

### Why only 8GB eMMC? I need more storage!

Omnia NG comes with an 8GB irreplaceable eMMC. It is and will be for the foreseeable
future enough for Turris OS and should be good enough for most of our users. If
you need more space or faster storage, you can easily place an NVMe drive in one
of the M.2 slots. Omnia NG can even boot directly from it.

## Why only 2GB of RAM?

Although we would like to have more breathing space as well, 2GB are the best
we could reasonably do. Our platform of choice uses a 32-bit memory
controller and is thus very limited in this regard. Unfortunately, at the time
of design, there was no other SoC available that would offer comparable network
performance, support more RAM and still would fall into the same price-point
ballpark. And from the routing perspective, it is more than enough.

### My display is broken, it keeps turning off

There is a screen saver mode enabled by default on the display. The display has a
limited lifetime. It is more than the warranty period, so we could keep it on
all the time. But we expect our devices to last much longer than our
warranty period. So we choose to turn it off when you are not using it. You
can wake it up with a press of a button.

## I'm missing two screws on each side of my Omnia NG

There are two spare holes on the sides of every Turris Omnia NG case. Those are
there intentionally. Those are meant to be used for a rack mount kit, which is
going to be sold separately.

## LEDs are too bright, how do I tune them down?

In the default setup, you can decrease the brightness of the LEDs by pressing the
button on the back of your Turris Omnia NG. Not the reset button, the other
one.

{! include-markdown './see-also-faq.md' !}
