<?php
/**
 * {CLASS SUMMARY}
 *
 * Date: 3/8/18
 * Time: 8:50 AM
 * @author Michael Munger <michael@highpoweredhelp.com>
 */

namespace Autodiscover;


class ClientHandlerOutlookMacMail extends ClientHandlerBase
{
    public function __construct()
    {
        $this->template = dirname(__DIR__) . '/resources/autodiscover.xml';
    }

    public function getVars() {
        return file_get_contents("php://input");
    }

    public function parseEmailAddress($buffer) {

        if(strlen($buffer) == 0) return false;

        $xml = simplexml_load_string($buffer);

        if($xml == false) $this->error_out("Could not get a valid XML file.");

        $this->emailAddress = (string) $xml->Request->EMailAddress;

        if($this->config->logging) $this->log->info("Found email address: $this->emailAddress");

        if(filter_var($this->emailAddress,FILTER_VALIDATE_EMAIL ) == false) $this->error_out("$this->emailAddress does not appear to be a well formed email address.");

        $this->parseDomain();
        return $this->emailAddress;
    }

    public function getDictionary() {
        $dictionary = [ "EMAIL"    => $this->emailAddress
                      , "IMAPHOST" => $this->config->servers->imap->hostname
                      , "IMAPPORT" => $this->config->servers->imap->port
                      , "SMTPHOST" => $this->config->servers->smtp->hostname
                      , "SMTPPORT" => $this->config->servers->smtp->port
                      , "DOMAIN"   => $this->domain
                      ];

        return $dictionary;
    }
}