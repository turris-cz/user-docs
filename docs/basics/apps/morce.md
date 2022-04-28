---
board: mox, omnia, 1.x
competency: advanced
---
# Morce - IDS integration

## What is Morce?

_Morce_ is a simple integration of [IDS](https://en.wikipedia.org/wiki/Intrusion_detection_system)
into Turris OS. It is intended to help you discover suspicious behaviour on
your local network. Currently there is almost no integration into the reForis user
interface.

## Details

_Morce_ is currently just a plugin and integration of
[Snort3](https://www.snort.org/snort3). It contains an init script that handles
downloading and integration of publicly available community rule sets from
[Snort](https://www.snort.org/downloads#rules) and [Emerging
threads](https://doc.emergingthreats.net) as well as appropriately starting
Snort itself.

The plugin that is used with snorts handles notification about discovered threats.
Whenever one of the enabled rules is triggered, the event is stored in a database
for future use and a notification is sent to the admin of the router via Turris
notification system. If you set it up, you will receive the notification via
e-mail, otherwise you will get it in the reForis user interface.

## Configuration

You can set various options in the UCI configuration file in `/etc/config/morce`. The default one looks as follows.

```
# Notification options
config config 'notify'
    # Allows you to disable notifications
    ## option enabled '0'

    # Allows you to override the notification command
    # Notification is added as a last argument
    ## option command 'create_notification -s error'

config config 'setup'
    # Database for live data
    ## option live_database '/var/run/morce/morce-alerts.sqlite'
    # Database for cold and persistent data
    ## option cold_database '/srv/morce-alerts.sqlite'
    # Interface to listen on
    ## option interface 'br-lan'

config config 'et'
    # Specify which ruleset you want to use, the default is all bellow enabled
    ## list rules "activex"
    ## list rules "attack_response"
    ## list rules "botcc"
    ## list rules "compromised"
    ## list rules "current_events"
    ## list rules "dos"
    ## list rules "dshield"
    ## list rules "exploit"
    ## list rules "malware"
    ## list rules "mobile_malware"
    ## list rules "trojan"
    ## list rules "worm"
```

### `notify`

In the notification section, you can disable notifications or change the command
that is run to notify you about the recognized incident. You can use any command
available in your system with as many options as you like, at the end as a last
argument the notification message will be appended.

### `setup`

In the setup section you can alter various aspects of how is everything run. You
can decide where to store hot/cold databases. The hot one contains raw events, while
the cold one aggregates multiple events of the same type to save space and to be easier
to browse. Apart from that, you can select the interface to monitor for threats.

### `et`

This is only applicable to the Emerging Threats ruleset. This ruleset is divided
into various
[categories](https://doc.emergingthreats.net/bin/view/Main/EmergingFAQ#What_is_the_general_intent_of_ea)
named in the configuration file. You can alter the default selection and enable
more or enable just a few you need. If there is no list selected, the default
selection of the list is used. If you enable at least one ruleset, the rulesets in
configuration file are used and no more.

Default rulesets:

 * activex
 * attack_response
 * botcc
 * compromised
 * current_events
 * dos
 * dshield
 * exploit
 * malware
 * mobile_malware
 * trojan
 * worm
