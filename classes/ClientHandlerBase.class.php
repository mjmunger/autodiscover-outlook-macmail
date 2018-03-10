<?php
/**
 * {CLASS SUMMARY}
 *
 * Date: 3/8/18
 * Time: 8:50 AM
 * @author Michael Munger <michael@highpoweredhelp.com>
 */

namespace Autodiscover;

use Monolog\Logger;
use Monolog\Handler\StreamHandler;


class ClientHandlerBase
{
    public    $emailAddress = '';
    public    $domain       = '';
    public    $config       = '';
    public    $log          = false;
    public    $response     = '';
    public    $headers      = [];
    protected $template     = '';

    public function sanitizeJSON($jsonString) {
        $forbiddenChars = [ "\n", "\t", "\r" ];

        foreach($forbiddenChars as $char) {
            $jsonString = str_replace($char, ' ', $jsonString);
        }

        while(stristr($jsonString,"  ") !== false) {
            $jsonString = str_replace("  ", " ", $jsonString);
        }

        return $jsonString;
    }

    public function loadConfig($configPath) {
        if(file_exists($configPath) == false) throw new \Exception("Could not find config: $configPath");

        $this->config = json_decode($this->sanitizeJSON(file_get_contents($configPath)));

        $this->setupLogging();
    }

    public function setupLogging() {
        if($this->config->logging == false) return false;

        // create a log channel
        $log = new Logger('Autodiscover');

        $log->pushHandler(new StreamHandler(dirname(__DIR__) . '/logs/autodiscover.log', Logger::INFO));
        $log->pushHandler(new StreamHandler(dirname(__DIR__) . '/logs/autodiscover.log', Logger::WARNING));
        $log->pushHandler(new StreamHandler(dirname(__DIR__) . '/logs/autodiscover.log', Logger::ERROR));

        $this->log = $log;

    }

    public function error_out($message) {
        if($this->config->logging) $this->log->error($message);
        throw new \Exception($message);
    }

    public function renderResponse() {
        $dictionary = $this->getDictionary();
        $document   = file_get_contents($this->template);

        foreach($dictionary as $find => $replace) {
            $find = sprintf("{{%s}}", $find);
            $document = str_replace($find,$replace,$document);
        }

        $this->response = $document;
        return $this->response;
    }

    public function parseDomain() {
        $buffer = explode("@",$this->emailAddress);
        $this->domain = end($buffer);
    }

    public function parseLocalPart() {
        $buffer = explode("@",$this->emailAddress);
        $this->localPart = $buffer[0];
        return $this->localPart;
    }

    public function getFullName() {

        $dsn = sprintf('mysql:host=%s;dbname=%s', $this->config->database->server, $this->config->database->dbname);
        $username = $this->config->database->username;
        $password = $this->config->database->password;
        try {
          $dbh = new PDO($dsn, $username, $password);
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

    public function getHeaders() {
        $this->headers[] = "Cache-Control: no-cache, must-revalidate";
        $this->headers[] = "Pragma: no-cache";
        $this->headers[] = "Expires: Sat, 26 Jul 1997 05:00:00 GMT";
        $this->headers[] = "Content-type: application/xml";
        return $this->headers;
    }
}