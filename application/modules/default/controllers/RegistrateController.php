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
        Zend_Layout::getMvcInstance()->setLayout('layout-simple');
    }

    public function indexAction() {
        $formularioRegistro = new Application_Form_FormularioRegistro();
        $params = $this->_getAllParams();
        $entityUsuario = new Application_Entity_Usuario();

        if ($this->_request->isPost()) {
            if ($formularioRegistro->isValid($params)) {
                try {
                    $data['_correo'] = $params['Correo'];
                    $data['_password'] = $params['Password'];
                    $data['_nombreUsuario'] = $params['Nombres'];
                    $data['_apellidosUsuario'] = $params['Apellidos'];
                    $data['_genero'] = $params['Genero'];
                    $data['_telefono'] = $params['Telefono'];
                    $data['_estado'] = 1;
                    $entityUsuario->setProperties($data);
                    if ($entityUsuario->crearUsuario()) {
                        if($this->autentificateUser($params['Correo'], $params['Password'])){
                             $this->_redirect('/');
                        }
                    }else{
                        echo 'problemas de registro';
                    }
                } catch (Exception $exc) {
                    echo $exc->getTraceAsString();
                }
            }
        }
        $this->view->formularioRegistro = $formularioRegistro;
    }

    //put your code here
}

?>
