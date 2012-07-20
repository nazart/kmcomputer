<?php

class Default_IndexController extends CST_Controller_ActionDefault
{

    public function init()
    {
        /* Initialize action controller here */
    }

    public function indexAction()
    {
        $entityProducto = new Application_Entity_Producto();
        print_r($entityProducto->listarProductosActivos());
    }


}