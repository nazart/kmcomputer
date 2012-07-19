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
class CST_Server_ServerDinamic extends CST_Server_Server{
    //put your code here
    
   public static function getUrl() {
        return Zend_Registry::get('_serverDinamic');
    }
   
}

?>
