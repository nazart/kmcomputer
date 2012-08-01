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
class Application_Form_FormularioLoginAdmin extends CST_Form {

    //put your code here
    public function init() {
        parent::init();
        $this->addElement(new Zend_Form_Element_Text('Login', array('required' => true)));
        $this->addElement(new Zend_Form_Element_Password('Password', array('required' => true)));
        $this->addElement(new Zend_Form_Element_Submit('Enviar'));
        $this->setAction('/admin/panel/');
        $this->setMethod('Post');
    }
   public function removeDecorators() {
        $this->getElement('Login')->setAttrib('class', 'login-inp');
        $this->getElement('Password')->setAttrib('class', 'login-inp');
        $this->getElement('Enviar')->setAttrib('class', 'submit-login');
        
        $this->getElement('Login')->removeDecorator('label');
        $this->getElement('Password')->removeDecorator('label');
        $this->getElement('Enviar')->removeDecorator('label');
    }
}

?>
