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

    public function getFullName() {

        $dsn = sprintf('mysql:host=%s;dbname=%s', $this->config->database->server, $this->config->database->dbname);
        $username = $this->config->database->username;
        $password = $this->config->database->password;
        try {
          $dbh = new PDO($dsn, $username, $password, $options);
        } catch (Exception $e) {
          return $this->emailAddress;
        }

        $stmt = $dbh->prepare("SELECT `name` FROM `mailbox` WHERE `username` = ?");

        $stmt->execute([ $this->emailAddress ]);

        if($stmt->errorCode() != '00000') {
          $this->log->error(sprintf("Database error: (%s) %s", $stmt->errorCode(), $stmt->errorInfo()[2]));
          return $this->emailAddress;
        }

        if($stmt->rowCount() == 0) {
          $this->log->info(sprintf("Someone tried to do a lookup for %s, but this account doesn't exist.", $this->emailAddress));
          return "Nobody";
        }

        $row = $stmt->fetchObject();
        return $row->name;
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
        return $dictionary;
    }
}