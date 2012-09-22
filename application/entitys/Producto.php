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

    public $_idProducto;
    public $_idCategoria;
    public $_idCombo;
    public $_idUnidad;
    public $_codigo;
    public $_nombre;
    public $_descripcion;
    public $_precioVenta;
    public $_precioCompra;
    public $_cantidad;
    public $_stockMin;
    public $_peso;
    public $_ubicacion;
    public $_fla;
    public $_imagen;
    public $_slug;
    public $_slugBusqeuda;
    public $_idSubcategoria;
    public $_flagPortada;
    public $_flagOferta;
    public $_precioOferta;
    public $_detalle;
    protected $_modelProducto;

    function __construct() {
        $this->_modelProducto = new Application_Model_Producto();
    }

    function listarProductosActivos() {
        return $this->_modelProducto->listarProductos();
    }

    function identifiProducto($idProducto) {
        $data = $this->_modelProducto->getProducto($idProducto);
        if ($data != false) {
            $this->_idProducto = $data['IdProducto'];
            $this->_idCategoria = $data['IdCategoria'];
            $this->_idCombo = $data['IdCombo'];
            $this->_idUnidad = $data['IdUnidad'];
            $this->_codigo = $data['Codigo'];
            $this->_nombre = $data['Nombre'];
            $this->_descripcion = $data['Descripcion'];
            $this->_precioVenta = $data['PrecioVenta'];
            $this->_precioCompra = $data['PrecioCompra'];
            $this->_cantidad = $data['Cantidad'];
            $this->_stockMin = $data['StockMin'];
            $this->_peso = $data['Peso'];
            $this->_ubicacion = $data['Ubicacion'];
            $this->_fla = $data['Fla'];
            $this->_imagen = $data['Imagen'];
            $this->_slug = $data['Slug'];
            $this->_slugBusqeuda = $data['SlugBusqeuda'];
            $this->_idSubcategoria = $data['IdSubcategoria'];
            $this->_flagPortada = $data['FlagPortada'];
            $this->_flagOferta = $data['FlagOferta'];
            $this->_precioOferta = $data['PrecioOferta'];
            $this->_detalle = $data['Detalle'];
            return true;
        } else {
            return false;
        }
    }

    function insertarProductos() {
        
    }

    function listarPorductosDestacados() {
        return $this->_modelProducto->listarProductosDestacados();
    }

    function buscarProductos($slugBusqueda = '') {
        $productos = $this->_modelProducto->buscarProductos($slugBusqueda);
        return $productos;
    }

    function listarOfertasRecientes() {
        return $this->_modelProducto->listarOfertaReciente();
    }

    function listarOfertasRecientesAleatorio() {
        return $this->_modelProducto->listarOfertaRecienteRandon();
    }

    function listarProducto($idProducto='', $estado='', $slug='') {
        $result = $this->_modelProducto->listarDetalleProductoActivoPorSlug($slug);
        return $result;
    }

    function listarProductosDeUnaCategoria($slugCategoria) {
        return $this->_modelProducto->listarProductosDeUnaCategoria($slugCategoria);
    }

    function listarTodosLosProductos() {
        return $this->_modelProducto->listarProductosDeUnaCategoria();
    }

    function listarProductosRelacionados($idProductos) {
        return $this->_modelProducto->listarProductosRelacionados($idProductos);
    }

}

?>
