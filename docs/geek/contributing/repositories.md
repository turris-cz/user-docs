---
competency: expert
---
# Most important Turris repositories

Turris project consists of more than a hundred repositories, and it is not easy
to orient yourself in all of the utility and extension repositories. It is a
list of repositories you most likely want to look into when you submit issues or
try to locate code to improve.


## Turris OS distribution

These repositories contain scripts to build Turris OS distribution as well as
package recipes and scripts to facilitate automatic updates.

* **Turris Build**: build scripts, patches, and configuration for Turris OS
  distribution. You most likely want to look for it when you want to submit an
  issue about system functionality or to contribute a Turris-specific fix that
  would otherwise be applied on OpenWrt repositories.
  [Primary hosting](https://gitlab.nic.cz/turris/os/build) |
  [GitHub.com](https://github.com/turris-cz/os-build/)
* **Turris Packages**: recipes for Turris-specific packages.  
  [Primary hosting](https://gitlab.nic.cz/turris/os/packages) |
  [GitHub.com](https://github.com/turris-cz/os-packages)
* **Automatic update rules**: these are rules that updating software follows. It
  is where packages installed in the system in various situations are specified.
  [Primary hosting](https://gitlab.nic.cz/turris/os/updater-lists) |
  [GitHub.com](https://github.com/turris-cz/os-updater-lists)
* **Usage survey**: the distribution maintenance requires additional information
  about packages usage, and for that reason, there is a usage survey.  
  [Primary hosting](https://gitlab.nic.cz/turris/sentinel/turris-survey) |
  [GitHub.com](https://github.com/turris-cz/sentinel-turris-survey)

Automatic software updates of Turris OS distribution are provided by a project
called Updater (also known as Updater-ng).

* **Updater**: the tool that maintains packages on the router and performs
  automatic updates.  
  [Primary hosting](https://gitlab.nic.cz/turris/updater/updater) |
  [GitHub.com](https://github.com/turris-cz/updater)
* **Updater Supervisor**: supervisor for unattended runs of Updater.  
  [Primary hosting](https://gitlab.nic.cz/turris/updater/supervisor) |
  [GitHub.com](https://github.com/turris-cz/updater-supervisor)


## reForis

The reForis web interface functionality is split between a backend application
called Foris Controller and a frontend called reForis. They, in turn, are split
into core functionality and extensions that are called Foris Controller modules
for backend and as reForis plugins for frontend. We list here only some of them.
You might use the search functionality on either of the hosting servers to
locate all modules and plugins.

* **Core**: the basic functionality of reForis and Foris Controller as well as
  network configuration.
  Frontend:
  [primary hosting](https://gitlab.nic.cz/turris/reforis/reforis) |
  [GitHub.com](https://github.com/turris-cz/reforis)
  Backend:
  [primary hosting](https://gitlab.nic.cz/turris/foris-controller/foris-controller) |
  [GitHub.com](https://github.com/turris-cz/foris-controller)
* **Storage**: secondary storage, NAS, and similar functionality.
  Frontend:
  [primary hosting](https://gitlab.nic.cz/turris/reforis/reforis-storage-plugin) |
  [GitHub.com](https://github.com/turris-cz/reforis-storage)
  Backend:
  [primary hosting](https://gitlab.nic.cz/turris/foris-controller/foris-controller-storage-module) |
  [GitHub.com](https://github.com/turris-cz/foris-controller-storage-module)
* **OpenVPN**: virtual private network functionality.
  Frontend:
  [primary hosting](https://gitlab.nic.cz/turris/reforis/reforis-openvpn-plugin) |
  [GitHub.com](https://github.com/turris-cz/reforis-openvpn)
  Backend for VPN server:
  [Primary hosting](https://gitlab.nic.cz/turris/foris-controller/foris-controller-openvpn-module) |
  [GitHub.com](https://github.com/turris-cz/foris-controller-openvpn-module)
  Backend for VPN client:
  [Primary hosting](https://gitlab.nic.cz/turris/foris-controller/foris-controller-openvpn_client-module) |
  [GitHub.com](https://github.com/turris-cz/foris-controller-openvpn_client-module)


## Threat detection and attack prevention

Threat detection and attack prevention system has two sides. The software is
installed on the end user’s devices and the server components.

The end user’s software is what runs on any device that wants to participate in
the Turris threat detection program.

* **Client for Dynamic Firewall**: software that subscribes on updates from the
  threat detection system and adds IP addresses to a firewall block list. 
  [Primary hosting](https://gitlab.nic.cz/turris/sentinel/dynfw-client) |
  [GitHub.com](https://github.com/turris-cz/sentinel-dynfw-client)
* **Minipots**: minimal honeypots for a limited number of protocols used to trap
  and identify attackers.  
  [Primary hosting](https://gitlab.nic.cz/turris/sentinel/minipot) |
  [GitHub.com](https://github.com/turris-cz/sentinel-minipot)
* **Firewall logs**: the collector of blocked/dropped connections on the firewall.  
  [Primary hosting](https://gitlab.nic.cz/turris/sentinel/fwlogs) |
  [GitHub.com](https://github.com/turris-cz/sentinel-fwlogs)
* **Sentinel Proxy**: the proxy server that forwards locally detected threats by one
  of the detection tools to a common threat detection server.  
  [Primary hosting](https://gitlab.nic.cz/turris/sentinel/proxy) |
  [GitHub.com](https://github.com/turris-cz/sentinel-proxy)
* **Certificate generator**: Sentinel Proxy has to be authenticated to the threat
  detection server using temporally certificate. This software implements a way
  to obtain such certificate.  
  [Primary hosting](https://gitlab.nic.cz/turris/sentinel/certgen) |
  [GitHub.com](https://github.com/turris-cz/sentinel-certgen)

The server components are, in general, not of much use to an end-user, but they are
open source and thus available for review and contributions. They are split into
pipelines, and the full interconnection is assigned by a system administrator.
There is also a web interface for data visualization you might be interested in.

* **SView**: the data visualization web application.  
  [Primary hosting](https://gitlab.nic.cz/turris/sentinel/sview) |
  [GitHub.com](https://github.com/turris-cz/sentinel-sview)
* **Base for pipeline boxes**: this is a library with a general code for the
  boxes in the server pipeline.  
  [Primary hosting](https://gitlab.nic.cz/turris/sentinel/sn) |
  [GitHub.com](https://github.com/turris-cz/sentinel-sn )
* **Server component for certificate generator**: the server-side for
  certificate generator.  
  [Primary hosting](https://gitlab.nic.cz/turris/sentinel/ca) |
  [GitHub.com](https://github.com/turris-cz/sentinel-ca)
