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
class Application_Entity_Usuario extends CST_Entity{

    /*entidades publicas */
    public $_nombreUsuario;
    public $_apellidosUsuario;
    public $_estado;
    public $_genero;
    public $_login;
    public $_password;
    public $_telefono;
    public $_correo;
    public $_dni;
    public $_direccion;
    
    /*entidades privadas*/
    private $_modelUsuario;

    function __construct($dataUsuario = null) {
       parent::init($dataUsuario);
       $this->_modelUsuario = new Application_Model_Usuario();
    }
    
    function crearUsuario($dataInput) {
        $model = $this->_modelUsuario;
        $data['NombreUsuario'] = $this->_nombreUsuario;
        $data['ApellidosUsuario'] = $this->_apellidosUsuario;
        $data['Estado'] = $this->_estado;
        $data['Login'] = $this->_login;
        $data['Password'] = $dataInput[''];
        $data['Telefono'] = $dataInput[''];
        $data['Correo'] = $dataInput[''];
        $data['Direccion'] = $dataInput[''];
        $model->crearUsuario($data);
    }
    function encriptaContrasenia($value){
        $valueHash = hash('md5', $value);
        $value = rand(1, 1000).'$$'.rand(1, 1000).'$$'.$valueHash;
        return $value;
    }
    function setearContrasenia($value){
        return substr(strrchr($value,'$$'),1);
    }
    function obtenerValorSeguridadContrasenia($value){
        return substr($value,0,strrpos($value, '$$')).'$$';
    }
}

?>
