# OpenVPN client on Turris

Starting with [Turris OS 5.1](../../tos-versions.md),
you can configure the OpenVPN client through the reForis web interface.

## What is OpenVPN?

See [OpenVPN server](../openvpn-server/openvpn.md) for information
how it works.

The OpenVPN client implementation in Turris OS uses
[NAT](https://en.wikipedia.org/wiki/Network_address_translation)
between OpenVPN networks and the LAN. Servers can push routing rules
including the default gateway. If the default gateway route is pushed
then all traffic between the LAN and other networks is routed through
the OpenVPN connection.

## Which OpenVPN features are supported?

* [TUN interface](https://en.wikipedia.org/wiki/TUN/TAP)
* Key/certificate
  ([PKI](https://en.wikipedia.org/wiki/Public_key_infrastructure))
  based authentication
* Non-interactive configuration (no password for a private key)
* Configuration in a single file (an embedded certificate); see bellow how to
  prepare it

## Which third-party OpenVPN servers are supported?

This OpenVPN client is tailored for the OpenVPN client running on Turris
routers to interconnect multiple devices (e.g. to connect company affiliates
to their headquarters). It is possible to use it to connect to other
OpenVPN servers too but we cannot guarrantee that it will work.

There are many third-party OpenVPN servers available. Some of them can be used
for free (usually with some limitations, e.g. limited bandwidth) and some are
paid.

!!! warning
    Use only OpenVPN providers which you fully trust! Each such provider
    has full access to the communication you pass over it and can
    monitor which web servers you visit etc.

## How to set up OpenVPN client in reForis?

1. Go to the _OpenVPN -> Client Settings_ page.
2. Choose a client settings file and press _Upload settings_.

!!!info
    If you want to connect to your another Turris you can use the _Client
    registration_ page on that device to create and dowload the appropriate
    settings file. See [OpenVPN server](../openvpn-server/openvpn.md) how to do it.

## How to create a single configuration file?

1. Obtain your private key and certificate and the certificate of the
   certification authority which is used by the given OpenVPN server
   (signs its certificates).
2. Convert each of them to the Base64-encoded ASCII format
   ([PEM](https://en.wikipedia.org/wiki/Privacy-Enhanced_Mail)) if they have
   other formats (such as
   [DER](https://en.wikipedia.org/wiki/X.690#DER_encoding)).
3. Embed all of them into the OpenVPN client configuration file. It should
   look like:

```
... some OpenVPN configuration parameters ...

<ca>
... Certification authority certificate ...
</ca>

<cert>
... Client certificate ...
</cert>

<key>
... Client private key ...
</key>
```
