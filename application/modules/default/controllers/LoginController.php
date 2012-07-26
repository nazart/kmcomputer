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
class Default_LoginController extends CST_Controller_ActionDefault {

    public function init() {
        parent::init();
        /* Initialize action controller here */
    }

    public function indexAction() {
        if ($this->getRequest()->isPost()) {
            $formulario = new Application_Form_FormularioLogin();
            if ($formulario->isValid($this->_getAllParams()) &&
                    $this->autentificateUser($this->_getParam('Login'), 
                            $this->_getParam('Password'))) {
                $this->_redirect('/');
            } else {
            }
            $formulario->removeDecorators();
            $formulario->customDecoratorFile("/form-custom/_formLoginHeader.phtml");
            $this->view->formLoginHeader = $formulario;
        }
    }
    public function salirAction(){
        Zend_Auth::getInstance()->clearIdentity();
        $this->_redirect('/');
    }

    //put your code here
}

?>
