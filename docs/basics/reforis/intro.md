---
board: shield, mox, omnia, 1.x
---
# reForis

## What is reForis

reForis is the new router administration interface used on
[Turris devices](../models.md). It allows to simply set up a router according
to user requirements in both home and enterprise network. As a part of the
interface there is also initial setup wizard which helps users to make an
initial configuration step by step.

## Advantages of using reForis

reForis offers an easy device administration which is meant to be simple even
for inexperienced users. Doing a configuration from reForis is fully supported
and undergoes heavy internal testing. With focus on simplicity, there might be
a corner cases where you might need to use [LuCI](../luci/luci.md),
but in general, those two should not clash.

Using reForis is simple, intuitive and fully responsive. After initial setup
a router is ready and no further settings are required.

reForis also contains the notifications which ensure that users don’t miss
any important event about their routers.

This simplified interface offers the variety of other features in form
of separate plugins which can be optionally installed.

## Previous version Foris

Turris OS versions before 6.0 contained the previous administration interface
Foris too. It has been completely replaced by reForis in newer versions
of Turris OS.

## Technologies

It is powered by tiny layer of [Flask](https://palletsprojects.com/p/flask/)
and most of the functionality is done via [React](https://reactjs.org/) using
[Twitter Bootstrap](https://getbootstrap.com/) as a base for styling.

The interface is modular, supporting various plugins that can be installed over
the time by user to broaden the possibilities of what they ca do with their
router. You can find sources of the reForis base as well as it's modules in our
[GitLab](https://gitlab.nic.cz/turris/reforis).
