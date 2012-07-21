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
    private $_modelCategoria;
    private $_modelRelacionProductos;
    function __construct() {
        $this->_modelProducto = new Application_Model_TableBase_Producto();
        $this->_modelDetalleSlug = new Application_Model_TableBase_DetalleSlug();
        $this->_modelSlug = new Application_Model_TableBase_Slug();
        $this->_modelCategoria = new Application_Model_TableBase_Categoria();
        $this->_modelRelacionProductos = new Application_Model_TableBase_RelacionProductos();
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

    public function listarProductosDeUnaCategoria($slugCategoria='') {
        $arrayCampos = array(
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
            'pr.StockMin');
        if ($slugCategoria != '') {
            $return = $this->_modelProducto->getAdapter()
                    ->select()->from(array('pr' => $this->_modelProducto->getName()), $arrayCampos)
                    ->join(array('cat' => $this->_modelCategoria->getName()), 'cat.IdCategoria=pr.IdCategoria or cat.IdCategoria=pr.IdSubcategoria', '')
                    ->where('cat.Slug=?', $slugCategoria)
                    ->where('pr.fla = ? ', '1');
        } else {
            $return = $this->_modelProducto->getAdapter()
                    ->select()->from(array('pr' => $this->_modelProducto->getAdapter()), $arrayCampos)
                    ->where('pr.fla = ? ', '1');
        }
        return $return;
    }

    function listarDetalleProductoActivoPorSlug($SlugProducto) {
         $arrayCampos = array(
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
            'pr.StockMin');
        return $this->_modelProducto->getAdapter()
                ->select()
                ->from(array('pr' => $this->_modelProducto->getName()), $arrayCampos)
                ->where('pr.Slug =?', $SlugProducto)
            ->query()->fetch();
    }
    
    public function listarProductosRelacionados($idProducto){
        return $this->_modelProducto
                ->getAdapter()
                ->select()
                ->from(array('rp'=>$this->_modelRelacionProductos->getName()),array(
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
            'pr.StockMin'))
                ->join(array('pr'=>$this->_modelProducto->getName()),
                        'rp.IdProductoRelacionado = pr.IdProducto')
                ->where('rp.idProducto =?',$idProducto)
                ->where('pr.fla=?',1)
                ->query()
                ->fetchAll();
    }

}

?>
