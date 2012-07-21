<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Action
 *
 * @author Laptop
 */
class CST_Controller_Action extends Zend_Controller_Action {
    
    public $_session;
    
    public function init()
    {
        parent::init();
        $this->_session = new Zend_Session_Namespace('kmComputer');
    }
}
