<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of FormularioLogin
 *
 * @author Laptop
 */
class Application_Form_FormularioLogin extends CST_Form {

    //put your code here
    public function init() {
        parent::init();
        $this->addElement(new Zend_Form_Element_Text('Login', 
                array('required' => true,'label'=>'Usuario')));
        $this->addElement(new Zend_Form_Element_Password('Password', array('required' => true,'label'=>'Password')));
        $this->addElement(new Zend_Form_Element_Submit('Ok'));
        $this->setAction('/login');
        $this->setMethod('Post');
    }
   public function removeDecorators() {
//        $this->getElement('Login')->removeDecorator('label');
//        $this->getElement('Password')->removeDecorator('label');
//        $this->getElement('Ok')->removeDecorator('label');
    }
}

?>
