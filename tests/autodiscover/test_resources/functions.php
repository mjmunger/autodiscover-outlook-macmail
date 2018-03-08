<?php
/**
 * {CLASS SUMMARY}
 *
 * Date: 3/8/18
 * Time: 10:50 AM
 * @author Michael Munger <michael@highpoweredhelp.com>
 */

namespace Autodiscover;

function get_request_provider() {

    // Reference: https://msdn.microsoft.com/en-us/library/office/ee332364(v=exchg.140).aspx#sectionSection0

    $xml = "<Autodiscover
  xmlns=\"http://schemas.microsoft.com/exchange/autodiscover/outlook/requestschema/2006\">
  <Request>
    <EMailAddress>foo@example.org</EMailAddress>
    <AcceptableResponseSchema>
      http://schemas.microsoft.com/exchange/autodiscover/outlook/responseschema/2006a
    </AcceptableResponseSchema>
  </Request>
</Autodiscover>";

    $configPath = dirname(__DIR__) . '/test_resources/sample.uncompressed.config.json';

    return  [
        // Request URI,                                          , Payload              , Expected Email address  , Expected Class                              , ConfigPath
        [ ['REQUEST_URI' => '/Autodiscover/Autodiscover.xml']       , $xml              , 'foo@example.org'       , 'Autodiscover\ClientHandlerOutlookMacMail'  , $configPath , file_get_contents(__DIR__ . '/expected.autodiscover.xml')   ],
        [ ['REQUEST_URI' => '/mail/config-v1.1.xml']                , "baz@example.org" , 'baz@example.org'       , 'Autodiscover\ClientHandlerThunderbird'     , $configPath , file_get_contents(__DIR__ . '/expected.autoconfig.xml') ],
        [ ['REQUEST_URI' => 'email.mobileconfig?email=foo@bar.com'] , 'bar@example.org' , 'bar@example.org'       , 'Autodiscover\ClientHandleriOS'             , $configPath , file_get_contents(__DIR__ . '/expected.mobileconfig.xml') ],
    ];
}