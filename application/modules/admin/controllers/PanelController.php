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
class Admin_PanelController extends CST_Controller_ActionAdmin {

    public function init() {
        parent::init();
        Zend_Layout::getMvcInstance()->setLayout('layout-admin-panel');
        /* Initialize action controller here */
    }

    public function indexAction() {
      
        
    }
    //put your code here
}

?>
