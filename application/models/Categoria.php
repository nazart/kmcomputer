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
class Application_Model_Categoria {

    //put your code here
    private $_modelCategoria;

    function __construct() {
        $this->_modelCategoria = new Application_Model_TableBase_Categoria();
    }

    function listarCategoriasActivas() {
        return $this->_modelCategoria
                                ->getAdapter()
                                ->select()
                                ->from(array('cat' => $this->_modelCategoria->getName()), array('cat.IdCategoria',
                                    'cat.Nombre',
                                    'cat.IdPadre',
                                    'cat.Slug',
                                        )
                                )
                                ->where('cat.Estado = 1')
                                ->order('IdPadre')
                ->query()->fetchAll()
                                ;
    }
    
    
}

?>
