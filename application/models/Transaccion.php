<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Categoria
 *
 * @author Laptop
 */
class Application_Model_Transaccion {

    //put your code here
    private $_tableTransaccion;
    private $_tableDetalleTransaccion;

    function __construct() {
        $this->_tableTransaccion = new Application_Model_TableBase_Transaccion();
        $this->_tableDetalleTransaccion = new Application_Model_TableBase_DetalleTransaccion();
    }

    function insert($data) {
        if($this->_tableTransaccion->insert($data)){
            return $this->_tableTransaccion->getAdapter()->lastInsertId();
        }
    }
    function insertDetalleTransaccion($data){
        return $this->_tableDetalleTransaccion->insert($data);
    }
    
    function getTransaccion($idTransaccion){
        return $this->_tableTransaccion->select()
                ->where('IdTransaccion =?', $idTransaccion)
                ->query()
                ->fetch();
    }
    function getDetalleTransaccion($idTransaccion){
        return $this->_tableDetalleTransaccion->select()
                ->where('IdTransaccion =?', $idTransaccion)
                ->query()
                ->fetchAll();
    }

    function update($data, $idTransaccion) {
        $where = $this->_tableTransaccion->getAdapter()->quoteInto('IdTransaccion=?', $idTransaccion);
        return $this->_tableTransaccion->update($data, $where);
    }

}

?>
