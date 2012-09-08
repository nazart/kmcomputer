<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of productos
 *
 * @author Laptop
 */
class Default_ProductosController extends CST_Controller_ActionDefault {

    public function init() {
        parent::init();
        /* Initialize action controller here */
    }

    public function indexAction() {
        $this->view->productos = $this->listarProductos();
        $this->view->classBody=' catalog-category-view categorypath-servers-html category-servers';
    }

    public function detalleProductoAction() {
        $productos = new Application_Entity_Producto();
        $this->view->detalleProducto = $productos->listarProducto('','',  $this->_getParam('slugProducto'));
        $this->view->productosRelacionados = $productos->listarProductosRelacionados($this->view->detalleProducto['IdProducto']);
        
    }

    public function productosCategoriasAction() {
        $this->view->productos = $this->listarProductos($this->_getParam('categoria'));
        $this->view->slugCategoria = $this->_getParam('categoria');
    }

    public function productosSubCategoriasAction() {
        $this->view->productos = $this->listarProductos($this->_getParam('subcategoria'));
        $this->view->slugSubCategoria = $this->_getParam('subcategoria');
        $this->view->slugCategoria = $this->_getParam('categoria');
    }

    private function listarProductos($slugCategoria='') {
        $productos = new Application_Entity_Producto();
        if($slugCategoria==''){
        $result = $productos->listarTodosLosProductos();
        }else{
            $result = $productos->listarProductosDeUnaCategoria($slugCategoria);
        }
        $paginator = Zend_Paginator::factory($result);
        $paginator->setCurrentPageNumber($this->_getParam('page'));
        $paginator->setItemCountPerPage(6);
        return $paginator;
    }

}

?>
