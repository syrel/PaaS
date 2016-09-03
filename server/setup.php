<?php
/**
 * Created by PhpStorm.
 * User: aliaksei
 * Date: 03/09/16
 * Time: 06:45
 */
header('Access-Control-Allow-Origin: *');

static $PORT = 6561;

class exec {

    static function run($command){
        $PID = exec("$command 2>/dev/null >/dev/null &");
        return($PID);
    }

    static function isRunning($name){
        exec("pgrep $name", $pids);
        return !empty($pids);
    }
};

if(!exec::isRunning('pharo')) {
    echo exec::run('bash --login -c "./start.sh '.$PORT.'"');
}

function render ($mode, $pillar) {
    global $PORT;
    if (strlen($pillar) == 0)
        return '';
    $url = 'http://'.$_SERVER['SERVER_NAME'].':'.$PORT.'/'.$mode;
    $options = array(
        'http' => array(
            'header'  => "Content-type: text/html",
            'method'  => 'POST',
            'content' => $pillar
        )
    );
    $context  = stream_context_create($options);
    $result = file_get_contents($url, false, $context);
    if ($result === FALSE) { /* Handle error */ }

    return $result;
}