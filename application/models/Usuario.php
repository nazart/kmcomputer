<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Usuario
 *
 * @author Laptop
 */
class Application_Model_Usuario {
    //put your code here
    private $_modelUsuario;
    function __construct() {
        $this->_modelUsuario = new Application_Model_TableBase_Usuario();
    }
    public function crearUsuario($data){
        $this->_modelUsuario->insert($data);
        return $this->_modelUsuario->getAdapter()->lastInsertId();
    }
    public function obtenerPasswordUsuario($nameUsuario){
        return $this->_modelUsuario
                ->getAdapter()
                ->fetchOne(
                        $this->_modelUsuario
                        ->select()
                        ->from($this->_modelUsuario->getName(),
                                'Password')
                        ->where('Login =?',$nameUsuario)
                        );
        
    }
    
}

?>
