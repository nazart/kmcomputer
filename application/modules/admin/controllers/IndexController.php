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
class Admin_IndexController extends CST_Controller_ActionAdmin {

    public function init() {
        parent::init();
        /* Initialize action controller here */
    }

    public function indexAction() {
      $this->view->idBody = 'login-bg';
      $formulario = new Application_Form_FormularioLoginAdmin();
      $formulario->removeDecorators();
      $formulario->customDecoratorFile("/forms/_formLoginAdmin.phtml");
                  
      if ($this->getRequest()->isPost()) {
           if ($formulario->isValid($this->_getAllParams()) && 
                    $this->autentificateUser($this->_getParam('Login'), 
                            $this->_getParam('Password'))) {
                
                $this->_redirect($this->view->url(array("module" => "admin",
                            "controller" => "panel",
                            "action" => "index")));
            } else {
            }
            
        }
        $this->view->formLoginAdmin = $formulario;
    }
    
       
    public function  logoutAction(){
        Zend_Auth::getInstance()->clearIdentity();
        $this->_redirect('/');
    }
}

?>
