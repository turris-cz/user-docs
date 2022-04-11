---
board: shield, mox, omnia, 1.x
---
# Turris Sentinel

One of the initial motives that led to the development of the Turris routers was
to set up a secure gateway which would be capable of responding to current
threats in almost real time. Turris Sentinel was developed to accomplish this
task. It is able detect potential threats across the internet and provides
dynamic updates to the router's firewall and therefore significantly decreases
their harmful potential.

Sentinel **[threat detection](threat-detection.md)** subsystem is an essential part
of Sentinel. It consists of wide variety of tools that help to detect potential
attackers - starting from simple firewall monitoring (firewall logs, fwlogs),
minimal honeypots (minipots) to full-fledged secure shell (SSH) honeypots
running at our headquarters (HaaS).

Based on the reports acquired by the threat detection subsystem, Sentinel is able
to assemble a list of potential attackers recognized by their IP addresses. This
list, commonly referred as to *Sentinel greylist*, is also available through
another important part of Sentinel - the
**[dynamic firewall](dynfw.md)** (dynfw). Sentinel dynamic
firewall is able to instantly deliver the updated firewall rules directly to your
Turris router or other compatible system and keep your infrastructure safe from
the attackers targeting your own router as well as from all the attackers
reported by others.

You can browse the aggregated data we have collected through the Sentinel
network on our web page called [Sentinel View](https://view.sentinel.turris.cz/).
You view detected attackers, the most commonly used passwords, country of
origin and such.
