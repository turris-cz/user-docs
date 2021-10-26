---
board: omnia,mox
competency: advanced
---
# DNS resolver

OpenWrt uses [dnsmasq](https://en.wikipedia.org/wiki/Dnsmasq) as its
[DHCP server](https://en.wikipedia.org/wiki/Dynamic_Host_Configuration_Protocol)
as well as its [DNS resolver](https://en.wikipedia.org/wiki/Domain_Name_System).
Turris OS, which is based on OpenWrt, uses another setup though: dnsmasq for
DHCP and Knot Resolver for DNS.

!!! info
    [Knot Resolver](https://www.knot-resolver.cz/) is a modern resolver
    implementation designed for scalability, resiliency, and flexibility.
    Its design is different from other resolvers: The core architecture is tiny
    and efficient, and most of the rich features are implemented as optional
    modules, which limits attack surface and improves performance. Knot Resolver
    is being developed by [CZ.NIC](https://www.nic.cz/), where Turris devices
    are also being developed. It is distributed under the GNU General Public
    License version 3 or later.

It means that the DNS-related part of dnsmasq is disabled and its configuration
options don't work. DNS has to be configured in Knot Resolver. The essential
parameters can be configured in reForis but there are many other options
available in the command line.

!!! important
    Knot Resolver is used only on Turris Omnia and Turris MOX (and on Turris
    Shield but it is not configurable there). Turris 1.x use
    [Unbound](https://en.wikipedia.org/wiki/Unbound_(DNS_server)) instead.

## Knot Resolver configuration files

Knot Resolver itself is configured by `/tmp/kresd.config`. But this file is
auto-generated and must not be edited directly (eventual changes may be
overwritten later and will be lost on the next reboot). You can configure
Knot Resolver via `uci` or by editing `/etc/config/resolver`.

!!! info
    Knot Resolver may be abbreviated as `kresd` which is also the name
    of the executable file.

## How to configure Knot Resolver

All relevant configuration parameters are in the `resolver` configuration.
There are two `uci` sections that affect Knot Resolver: `common` and `kresd`.
The first one is common for all supported resolvers whereas the latter
is kresd-specific.

### `common` configuration options

| Name                              | Default value    | Description |
|-----------------------------------|------------------|-------------|
| resolver.common.interface         | '0.0.0.0' '::0'  | Network interfaces to listen on (one or more space-separated values) |
| resolver.common.port              | '53'             | Network port to listen on |
| resolver.common.keyfile           | '/etc/root.keys' | File with DNSSEC root keys ([trust anchors](https://knot-resolver.readthedocs.io/en/stable/config-dnssec.html#trust_anchors.add_file)) |
| resolver.common.verbose           | '0'              | Verbose logging for values greater than zero |
| resolver.common.edns_buffer_size  | '1232'           | [EDNS buffer size](https://knot-resolver.readthedocs.io/en/stable/daemon-bindings-net_dns_tweaks.html) |
| resolver.common.msg_cache_size    | '20M'            | [Message cache maxium size](https://knot-resolver.readthedocs.io/en/stable/daemon-bindings-cache.html#cache.open) |
| resolver.common.net_ipv6          | '1'              | Use IPv6 for upstream resolver(s) |
| resolver.common.net_ipv4          | '1'              | Use IPv4 for upstream resolver(s) |
| resolver.common.forward_upstream  | '1'              | Forward queries to upstream resolver(s) |
| resolver.common.prefered_resolver | 'kresd'          | Preferred DNS resolver |
| resolver.common.ignore_root_key   | '0'              | Ignore DNSSEC root keys |
| resolver.common.prefetch          | 'yes'            | Keep cache hot by [prefetching record](https://knot-resolver.readthedocs.io/en/stable/modules-predict.html) |
| resolver.common.static_domains    | '1'              | Use domains from local `/etc/hosts` |

Regardless of `resolver.common.port`, kresd always listens also on the 853 port
with TLS.

### `kresd` configuration options

| Name                      | Default value | Description |
|---------------------------|---------------|-------------|
| resolver.kresd.rundir     | '/tmp/kresd'  | Directory for transient files |
| resolver.kresd.log_stderr | '1'           | Log standard error output of `kresd` |
| resolver.kresd.log_stdout | '1'           | Log standard output of `kresd` |
| resolver.kresd.keep_cache | '1'           | Keep cache over restarts |

!!! warning
    Parameters set in LuCI (_DHCP and DNS_) are ignored by kresd. They are
    intended only for dnsmasq.

After you have changed any of the configuration parameters, you need to reload
kresd by executing `/etc/init.d/kresd reload`.
