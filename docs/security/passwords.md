---
board: mox, omnia, 1.x, shield
competency: intermediate
---
# Passwords in Turris OS

Passwords are an important part of the security of operating systems. This
article describes how Turris OS works with passwords and which security measures
are used.

## About passwords

In general, Turris OS has two distinct classes of passwords:

* one password for reForis,
* user-related passwords for other purposes (e.g., LuCI and SSH), i.e., system
  passwords.

These passwords are set separately, but Foris and reForis can set the same
password for Foris/reForis and the `root` user (see below).

Unlike some other routers, Turris has no default nor hard-coded passwords.
The reForis password is originally set in the first start guide.
System passwords need not be set there but you won't be able to log into LuCI
or access your router via SSH if no password is set for the `root` user.

!!! notice
    System passwords are not available in Turris Shield.

## How passwords are stored and secured

### ReForis password

The reForis password is stored as the `auth.password` configuration
option in `/etc/config/foris`. It is stored as a
[salted](https://en.wikipedia.org/wiki/Salt_(cryptography))
[hash](https://en.wikipedia.org/wiki/Hash_function) using
[PBKDF2](https://en.wikipedia.org/wiki/PBKDF2) as its algorithm
(currently with 1000 iterations).

### System passwords

System passwords are stored using the same method as common Linux
distributions do: in `/etc/shadow` together with their user names.
These passwords are stored as salted hashes; the hashing
algorithm is currently
[SHA-512](https://en.wikipedia.org/wiki/SHA-2),
but it can be changed in the future.

## How to change passwords

### In reForis

See the [Password](../basics/reforis/password/password.md) page in
the _reForis Administration_ section for more information.

## Other ways (system password)

It can also be set via LuCI or via `passwd` in the command line. It is also
possible to create additional users and set their password using standard
command line commands like `useradd`.

!!! warning
    There are two different versions of `passwd`. The one from Busybox, which
    is always installed, is in `/bin/passwd` and hashes passwords by SHA-512.
    But if you install the standard GNU version, it will be installed to
    `/usr/bin/passwd` and will hash passwords by PBKDF2. This version will
    have a preference; thus, passwords set by simply `passwd` will be hashed
    by PBKDF2.
