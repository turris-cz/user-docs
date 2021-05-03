---
board: shield, mox, omnia, 1.x
competency: novice
---
# NetMetr

## What is NetMetr?

NetMetr is a tool for measuring the actual quality of Internet access services,
such as download and upload speed and latency. It allows users to perform
thorough and detailed testing and get
comprehensive information not only about the status of their particular connection,
but also analyze previous measurements and especially measurements of other
participants. All data (excluding personal data) and source codes are released on
the Open Source principle.

## Installation & first run

To use NetMetr on Turris device proceed in these steps:

1. Install NetMetr package using Updater tab in reForis web interface
2. After successful installation new NetMetr tab will appear
3. Click _Start test_ button to start a new test

## Automated run

NetMetr could be also started automatically to periodically benchmark your Internet
connection. You can use a timetable to choose hours to run it.

![timetable](netmetr-autostart.png)

When autostarted, NetMetr is not started in the exact times stated above, instead
it uses a few minute random wait to load balance the server.

## Collected data

NetMetr server stores your measurements linked to the device so that you can view
all the past measurements on its [website](https://www.netmetr.cz/en/my.html). To
view your results you have to enter *Sync code* which is displayed in NetMetr
Foris tab.

All the data are - after proper anonymization - also shared on NetMetr
[map](https://www.netmetr.cz/en/map.html) and as an
[open data](https://www.netmetr.cz/en/open-data.html).

## Other NetMetr apps

The NetMetr is also available as a [web](https://www.netmetr.cz/en/test.html) application
and as a mobile application on [Google Play](https://play.google.com/store/apps/details?id=cz.nic.netmetr)
and [App Store](https://apps.apple.com/cz/app/netmetr/id946478662)
