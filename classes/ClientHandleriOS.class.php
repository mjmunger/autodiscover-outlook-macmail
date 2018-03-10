<?php
/**
 * {CLASS SUMMARY}
 *
 * Date: 3/8/18
 * Time: 8:51 AM
 * @author Michael Munger <michael@highpoweredhelp.com>
 */

namespace Autodiscover;

use \PDO;

class ClientHandleriOS extends ClientHandlerBase
{
    public function __construct()
    {
        $this->template = dirname(__DIR__) . '/resources/mobileconfig.xml';
    }

    public function getVars() {
        $email = filter_var($_GET['email'],FILTER_SANITIZE_EMAIL);
        return $email;
    }

    public function parseEmailAddress($buffer) {

        if (filter_var($buffer,FILTER_VALIDATE_EMAIL) == false) $this->error_out("$buffer is not a valid email address");

        $this->emailAddress = $buffer;

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
                      , "FULLNAME" => $this->getFullName()
                      ];
        foreach($dictionary as $key => $value) {
          $this->log->info(sprintf("%s => %s", $key, $value));
        }
        return $dictionary;
    }
}