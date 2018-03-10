# autodiscover-outlook-macmail
This PHP repo is a configurable set of scripts to autoconfigure Outlook, MacMail, Android, iPhone, and Thunderbird for your IMAP and SMTP servers.
# Quickstart (TL;DR - Just get me setup!)

1. Clone the repo to DOCUMENT_ROOT/autodiscover
1. Run `composer update` to get dependencies.
1. Configure the JSON file (config/config.json)
1. Setup DNS so clients can find it (see below)
1. Configure Apache mod_rewrite for virtual hosts (See copy / paste stuff below)
1. Configure your SSL certificate SAN to include autoconfig and autodiscover. (Notes on using LetsEncrypt for this, below)

## Quickstart - Outlook

It should just work. Once you configure DNS as noted below, you can use the connectivity tester (see "Tests" below), and confirm you've set everything up correctly.

## Mac / iOS

iOS is dumb. It doesn't do any automatic lookups. Instead, you have to send links to all your people like this:

 `https://example.org/email.mobileconfig?email=foo@example.org`

 This auto-generates a profile configuration, which will tell iPhone / iPad / etc... to setup a mail account. These will be unsigned by default, so you have to walk your users through clicking "yes, I really want to". 

 ## Android (Gmail App)

 The gmail app is even dumber. It doesn't do lookups, _and_ it doesn't have profile configs. So, it's pretty well worthless for autodiscover / autoconfig.

 ## Thunderbird

 Thunderbird... just works. Simpliest and easiest of them all! Well done, Mozilla.

# Supported configurations

## Secure connections only.

Additionally, non-ssl protected connections are not supported, and there are no plans to support insecure connections.

If you need help with this, you can configure LetsEncrypt to generate free certs for your domain. After the certs have been renewed, use a post renewal script to update postfix and dovecot to use the new cert. SANs are useful here as well. 

## IMAP only

As of the initial version, only IMAP is supported. POP3 is not supported, and there are no plans to support it.

## SMTP 

The default configuration assumes that you are using tcp/587 submission to send _authenticated_ emails to the server. Other configurations are not currently supported.

# Setup

1. Clone the repo to DOCUMENT_ROOT/autodiscover
2. Configure the JSON file
3. Setup DNS so clients can find it.
4. Configure Apache

## Configuring JSON file

The `configs/config.json` file contains the information you need to setup your server. Configure access to the database server. It is looking for a postfix database, which should be the **same** one you are using for postfix admin.

JSON objects:

* database - this should be the same database you're using with Postfix admin.
* Servers > IMAP - Your IMAP server details
* Servers > SMTP - Your SMTP server details 

## Configure DNS

### Helping Thunderbird find your settings

Thunderbird needs the following records:

* An `A` record for autoconfig

````
autoconfig              IN        A      123.456.789.1

````

...or... a CNAME

`autoconfig               IN        CNAME   www`

### Helping iOS, Applemail, and Outlook find your settings:

These clients look for SRV records, so setup these SRV records to point it to your configs:

```
_imaps._tcp             SRV 0 1 993     yourmailserver.example.org.
_submission._tcp        SRV 0 1 587     yourmailserver.example.org.
_autodiscover._tcp      SRV 0 0 443     autodiscover.example.org.
```



## Configuring Apache

We need to use `mod_rewrite` to redirect requests to the script. To do that, add the following lines to your virtual host definition:

```
        #Start autoconfigure stuff
        RewriteEngine On

        #Match Thunderbird
        RewriteRule ^/mail/config-v1.1.xml /autodiscover/autoconfig.php

        #Match iOS / Mobile
        RewriteRule ^/email.mobileconfig /autodiscover/autoconfig.php

        #Match Outlook / Macmail
        RewriteRule ^/Autodiscover/Autodiscover.xml /autodiscover/autoconfig.php

```
## Configuring LetsEncrypt

1. Add `ServerAlias` directives to your existing HTTP and HTTPS configuration files.
1. Use `certbot-auto` to initiate a renewal. 
1. Select the domains from the menu (entering numbers of each one)
1. When prompted, choose *expand* for expanding the names on your cert.
1. When prompted, require https redirection.

# Tests

Testing your configs can be done with these utilities:

* [Microsoft Outlook Connectivity Test](https://testconnectivity.microsoft.com/). Use the *Outlook autodiscover* test!
 
# References

* [Mozilla autoconfig documentation](https://developer.mozilla.org/en-US/docs/Mozilla/Thunderbird/Autoconfiguration)
* [Mozilla Mission Control aka AutoConfig](https://developer.mozilla.org/en-US/docs/Archive/Misc_top_level/MCD,_Mission_Control_Desktop_AKA_AutoConfig)
* [Implementing an Autodiscover Client in Microsoft Exchange](https://msdn.microsoft.com/en-us/library/office/ee332364(v=exchg.140).aspx#sectionSection0)
* [Configuration profiles in Mac and iOS](https://developer.apple.com/library/content/featuredarticles/iPhoneConfigurationProfileRef/Introduction/Introduction.html#//apple_ref/doc/uid/TP40010206-CH1-SW4)

# Credits / Thanks
Thanks to the work of these fine folks whose repos provided guidance and insight into this process:

* [Tiliq](https://github.com/Tiliq/autodiscover.xml)
* [gronke](https://github.com/gronke/email-autodiscover)
* [Thorarin](https://github.com/Thorarin/MailClientAutoConfig)