---
board: mox, omnia, 1.x, shield
competency: novice
---

# Passwords in reForis

Here, you can change your passwords, both for reForis and for the advanced
administration (LuCI and CLI). They can be set on the _Administration
→ Password_ page.

!!! tip
    See the [Passwords](../../../../security/passwords/) page to get more
    information about passwords in Turris OS.

## Password for reForis

Fill your current password into the _Current password_ field and
your new password into the next two fields (_New password_ and
_Confirm new password_). Then press the _Save_ button.

!!! important
    Use a [strong password](https://en.wikipedia.org/wiki/Password_strength#Guidelines_for_strong_passwords).
    You can use a [password manager](https://en.wikipedia.org/wiki/Password_manager)
    instead of remembering passwords.

![reForis password](reforis-password.png)

## Password for advanced administration

!!! notice
    This kind of password is not available in Turris Shield.

You can use the same password as for reForis. See the dialog above; check
_Use the same password..._ to ensure this. If you want to set a different
password, you can fill in the second dialog on the same page.

![Advanced Administration Password](root-password.png)

!!! important
    Fill the _Current password_ field in the previous dialog, too. Without this
    password, your request to change the system password will be denied.

## Common passwords filter

There is an optional feature called **Common passwords**. It can be
installed as a separate package, and then it checks passwords in the
database of compromised passwords. See the [Password filter](../../../security/common-passwords.md)
page for more information.
