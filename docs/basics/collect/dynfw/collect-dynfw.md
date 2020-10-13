# Dynamic Firewall

The dynamic firewall (A.K.A. DynFW) is Turris IDS and IPS system - the tool for
detecting network attackers and preventing them from attacking your device. It is
a part of Turris [data collection](../collect.md).

The system consists of two counterparts: the server side and the client
application.


## DynFW server

The dynamic firewall server is operated by the Turris team. It collects
information about entities trying to get into your router and is able
to detect the real attackers among them.

The DynFW server assigns each suspicious IP address a score based on type of
attack it committed. Once the score reaches defined
threshold the address is published and announced back to the routers. Only the
routers with installed DynFW client are able to use the dynamic firewall.
The addresses and other information are published publicly
so it is possible to use DynFW client of your choice or even to write
your own. The protocol used for the communication is described
[below](#protocol-overview).


### Greylist

The dynamic list of all attackers is snapshoted and published daily as a CSV file
which we refer as the *greylist*. The greylist is also enhanced with *tags*
describing the reason why particular address appears on the list (e.g. "haas",
"port_scan" or so). You can download the latest greylist snapshot on the
[Sentinel:View](https://view.sentinel.turris.cz/) web.


## DynFW client

The official dynamic firewall client is intended to run on Turris routers.
It automatically subscribes to DynFW server public interface to obtain the most
recent list of attackers and its updates. It could be installed together with
all other data collection components using
[reForis package management tab](../collect.md#how-to-set-up-data-collection).
The more detailed info about the application itself could be found in its code
[repository](https://gitlab.nic.cz/turris/sentinel/dynfw-client).


## Protocol overview

The server publishes several types of messages. Currently, there are two main
types: `dynfw/list` and `dynfw/delta`. As a protocol,
[ZeroMQ](https://zeromq.org/) is used with
[PUB/SUB](http://zguide2.zeromq.org/page:all#Getting-the-Message-Out) pattern
and messages are standard ZeroMQ multipart message. The first frame is the
topic - aka message type - as simple string so PUB/SUB will work.  Second frame
is message itself encoded using [message pack](https://msgpack.org/).


### dynfw/list message

This message contains the whole list of all the attackers. The list is usually
long with only small changes during the time. The message with the full list
is published every few seconds. It should be used only for the first
initialization of the list but *not* for keeping it up to date. To keep the list
up to date, `dynfw/delta` message should be used.


### dynfw/delta message

`dynfw/delta` message is produced exactly at the moment when we decide to put
the address to the list or remove it.


### DynFW example client

We prepared a simplified
[example client](https://gitlab.nic.cz/turris/sentinel/dynfw-example-client)
to demonstrate how the protocol works in more detail.
