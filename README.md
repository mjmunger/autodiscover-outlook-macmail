# autodiscover-outlook-macmail
This PHP repo is a configurable set of scripts to autoconfigure Outlook, MacMail, Android, iPhone, and Thunderbird for your IMAP and SMTP servers.

# What's this?

This script is written for people using postfix admin, and _assumes_ you are using a single server and virtual hosts. It's useful, in this case, to have an autoconfigure script that will help your users setup their various email clients.

## Supported configurations

### Secure connections only.

Additionally, non-ssl protected connections are not supported, and there are no plans to support insecure connections.

If you need help with this, you can configure LetsEncrypt to generate free certs for your domain. After the certs have been renewed, use a post renewal script to update postfix and dovecot to use the new cert. SANs are useful here as well. 

### IMAP only

As of the initial version, only IMAP is supported. POP3 is not supported, and there are no plans to support it.

### SMTP 

The default configuration assumes that you are using tcp/587 submission to send _authenticated_ emails to the server. Other configurations are not currently supported.

# Setup

## Configure JSON file

The `configs/config.json` file contains the information you need to setup your server. Configure access to the database server. It is looking for a postfix database, which should be the **same** one you are using for postfix admin.

JSON objects:

* database - this should be the same database you're using with Postfix admin.
* Servers > IMAP - Your IMAP server details
* Servers > SMTP - Your SMTP server details 


## Configure DNS


# References / Credits / Thanks
Thanks to the work of these fine folks whose repos provided guidance and insight into this process:

* [Tiliq](https://github.com/Tiliq/autodiscover.xml)