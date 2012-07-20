<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of producto
 *
 * @author Laptop
 */
class Application_Entity_Producto {

    //put your code here
    protected $_modelPorducto;
    function __construct() {
        $this->_modelPorducto = new Application_Model_Producto();
    }
    function listarProductosActivos() {
        return $this->_modelPorducto->listarProductos();
    }

    function insertarProductos() {
        
    }

    function listarPorductosDestacados() {
        
    }

    function buscarProductos($slugBusqueda = '') {
        $productos = $this->_modelPorducto->buscarProductos($slugBusqueda);
        return $productos;
    }

    function listarOfertasRecientes() {
        
    }

    function listarProducto($idProducto, $estado) {
        
    }

}

?>
