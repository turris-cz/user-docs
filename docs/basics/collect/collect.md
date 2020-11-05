---
board: shield, mox, omnia, 1.x
---
# Data Collection

One of the initial motives that led to the development of the Turris router was
to set up a secure home router that is capable of responding to current threats
in almost real time. However a large amount of data is needed to identify an
attacker and distinguish it from the usual traffic.

The data collection system [Sentinel](../apps/sentinel.md) is a key source of
such data. We use this data to build
and distribute a [dynamic firewall](dynfw/collect-dynfw.md) which afterwards
helps keep your router secure.
As a result, enabling data collection helps to protect your own router (and home)
as well as to protect the rest of the world.

## What data do we collect?

There are multiple sources of data we collect. Depending on the source used, the
type of data varies. On you router you can notably enable *Firewall monitoring*,
deploy *Minipots* or use *HaaS*.

### Firewall monitoring

Firewall data is one of the key data sources for [Sentinel](../apps/sentinel.md).
Using firewall data we can determine which attackers tries to exploit potential
vulnerabilities on a particular port. We collect attacker's IP address and local
port number.

### Minipot

The word "Minipot" is a combination of the words "mini" and "Honeypot".
Honeypot, also called a fake server, is a way to imitate some kind of service,
usually attractive to a potential attacker.

Turris Minipot is a lightweight Honeypot which emulates only minimal subset of
each protocol, answering an "incorrect password" to each log in attempt. We
currently operate [Telnet](https://en.wikipedia.org/wiki/Telnet),
[HTTP](https://en.wikipedia.org/wiki/Hypertext_Transfer_Protocol),
[FTP](https://en.wikipedia.org/wiki/File_Transfer_Protocol) and
[SMTP](https://en.wikipedia.org/wiki/Simple_Mail_Transfer_Protocol)
Minipots. The entered user/password combination along with the attacker's IP
address is collected by the software.

### HaaS - Honeypot as a Service

By using HaaS and installing the HaaS proxy application your router becomes able
to forward traffic incoming from WAN port 22 (commonly used for SSH) to the HaaS
server located in our headquarters. The HaaS server, powered by Cowrie, is a
full-fledged honeypot. As well, it is able to record the user/password combination
(like Minipots do) and in addition it is able to simulate a real device and
record the executed commands.

A big advantage is that your router stays safe all the time because all
communications are redirected to our server and nothing is done on the router
itself.

### Turris survey

Since our team has only limited manpower we try to primarily focus
on subjects that really matter. The Turris survey collects information about
installed packages, used languages and operating system version. Based on this
we are able to identify widely used packages, features and provide special
support.

## What do we use the data for?

The data collected from	routers are used for various security analyses
carried out by Turris team or by
[The National CSIRT of the Czech Republic](https://csirt.cz/en/).

One of the most important analyses is the
[dynamic firewall](dynfw/collect-dynfw.md). The dynamic firewall
collects information about entities trying to scan or break into your router and
is able to detect the real attackers among them. IP addresses of identified
attackers are then immediately published and reported back to the routers.
Once a day the list of all attackers (A.K.A. greylist) is snapshoted and
published as a CSV file. You can download the latest greylist snapshot
[here](https://view.sentinel.turris.cz/greylist-data/).

## Can I see the data?

You can browse the aggregated data we have collected through the Sentinel
network on our web page called [Sentinel View](https://view.sentinel.turris.cz/).
You can browse there detected attackers, the most commonly used passwords,
country of origin and such.

![Sentinel View](sview.png)

The HaaS attackers who tried to attack your own router and their commands
could be seen on [HaaS project website](https://haas.nic.cz).

![HaaS Session](haas-session.png)

Sadly, there is currently no way to visualize what your own router collects from
Firewall monitoring and Minipots - a feature we are working hard on now.
