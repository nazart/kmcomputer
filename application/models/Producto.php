<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Producto
 *
 * @author Laptop
 */
class Application_Model_Producto {
    //put your code here
    private $_modelProducto;
    function __construct() {
        $this->_modelProducto = new Application_Model_TableBase_Producto();
    }
    function listarProductos(){
        return $this->_modelProducto->select()->query()->fetchAll();
    }
}

?>
