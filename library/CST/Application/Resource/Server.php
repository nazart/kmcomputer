<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of CTS_Application_Resource_Demo
 *
 * @author Laptop
 */
class CST_Application_Resource_Server extends Zend_Application_Resource_ResourceAbstract {

    //put your code here
        public $_urlStatic;
        public $_urlDinamic;
    public function init() {
        $option = $this->getOptions();
        Zend_Registry::set('_serverDinamic', $option['urlDinamic']);
        Zend_Registry::set('_serverStatic', $option['urlStatic']);
        /*$this->_urlDinamic = $option['urlDinamic'];
        $this->_urlStatic = $option['urlStatic'];*/
    }
    

}

?>
