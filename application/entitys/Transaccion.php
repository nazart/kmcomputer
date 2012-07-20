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
class Application_Entity_Transaccion {

    protected $_modelCategoria;

    function __construct() {
        $this->_modelCategoria = new Application_Model_Categoria();
    }

    function listarArbolCategorias() {
        $resultCategorias = $this->_modelCategoria->listarCategoriasActivas();
        return $this->ordenarArbol($resultCategorias);
    }

    private function ordenarArbol($arrayCategoria) {
        $padres = array();
        $count = 0;
        foreach ($arrayCategoria as $index => $value) {
            if ($value['IdPadre'] == '') {
                $padres[$count] = $value; 
                $padresNavigator[$count]['label'] = $value['Nombre'];
                $padresNavigator[$count]['uri'] = '/productos/'.$value['Slug'];
                unset($arrayCategoria[$index]);
            }
            $count++;
        }
        
        foreach ($padres as $index => $value) {
            $padresNavigator[$index]['pages'] = $this->encontrarHijos(
                    $value['IdCategoria'], 
                    $arrayCategoria,
                    $value['Slug']);
        }
        return $padresNavigator;
    }

    private function encontrarHijos($padre, $arrayDatos,$slugPadre) {
        $arrayHijo = array();
        $count =0;
        foreach ($arrayDatos as $index => $value) {
            if ($padre == $value['IdPadre']) {
                $arrayHijo[$count]['label'] = $value['Nombre'];
                $arrayHijo[$count]['uri'] = '/productos/'.$slugPadre.'/'.$value['Slug'];
            }
            $count++;
        }
        return $arrayHijo;
    }
    

}

?>
