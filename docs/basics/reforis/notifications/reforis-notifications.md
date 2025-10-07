---
board: mox, omnia, 1.x, shield
competency: novice
---
# Notifications in reForis

There are two ways how Turris OS notifies what happens. The first one is the web
interface (i.e., reForis), and the other one is e-mail. Internal notifications
in reForis are always enabled, whereas e-mail notifications have to be
explicitly enabled.

## Internal notifications in reForis

Internal notifications in reForis are emitted on all important events – such
as installed or removed packages, long operations, requested reboots, or
errors that occurred. Anywhere you are in reForis, new notifications are
indicated by the number at the small bell in the top-right corner of
the page. The displayed number in the red disc means the number of new
notifications.

![You have new notifications](bell.png)

If you move the mouse cursor over the bell, a brief list of the notifications
is displayed. You can go to the _Notifications_ page, configure the e-mail
notifications (see below), or dismiss the notifications individually or
all at once.

![Brief list of notifications](list.png)

All of the undismissed notifications are on the _Notifications_ page.

![Notifications in reForis](notifications.png)

Here you can see the notification with their details, for example, with
all installed/removed packages, full error messages, and so on. Longer
contents are shortened, and you can get their full versions by clicking
to _Show more_.

## E-mail notifications

Almost nobody checks frequently whether there is something important in
Turris OS. It isn't necessary to do such checks because e-mail
notifications can be configured. They are disabled by default.
These notifications can be set on _Administration → Notification Settings_.

![E-mail notifications](email.png)

If you enable these notifications by checking _Enable email notifications_,
there are several parameters to be configured:

* **SMTP provider** – The Turris team provides its mail infrastructure
  to allow simple distribution of e-mail notifications. This option (_Turris_)
  is enabled by default and you may utilize it for free and without any
  restrictions. If you want to use your own mail server for some reason,
  then simply switch to _Custom_. See below for details.

* **Recipient's email** – This is the address to be used for e-mail
  notifications. It's possible to use multiple addresses; separate them by
  commas.

!!! important
    If you want to use the Turris mail infrastructure, please do not set
    an e-mail address that is forwarded/redirected to another address. As we
    use antispam technologies like
    [SPF](https://en.wikipedia.org/wiki/Sender_Policy_Framework),
    [DKIM](https://en.wikipedia.org/wiki/DomainKeys_Identified_Mail), and
    [DMARC](https://en.wikipedia.org/wiki/DMARC), the notification messages need
    not be delivered. Mailing lists are usually safe, but it depends on
    specific implementation and/or configuration.

### Custom mail server

It's necessary to set additional parameters to use this option:

* **Sender address (From)** – It will be used as the address of the sender.
  If the delivery of a message fails, it will be returned to this address.

* **Server port** – This is usually 465
  ([SMTP](https://en.wikipedia.org/wiki/Simple_Mail_Transfer_Protocol)
  with implicit [TLS](https://en.wikipedia.org/wiki/Transport_Layer_Security);
  this is the default), 25 (SMTP with explicit TLS or unsecured), or 587 (SMTP
  submission with explicit TLS or unsecured; it requires
  [authentication](https://en.wikipedia.org/wiki/SMTP_Authentication)).
  Also, you can use other port numbers in some situations.

* **Security** – It can be set to one of these three options:
    * **SSL** – Implicit TLS is the default and most secure.
    * **STARTTLS** – Explicit TLS; use it if your server doesn't support
      implicit TLS.
    * **None** – Unencrypted communication, not recommended; use it only
      if your server doesn't support implicit nor explicit TLS.

* **Username** – The user name for SMTP authentication. Leave empty if
  authentication won't be used.

* **Password** – The password for SMTP authentication. Leave empty if you
  won't use authentication.

![Custom e-mail server](server.png)

## Push notifications

In addition to e-mail notifications, Turris OS also supports push notifications
that are usually faster and can be configured on almost all mobile devices,
like smartphones and tablets; computers like desktops or laptops are supported
too.

We use the [ntfy.sh](https://ntfy.sh) service for push notifications. This
service does not collect personal data and can be simply configured and used.
On top of that, it is open-source and can be self-hosted. You can easily deploy
your own notification server and run all your potentially sensitive notifications
through your own infrastructure.

### How to receive ntfy.sh notifications

1. Download the application. For Android, we recommend using
   [F-Droid](https://f-droid.org/en/packages/io.heckel.ntfy/), but you can
   download from [Google Play](https://play.google.com/store/apps/details?id=io.heckel.ntfy)
   too. For Apple iOS, download it from the
   [App Store](https://apps.apple.com/us/app/ntfy/id1625396347).
2. Run the application and press the "+" button at the bottom-right corner.
   Choose a name that is hard to guess (because there is no password
   protection). Then press the "SUBSCRIBE" button.
   ![Subscribe dialog](ntfy-subscribe.png)
3. Then you are ready to receive notifications.

!!! tip
    It is possible to run your own instance of the ntfy server.
    See the [documentation](https://docs.ntfy.sh/install/)
    if you are interested in it.

### How to configure ntfy.sh notifications in reForis

There are two form fields to be filled in:

* **URL** – Fill in the notification URL. For the standard server, it is
  constructed as `https://ntfy.sh/<TOPIC>`, where `<TOPIC>` is the name
  that you have set in the application.
* **Priority** – This is the notification priority; the default is _High_.
  Keep unchanged, unless you have received huge quantities of push
  notifications and you want to prioritize them.

![Push notifications](push.png)

## General settings

These parameters are common for all notification methods:

* **Importance** – By default, only notifications on required reboots are
  sent. It can be changed to more "verbose" options.

* **Send news** – If you check this checkbox, we will send you messages about
  new features and other essential things about the Turris project.

![General settings](general.png)

## Test notification

After you configure the e-mail notification mechanism, we strongly encourage
you to send a test notification to ensure that all parameters have been set
correctly. Simply click to _Send testing notification_.

![Test notification](test.png)

!!! important
    The importance level must be set at least to "Reboot or attention is
    required". After testing, you can set it to the original level.

Then check your mailbox for the testing notification message. If it doesn't
arrive please wait approximately 30 minutes because some antispam methods, like
greylisting, can delay messages in some cases. If the message doesn't come
after this period, check your settings.

!!! notice
    Some of the configuration errors are reported by reForis during the test.
    But even if it looks good in reForis, it needn't mean that the
    configuration is correct. And vice versa, if the given server uses
    greylisting or similar antispam technology, it may report an error
    even for a correct configuration. Please wait ca. 10 minutes and
    try the test again.
