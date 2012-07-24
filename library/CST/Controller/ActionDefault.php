<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of ActionDefault
 *
 * @author Laptop
 */
class CST_Controller_ActionDefault extends CST_Controller_Action {

    public $_listaCategoriasNavigator;

    public function init() {
        parent::init();
        $categoria = new Application_Entity_Transaccion();
        $listaCategorias = $categoria->listarArbolCategorias();

        $configNavigationArray = array(
            'home' => array('label' => 'Inicio', 'uri' => '/', 'orden' => '1'),
            'productos' => array('label' => 'Productos', 'uri' => '/productos', 'orden' => '2'),
            'registrate' => array('label' => 'Registrate', 'uri' => '/registrate', 'orden' => '3'),
            'contactenos' => array('label' => 'Contactenos', 'uri' => '/contactenos', 'orden' => '4'),
        );
        if (!$listaCategorias)
            $listaCategorias = array();

        $configNavigationArray['productos']['pages'] = $listaCategorias;
        $this->view->listaCategoriasNavigator = $listaCategorias;
        $navigation = new Zend_Navigation($configNavigationArray);
        $this->view->navigation($navigation);
        $uri = $this->getRequest()->getPathInfo();
        $position = strpos($uri, '/page');
        if ($position > 0)
            $uri = substr($uri, 0, $position);
        $this->view->getPathInfo = $uri;
        $activeNavi = $this->view->navigation()->findByUri($uri);
        $activeNavi->active = true;
    }

    //put your code here
}