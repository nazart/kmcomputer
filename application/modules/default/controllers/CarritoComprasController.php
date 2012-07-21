<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of CarritoComprasController
 *
 * @author Laptop
 */
class Default_CarritoComprasController extends CST_Controller_ActionDefault {

    //put your code here
    public function init() {
        parent::init();
        /* Initialize action controller here */
    }

    public function indexAction() {
        $this->view->listaCarrito = $this->_session->carritoCompras;
    }

    public function medioPagoAction() {
        
    }

    public function registrarProductoAction() {
        $producto = new Application_Entity_Producto();
        if ($this->_request->isPost()) {
            if (!isset($this->_session->carritoCompras)) {
                $this->_session->carritoCompras = array();
            }
            $indice = count($this->_session->carritoCompras) + 1;
            $indiceEncontrado = '';
            if (!empty($this->_session->carritoCompras)) {
                foreach ($this->_session->carritoCompras as $index => $value) {
                    if ($value['Slug'] == $this->_getParam('slugProducto')) {
                        $indiceEncontrado = $index;
                        break;
                    }
                }
            }
            if ($indiceEncontrado == '') {
                $this->_session->carritoCompras[$indice] = $producto->listarProducto('', '', $this->_getParam('slugProducto'));
                $this->_session->carritoCompras[$indice]['cantidad'] = $this->_getParam('cantidad');
            } else {
                $this->_session->carritoCompras[$indiceEncontrado]['cantidad'] = $this->_getParam('cantidad') + $this->_session->carritoCompras[$indiceEncontrado]['cantidad'];
            }
        }

        $this->_redirect('carrito-compras');
    }

    function eliminarProductoAction() {
        unset($this->_session->carritoCompras[$this->_getParam('indice')]);
        $this->_redirect('carrito-compras');
    }
    function aumentarProductoAction(){
        $indice = $this->_getParam('indice');
        $this->_session->carritoCompras[$indice]['cantidad'] = 1 + $this->_session->carritoCompras[$indice]['cantidad'];
        $this->_redirect('carrito-compras');
        
    }
    function disminuirProductoAction(){
        $indice = $this->_getParam('indice');
        $this->_session->carritoCompras[$indice]['cantidad'] = $this->_session->carritoCompras[$indice]['cantidad'] - 1;
        if($this->_session->carritoCompras[$indice]['cantidad']==0){
                $this->_redirect('carrito-compras/eliminar-producto/indice/'.$indice);
        }
        $this->_redirect('carrito-compras');
    }

}

?>
