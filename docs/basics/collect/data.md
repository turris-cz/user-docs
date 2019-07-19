What data we collect
=========================

There are multiple source of data we collect. Depending on the source used, the
type of data varies.

### Firewall monitoring
 
Firewall data is one of the key data sources for [Sentinel](/basics/apps/sentinel). Using firewall data
we can determine which attackers tries to exploit potential vulnerabilities on
a particular port. We collect attacker IP address and local port number.

### Minipot

The word "Minipot" is a combination of the words "mini" and "Honeypot", where
Honeypot, also called a fake server, is a way to mimic some kind of service,
usually attractive to a potential attacker.

Turris Minipot is a lightweight Honeypot which emulates only minimal subset of
each protocol, answering "bad password" to each attempt to log in. We currently
operate telnet Minipots. The entered user/password combination along with
the attacker's IP address is collected by the software.
