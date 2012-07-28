<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of adapterCustom
 *
 * @author Laptop
 */
class CTS_Auth_Adapter_AdapterCustom extends Zend_Auth_Adapter_DbTable {

    //put your code here
    public function __construct(Zend_Db_Adapter_Abstract $zendDb = null, $tableName = null, $identityColumn = null,
                                $credentialColumn = null, $credentialTreatment = null)
    {  
        parent::__construct($zendDb, $tableName, $identityColumn, $credentialColumn, $credentialTreatment);
    }
    public function authenticate(Zend_Auth_Adapter_Interface $adapter) {
        $usuarioModel = new Application_Model_Usuario();
        $contrasenia = $usuarioModel->obtenerPasswordUsuario($usuario);
        $entityUsuario = new Application_Entity_Usuario();
        $credencial = $entityUsuario->setearContrasenia($contrasenia);
        parent::setCredential($credential);
    }
    

}

?>
