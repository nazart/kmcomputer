<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of BuscarController
 *
 * @author Laptop
 */
class Default_MiCuentaController extends CST_Controller_ActionDefault {

    public function init() {
        parent::init();
        Zend_Layout::getMvcInstance()->setLayout('layout-acount');
        /* Initialize action controller here */
    }

    public function indexAction() {
        
    }

    //put your code here
}

?>
