---
board: mox, omnia, 1.x
competency: novice
---
# Accessing Foris via HTTPS

If you see warning box bellow in your Foris web interface, you should add a
permanent certificate exception in your browser. Read on to find out what the
warning means and how to add the permanent certificate exception to suppress
this warning.

![Warning](warning.png)

## What does this warning mean?

In order to safely configure your router, you need a secure channel. If you
don't want to use just your ethernet cable to connect to your router, **a safe
way is to use HTTPS**. Why is HTTPS safe? For one, HTTPS requires a **trusted
certificate** and if the certificate is not trusted, then warnings are
displayed. We use **self-signed certificates**, which are generated on
factory-reset and cannot, unfortunately, be trusted before the first visit to
the page and it is recommended to **add a permanent exception in your browser**
for the certificate to be trusted in future connections.

{%
  include-markdown "../../reforis/https/https.md"
  start="<!--access-https-start-->"
  end="<!--access-https-end-->"
%}
