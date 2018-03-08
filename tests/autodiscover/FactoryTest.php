<?php
/**
 * {CLASS SUMMARY}
 *
 * Date: 3/8/18
 * Time: 8:12 AM
 * @author Michael Munger <michael@highpoweredhelp.com>
 */

namespace Autodiscover;

use PHPUnit\Framework\TestCase;
use PHPUnit\DbUnit\TestCaseTrait;

$path = __DIR__ . '/test_resources/functions.php';
require_once($path);

class FactoryTest extends TestCase
{

    /**
     * @param $request
     * @param $post
     * @param $get
     * @param $expectedEmail
     * @param $expectedClass
     * @throws \Exception
     *
     * @dataProvider requestProvider
     */

    public function testAutoconfigFactory($request, $payload, $expectedEmail, $expectedClass, $response) {

        $ClientHandler = ClientFactory::getClientHandler($request);

        $this->assertInstanceOf($expectedClass, $ClientHandler);
    }

    /**
     * @param $filePath
     * @param $expectedJSON
     * @dataProvider JSONProvider
     */

    public function testJSONLoader($filePath, $expectedJSON) {
        $ClientHandler = new ClientHandlerBase();
        $ClientHandler->loadConfig($filePath);
        
        $this->assertSame(JSON_ERROR_NONE, json_last_error(), json_last_error_msg());

        $this->assertSame("Iitnf", $ClientHandler->config->database->username);
        $this->assertSame("AhWbWvF", $ClientHandler->config->database->password);
        $this->assertSame("InvcDTmkbpAZGurN", $ClientHandler->config->database->server);
        $this->assertSame("iHlJqdnobhmn", $ClientHandler->config->database->port);
        $this->assertSame("wplDfp", $ClientHandler->config->database->dbname);

        $this->assertSame("VYRySCWitcYMlcqrcV", $ClientHandler->config->servers->imap->hostname);
        $this->assertSame(993, $ClientHandler->config->servers->imap->port);
        $this->assertSame("WIxNntjvoDA", $ClientHandler->config->servers->smtp->hostname);
        $this->assertSame(587, $ClientHandler->config->servers->smtp->port);

        $this->assertSame(true,$ClientHandler->config->logging);

    }

    public function JSONProvider() {

        $expected = json_decode(file_get_contents(__DIR__ .'/test_resources/expected.config.json'));

        return  [ [__DIR__ . '/test_resources/sample.uncompressed.config.json', $expected ]
                ];
    }

    /**
     * @param $request
     * @param $post
     * @param $get
     * @param $expectedEmail
     * @param $expectedClass
     * @throws \Exception
     *
     * @dataProvider requestProvider
     * @depends testAutoconfigFactory
     */

    public function testParseEmailAddress($request, $payload, $expectedEmail, $expectedClass, $configPath, $response) {
        $ClientHandler = ClientFactory::getClientHandler($request);
        $ClientHandler->loadConfig($configPath);
        //Normally, you would call $ClientHandler->getVars() to get the email. Not mocking that here. Just passing the result.
        $ClientHandler->parseEmailAddress($payload);

        $this->assertSame($expectedEmail, $ClientHandler->emailAddress);

    }

    /**
     * @param $request
     * @param $payload
     * @param $expectedEmail
     * @param $expectedClass
     * @param $configPath
     * @param $response
     * @dataProvider requestProvider
     */
    public function testRenderResponse($request, $payload, $expectedEmail, $expectedClass, $configPath, $response) {
        $ClientHandler = ClientFactory::getClientHandler($request);
        $ClientHandler->loadConfig($configPath);
        //Normally, you would call $ClientHandler->getVars() to get the email. Not mocking that here. Just passing the result.
        $ClientHandler->parseEmailAddress($payload);
        $ClientHandler->renderResponse();

        $this->assertSame($response,$ClientHandler->response);
    }

    public function requestProvider() {
        return get_request_provider();
    }
}