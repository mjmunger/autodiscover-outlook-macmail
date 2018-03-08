<?php
/**
 * {CLASS SUMMARY}
 *
 * Date: 3/8/18
 * Time: 8:49 AM
 * @author Michael Munger <michael@highpoweredhelp.com>
 */

namespace Autodiscover;


class ClientFactory
{
    public static function getClientHandler($request) {
        $buffer = explode('?',$request['REQUEST_URI']);
        $uri = $buffer[0];
        switch($uri) {
            case '/Autodiscover/Autodiscover.xml':
                return new ClientHandlerOutlookMacMail();
                break;
            case '/mail/config-v1.1.xml':
                return new ClientHandlerThunderbird();
                break;
            case '/email.mobileconfig':
                return new ClientHandleriOS();
                break;
            default:
                throw new \Exception('Cannot determine the request type for this URI.');
        }
    }
}