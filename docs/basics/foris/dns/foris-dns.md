---
board: mox, omnia, 1.x
competency: novice
---
# DNS settings in Foris

{%
  include-markdown "../../reforis/dns/reforis-dns.md"
  start="<!--what-is-dns-start-->"
  end="<!--what-is-dns-end-->"
%}


## DNS in Foris

Turris uses its own DNS resolver with DNSSEC support. It is capable of working independently or it can forward your
DNS queries to your ISP's DNS resolver. Usually, it is better to use the ISP's resolver in
networks where it works properly. If it does not work for some reason, it is necessary to use direct resolving
without forwarding.

### DNS forwarding

DNS forwarding is enabled by default. It means all DNS queries are sent to your ISP's DNS forwarding servers (or other
DNS forwarders if set so – see bellow). This is the very recommended setting and should be left unchanged unless
there is a very good reason to change it.

*What may be such reason? For example, DNSSEC on your ISP's DNS servers is broken and DoT (see bellow) port is blocked.*

![DNS forwarding](forward.png)

### DNS Forwarder

The default setting is that all DNS queries are forwarded to your ISP's DNS servers (see the _WAN_ section). It is
recommended to keep this setting unless there is a reason to do anything else. The other options currently are:

* CZ.NIC (TLS)
* Cloudflare (TLS)
* Google
* Quad9 (TLS)

![DNS forwarder](forwarder.png)

The options containing TLS uses a special technology named [DNS over TLS](https://en.wikipedia.org/wiki/DNS_over_TLS)
(DoT). Regular DNS queries and responses (including the DNSSEC ones) are transfered in plain format and can be
intercepted by anybody who has access to the lines and nodes (including your ISP of course). If you want to keep your
DNS communicaton in secret you can use DoT/TLS instead.

[CZ.NIC](https://www.nic.cz/) is the Czech national domain registry operator (and the creator of your Turris).
[Cloudflare](https://en.wikipedia.org/wiki/Cloudflare) is a world-wide cloud service provider which has its servers
in many countries. Quad9 is a non-profit organization dedicated to secure DNS services and it also has servers in
many countries. You can also use [Google](https://en.wikipedia.org/wiki/Google_Public_DNS)'s notoriosly known
public DNS servers (but currently not with DoT).

*DNS over TLS keeps DNS traffic in secret but is a bit slower than the standard DNS communication.*

!!! notice
    Information about privacy and data processing on CZ.NIC ODVR servers
    [is here](https://www.nic.cz/odvr/). The other servers are listed in
    a [summary table](https://dnsprivacy.org/wiki/display/DP/DNS+Privacy+Public+Resolvers)
    with links to particular privacy policies.

### Disabling DNSSEC

Disabling DNSSEC is highly discouraged. It should be done only temporarily in these cases:

1. Your ISP's DNS servers are broken and you can't use any other forwarding options nor to disable forwarding
  at all (typically your ISP blocks the ports used for DNS and DoT communication with "foreign" servers).
  In such case request your ISP to fix its DNS servers or consider to migrate to another ISP.

2. You experience strange behavior where you browse the web or use other Internet services and you suspect it may
  be caused by broken DNSSEC. If disabling DNSSEC fix these problems it converts to (1). Otherwise you should
  reenable DNSSEC and investigate elsewhere.

![Disable DNSSEC](disable-dnssec.png)

*If you try to check the Disable DNSSEC checkbox you will have to confirm that you would really like to do that.*

![DNSSEC disable warning](dnssec-warn.png)

### DHCP clients in DNS

You can enabled DHCP client names in the local DNS. This is disabled by default. If you enable this you will able to
resolve IP addresses for local host names. It can be useful if computers provide various services to each other
(e.g. file sharing, DLNA media services...).

When a computer requests its IP address via DHCP it sends its host name (this is the name you can see at the _LAN_
page in the _DHCP clients_ list). Remember each computer in your LAN must have an unique name to work properly.
Ambiguous names will lead to unpredictable results.

## Connection test

After you have set the DNS settings you can test the connectivity. Remember to press the _Save_ button before
you start the test. Note that sometimes it takes a while before the connection is fully initialized. So it might be
useful to wait for a while before running this test.

What particular results mean:

* _DNS_ – your router can successfully execute DNS queries and get responses
* _DNSSEC_ – your router can successfully execute DNSSEC queries and get correct (trustfully signed and intact)
  responses

