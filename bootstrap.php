<?php
/**
 * Bootstrapper and autoloader
 *
 * Date: 3/8/18
 * Time: 8:08 AM
 * @author Michael Munger <michael@highpoweredhelp.com>
 */

function appAutoloader($class) {
    $buffer = explode("\\", $class);
    $class = end($buffer);

    $baseDir = __DIR__;

    $candidate_files = [];

    /* If this is not a database abstraction, then it is located in the classes directory. Try that last. */
    $candidate_path = sprintf($baseDir.'/classes/%s.class.php',$class);
    array_push($candidate_files, $candidate_path);

    /* Loop through all candidate files, and attempt to load them all in the correct order (FIFO) */
    foreach($candidate_files as $dependency) {
        if(file_exists($dependency) && is_readable($dependency)) require_once($dependency);
    }

    return ['success' => true];
}

spl_autoload_register('appAutoloader');

if(file_exists('vendor/autoload.php')) include('vendor/autoload.php');