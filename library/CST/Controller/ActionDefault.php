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
    public $_identity;

    public function init() {
        parent::init();
        $this->_identity = Zend_Auth::getInstance()->getIdentity();
        $this->view->identity = $this->_identity;

        if (!isset($this->_identity) && empty($this->_identity)) {
            $formLogin = new Application_Form_FormularioLogin();
            $formLogin->removeDecorators();
            $formLogin->customDecoratorFile("/form-custom/_formLoginHeader.phtml");
            $this->view->formLoginHeader = $formLogin;
        } else {
            $string = '<div>Nombre : </div>';
            $string .= '<div>' . $this->_identity->NombreUsuario . '</div>';
            $string .= '<div>Correo : </div>';
            $string .= '<div>' . $this->_identity->Correo . '</div>';
            $string .= '<div><a href="/login/salir">Salir</a></div>';
            $this->view->formLoginHeader = $string;
        }


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

    function autentificateUser($usuario, $password) {
        $entityUsuario = new Application_Entity_Usuario();

        $auth = Zend_Auth::getInstance();
        $adapter = new Zend_Auth_Adapter_DbTable(Zend_Registry::get('db'),
                        'usuario',
                        'Login',
                        'Password');
        $adapter->setIdentity($usuario);
        $usuarioModel = new Application_Model_Usuario();
        $contrasenia = $usuarioModel->obtenerPasswordUsuario($usuario);
        $valueSegurity = $entityUsuario->obtenerValorSeguridadContrasenia($contrasenia);
        $password = $valueSegurity . $entityUsuario->setearContrasenia(
                        $entityUsuario->encriptaContrasenia($password));
        $adapter->setCredential($password);
        $result = $auth->authenticate($adapter);
        if ($result->isValid()) {
            $data = $adapter->getResultRowObject(null, 'Password');
            $auth->getStorage()->write($data);
            return TRUE;
        } else {
            return FALSE;
        }
    }

    //put your code here
}