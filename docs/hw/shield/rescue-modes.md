---
board: shield
---
# Simple reset and factory reset on Turris Shield

Turris Shield has a reset button on its back panel. When you press it during
normal operation, it will reset the Shield. Button handling is implemented
in software so its function depends on working system. If it seems that Shield
is not restarting unplug it from the power supply for few seconds and then
reconnect it again.

If you hold the button for a while (more than 4 seconds) and then release it,
it will reset the Shield to the factory-default state. It will behave the same
way as on the first startup.

## Rescue modes

!!! warning
    This section is only for information and may be a subject of later changes!
    We do not recommend to use rescue modes because they are designed for
    Turris MOX and require additional software support to be fully usable.
    Moreover, some modes need advanced knowledge.

Please read the [MOX article](../mox/rescue-modes.md) about rescue modes.
Shield has several differences:

1. The order starts at the rescue mode 3. It means that the first mode
   resets to the factory-default state.
2. After the mode 7 it continues to 1 and then it goes ahead just like on MOX
   (i.e., the modes are 3-4-5-6-7-1-2-3-…).
3. There is no tool how to create and view snapshots. Only automatic
   snapshots are available and there is no way how to display which
   snapshot will be used for rollback.
4. A specific filesystem image for re-flash is used instead of the MOX one.
   Download it from
   [the repository](https://repo.turris.cz/hbs/medkit/mox-medkit-contract-shield-latest.tar.gz).
   You can also download and put alongside the
   [sha256](https://repo.turris.cz/hbs/medkit/mox-medkit-contract-shield-latest.tar.gz.sha256)
   or [sig](https://repo.turris.cz/hbs/medkit/mox-medkit-contract-shield-latest.tar.gz.sig)
   file.
