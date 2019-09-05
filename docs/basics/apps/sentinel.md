Sentinel
=========================

Sentinel is our [data collection](/basics/collect/why/) system providing dynamic firewall. Router side of
the system consists of data collect subsystem, subsystem for dynamic firewall and
mechanism providing secure channel for data exchange.

### Installation & first run

To use Sentinel on Turris device just install Sentinel package using Updater tab
in Foris web interface. The system then tries to obtain Sentinel client
certificate and starts to collect the [data](/basics/collect/data/). New firewall rules
will be downloaded (and collected data sent to the server) as soon as secure
connection to the Sentinel server is established.
