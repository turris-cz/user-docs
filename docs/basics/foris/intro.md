---
board: mox, omnia, 1.x
---
# Foris

## What is Foris

Foris is the legacy router administration interface used on
[Turris devices](../models.md). It allows to simply set up
a router according to user requirements in both home and
enterprise network. As a part of the interface there is also
an initial setup wizard which helps users to make an initial
configuration step by step.

!!! warning
    Foris is not available on Turris Shield.

## When to use Foris and reForis

ReForis is the new router administration interface. It is much more
flexible and based on modern technologies. Currently, we recommend
to use [reForis](../reforis/intro.md) on all Turris device with
Turris OS 5.x by default.

There are two cases in which Foris is necessary:

1. Devices with Turris OS 3.x (usually Turris 1.x devices or older
   Omnias not yet upgraded to Turris OS 5.x).
2. If you need applications not (yet) available via reForis,
   e.g. [PaKon](../apps/pakon.md).

Foris does not include all features. The only case when Foris
is necessary is Turris OS 3.x where reForis is not (and will not be)
available.

!!! important
    Since Turris OS 6.0, Foris has been completely replaced by
    [reForis](../reforis/intro.md).
