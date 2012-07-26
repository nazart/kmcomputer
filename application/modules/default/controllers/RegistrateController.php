<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of RegistrateController
 *
 * @author Laptop
 */
class Default_RegistrateController extends CST_Controller_ActionDefault {

    public function init() {
        parent::init();
        /* Initialize action controller here */
    }

    public function indexAction() {
        $formularioRegistro = new Application_Form_FormularioRegistro();
        if($this->_request->isPost()){
            if($formularioRegistro->isValid($this->_getAllParams())){
                echo 'registrar';
            }
        }
        
        
        $this->view->formularioRegistro = $formularioRegistro;
        
    }

    //put your code here
}

?>
