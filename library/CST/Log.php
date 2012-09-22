<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Log
 *
 * @author Laptop
 */
class CST_Log extends Zend_Log {
    //put your code here
    public $_logger;
    
    public function __construct() {
        $this->_logger =  $this->getLogger();
    }
    public function getLogger(){
        $writer = new Zend_Log_Writer_Stream(APPLICATION_PATH .'/../var/log/application.log');
        return new Zend_Log($writer);
    }
    static function info($value){
        self::getLogger()->info($value);
    }
    static function error($value){
        self::getLogger()->err($value);
    }
    static function warn($value){
        self::getLogger()->warn($value);
    }

}

?>
