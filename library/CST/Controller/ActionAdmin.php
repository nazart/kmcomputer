<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of ActionAdmin
 *
 * @author Laptop
 */
class CST_Controller_ActionAdmin extends CST_Controller_Action {

    public function init() {
        parent::init();
        Zend_Layout::getMvcInstance()->setLayout('layout-admin');
    }
    
    

    //put your code here
}