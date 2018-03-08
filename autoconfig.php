<?php
/**
 * Responds to autoconfig requests.
 *
 * Date: 3/8/18
 * Time: 12:55 PM
 * @author Michael Munger <michael@highpoweredhelp.com>
 */

namespace Autodiscover;

$configPath = 'config/config.json';

include(__DIR__ . "/bootstrap.php");

if(file_exists($configPath) == false ) die("Config does not exist! RTFM. See: https://github.com/mjmunger/autodiscover-outlook-macmail");

$ClientHandler = ClientFactory::getClientHandler($_SERVER);
$ClientHandler->loadConfig($configPath);

$payload = $ClientHandler->getVars();

$ClientHandler->parseEmailAddress($payload);
$ClientHandler->renderResponse();

ob_start();

foreach($ClientHandler->getHeaders() as $header) {
    header($header . "\r\n");
}

echo $ClientHandler->response;

ob_flush();

