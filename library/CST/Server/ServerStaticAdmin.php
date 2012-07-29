<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Satatic
 *
 * @author Laptop
 */
 class CST_Server_ServerStaticAdmin extends CST_Server_Server {

    //put your code here

    public function __construct() {
        
    }
    
    public static function getUrl() {
        return Zend_Registry::get('_serverStaticAdmin');
    }

}

?>
