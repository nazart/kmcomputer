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
        
        //$this->view->MenuIzquierda = $this->view->navigation($resultNavigationCategorias)->menu();
    }


}