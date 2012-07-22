<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of productos
 *
 * @author Laptop
 */
class Application_service_Productos {

    //put your code here

    function __construct() {

        $server = new Zend_Rest_Server();
        $server->setClass('My_Service_Class');
        $server->handle();
    }

}

?>
