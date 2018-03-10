<?php
/**
 * {CLASS SUMMARY}
 *
 * Date: 3/8/18
 * Time: 8:51 AM
 * @author Michael Munger <michael@highpoweredhelp.com>
 */

namespace Autodiscover;


class ClientHandlerThunderbird extends ClientHandlerBase
{
    public function __construct()
    {
        $this->template = dirname(__DIR__) . '/resources/autoconfig.xml';
    }

    public function getVars() {
        //Should be passed in a GET var: https://developer.mozilla.org/en-US/docs/Mozilla/Thunderbird/Autoconfiguration

        return filter_var($_GET['emailaddress'],FILTER_SANITIZE_EMAIL);
    }

    public function parseEmailAddress($payload) {
        $email = filter_var($payload,FILTER_SANITIZE_EMAIL);

        if(filter_var($email,FILTER_VALIDATE_EMAIL) == false) $this->error_out("$payload could not be parsed into a valid email.");
        $this->emailAddress = $email;
        $this->parseDomain();
        return true;
    }

    public function getDictionary() {
        $dictionary = [ "EMAIL"          => $this->emailAddress
                      , "IMAPHOST"       => $this->config->servers->imap->hostname
                      , "IMAPPORT"       => $this->config->servers->imap->port
                      , "SMTPHOST"       => $this->config->servers->smtp->hostname
                      , "SMTPPORT"       => $this->config->servers->smtp->port
                      , "DOMAIN"         => $this->domain
                      , "FULLNAME"       => $this->getFullName()
                      , "EMAILLOCALPART" => $this->parseLocalPart()
                      ];

        return $dictionary;
    }
}