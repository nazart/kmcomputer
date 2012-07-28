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
    }

    public function indexAction() {
        $formularioRegistro = new Application_Form_FormularioRegistro();
        $params = $this->_getAllParams();
        $entityUsuario = new Application_Entity_Usuario();
        
        if($this->_request->isPost()){
            if($formularioRegistro->isValid($params)){
                $data['_correo'] = $params['Correo'];
                $data['_password'] = $params['Password'];
                $data['_nombreUsuario'] = $params['Nombres'];
                $data['_apellidosUsuario'] = $params['Apellidos'];
                $data['_genero'] = $params['Genero'];
                $entityUsuario->setProperties($data);
                $entityUsuario->crearUsuario();
                
            }
        }
        $this->view->formularioRegistro = $formularioRegistro;
        
    }

    //put your code here
}

?>
