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
    protected $_modelProducto;
    function __construct() {
        $this->_modelProducto = new Application_Model_Producto();
    }
    function listarProductosActivos() {
        return $this->_modelProducto->listarProductos();
    }

    function insertarProductos() {
        
    }

    function listarPorductosDestacados() {
        
    }

    function buscarProductos($slugBusqueda = '') {
        $productos = $this->_modelProducto->buscarProductos($slugBusqueda);
        return $productos;
    }

    function listarOfertasRecientes() {
        
    }
    function listarProducto($idProducto='', $estado='',$slug='') {
        $result = $this->_modelProducto->listarDetalleProductoActivoPorSlug($slug);
        return $result;
    }
    function listarProductosDeUnaCategoria($slugCategoria){
        return $this->_modelProducto->listarProductosDeUnaCategoria($slugCategoria);
    }
    function listarProductosRelacionados($idProductos){
        return $this->_modelProducto->listarProductosRelacionados($idProductos);
    }

}

?>
