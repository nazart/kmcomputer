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
    function listarProductosActivos(){
        $productos = new Application_Model_Producto();
        return $productos->listarProductos();
    }
    function insertarProductos(){
        
    }
    function listarPorductosDestacados(){
        
    }
    function listarOfertasRecientes(){
        
    }
    function listarProducto($idProducto,$estado) {
        
    }
}


?>
