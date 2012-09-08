<?php

class Default_IndexController extends CST_Controller_ActionDefault
{

    public function init()
    {
        parent::init();
        /* Initialize action controller here */
    }

    public function indexAction()
    {
        $resultNavigationCategorias = new Zend_Navigation($this->_listaCategoriasNavigator);
        $this->view->classBody=' cms-index-index cms-home';
        $productos = new Application_Entity_Producto();
        $this->view->productosDestacados = $productos->listarPorductosDestacados();
        //$this->view->MenuIzquierda = $this->view->navigation($resultNavigationCategorias)->menu();
    }


}