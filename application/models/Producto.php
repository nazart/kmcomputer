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
    private $_modelDetalleSlug;

    function __construct() {
        $this->_modelProducto = new Application_Model_TableBase_Producto();
        $this->_modelDetalleSlug = new Application_Model_TableBase_DetalleSlug();
        $this->_modelSlug = new Application_Model_TableBase_Slug();
    }

    function listarProductos() {
        return $this->_modelProducto->select()->query()->fetchAll();
    }

    function buscarProductos($arraySlug='') {


        $result = $this->_modelProducto->getAdapter()
                ->select()
                ->distinct()
                ->from(array('pr' => $this->_modelProducto->getName()), array(
                    'pr.IdProducto',
                    'pr.IdCategoria',
                    'pr.Codigo',
                    'pr.Nombre',
                    'pr.Imagen',
                    'pr.Descripcion',
                    'pr.PrecioVenta',
                    'pr.FlagOferta',
                    'pr.PrecioOferta',
                    'pr.PrecioCompra',
                    'pr.Slug',
                    'pr.Cantidad',
                    'pr.StockMin')
                )
                ->join(array('dts' => $this->_modelDetalleSlug->getName()), 'pr.IdProducto = dts.IdProducto', '')
                ->join(array('sl' => $this->_modelSlug->getName()), 'sl.IdSlug = dts.IdSlug', '');
        if ($arraySlug != '') {
            $result->where('sl.NombreSlug REGEXP ?', array($arraySlug));
        }

        return $result;
    }

}

?>
