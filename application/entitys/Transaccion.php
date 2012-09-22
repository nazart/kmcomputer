<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Transaccion
 *
 * @author Laptop
 */
class Application_Entity_Transaccion extends CST_Entity{

    public $_idTransaccion;
    public $_fechaRegistroTransaccion;
    public $_fechaPagoTransaccion;
    public $_estadoTransaccion;
    public $_precioTransaccion;
    public $_idUsuario;
    public $_tramaEnvioTransaccion;
    public $_tipoPagoTransaccion;
    public $_tramaRespuesta;
    public $_cipTransaccion;
    public $_payReceiverId;
    public $_payIpnTrackId;
    public $_payReceiverEmail;
    public $_payPaymentType;
    public $_payTxnId;
    public $_payVerifySign;
    public $_payAddressStatus;
    public $_payPayerEmail;
    protected $_modelTransaccion;

    function __construct() {
        $this->_modelTransaccion = new Application_Model_Transaccion();
    }

    function getDetalleTransaccion() {
        return $this->_modelTransaccion
                ->getDetalleTransaccion($this->_idTransaccion);
    }

    function addDetalleTransaccion($idProducto) {
        $producto = new Application_Entity_Producto();
        if (!$producto->identifiProducto($idProducto)) {
            return false;
        }
        $data['IdProducto'] = $producto->_idProducto;
        $data['PrecioProducto'] = $producto->_precioVenta;
        $data['PrecioOferta'] = $producto->_precioOferta;
        return $this->_modelTransaccion->insertDetalleTransaccion($data);
    }

    function addMultipleDetalleTransaccion($arrayProducto) {
        foreach ($arrayProducto as $index) {
            $idDetalle = $this->addDetalleTransaccion($index);
            if ($idDetalle != FALSE) {
                $arrayIdDetalle[] = $idDetalle;
            }
        }
        return $arrayIdDetalle;
    }

    function identifiTransaccion($idTransaccion) {
        $data = $this->_modelTransaccion->getTransaccion($idTransaccion);
        $this->_idTransaccion = $data['IdTransaccion'];
        $this->_fechaRegistroTransaccion = $data['FechaRegistroTransaccion'];
        $this->_fechaPagoTransaccion = $data['FechaPagoTransaccion'];
        $this->_estadoTransaccion = $data['EstadoTransaccion'];
        $this->_precioTransaccion = $data['PrecioTransaccion'];
        $this->_idUsuario = $data['IdUsuario'];
        $this->_tramaEnvioTransaccion = $data['TramaEnvioTransaccion'];
        $this->_tipoPagoTransaccion = $data['TipoPagoTransaccion'];
        $this->_tramaRespuesta = $data['TramaRespuesta'];
        $this->_cipTransaccion = $data['CipTransaccion'];
        $this->_payReceiverId = $data['CipTransaccion'];
        $this->_payIpnTrackId = $data['PayIpnTrackId'];
        $this->_payReceiverEmail = $data['PayReceiverEmail'];
        $this->_payPaymentType = $data['PayPaymentType'];
        $this->_payTxnId = $data['PayTxnId'];
        $this->_payVerifySign = $data['PayVerifySign'];
        $this->_payAddressStatus = $data['PayAddressStatus'];
        $this->_payPayerEmail = $data['PayPayerEmail'];
    }
    
    function setData(){
        $data['IdTransaccion'] = $this->_idTransaccion;
        $data['FechaRegistroTransaccion'] = $this->_fechaRegistroTransaccion;
        $data['EstadoTransaccion'] = $this->_estadoTransaccion;
        $data['PrecioTransaccion'] = $this->_precioTransaccion;
        $data['IdUsuario'] = $this->_idUsuario;
        $data['TramaEnvioTransaccion'] = $this->_tramaEnvioTransaccion;
        $data['TipoPagoTransaccion'] = $this->_tipoPagoTransaccion;
        $data['TramaRespuesta'] = $this->_tramaRespuesta;
        $data['CipTransaccion'] = $this->_cipTransaccion;
        $data['CipTransaccion'] = $this->_payReceiverId;
        $data['PayIpnTrackId'] = $this->_payIpnTrackId;
        $data['PayReceiverEmail'] = $this->_payReceiverEmail;
        $data['PayPaymentType'] = $this->_payPaymentType;
        $data['PayTxnId'] = $this->_payTxnId;
        $data['PayVerifySign'] = $this->_payVerifySign;
        $data['PayAddressStatus'] = $this->_payAddressStatus;
        $data['PayPayerEmail'] = $this->_payPayerEmail;
        $data['FechaPagoTransaccion'] = $this->_fechaPagoTransaccion;
        foreach($data as $index => $value) {
            if($data == '') {
                unset($data[$index]);
            }
        }
        return $data;
    }
    /**estado transaccion:
     * 1->creado
     * 2->cancelado
     * 3->eliminado
     */
    function createTransaccion(){
        $this->_estadoTransaccion = 1;
        $this->_fechaRegistroTransaccion = date('Y-m-d H:i:s');
        $data = $this->setData();
        return $this->_idTransaccion = $this->_modelTransaccion->insert($data);
    }
    function cancelarTransaccion($trama){
        $this->_tramaRespuesta = $trama;
        $this->_fechaPagoTransaccion = date('Y-m-d H:i:s');
        $this->_estadoTransaccion = 2;
        $this->_ = date('Y-m-d H:i:s');
        $data = $this->setData();
        return $this->_modelTransaccion->update($data, $this->_idTransaccion);
    }
    
}

?>
