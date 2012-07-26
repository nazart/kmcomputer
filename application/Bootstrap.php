<?php

class Bootstrap extends Zend_Application_Bootstrap_Bootstrap {

    public function __construct($app) {
        parent::__construct($app);
        date_default_timezone_set('America/Lima');
        $this->bootstrap('multidb'); /* ejecuta un recurso */
        $db = $this->getPluginResource('multidb')/* obtiene el recurso multidb */
                ->getDb('db'); /* obtiene los datos del recurso */
        Zend_Db_Table::setDefaultAdapter($db); /* registra el adaptador */
        Zend_Registry::set('db', $db); /*registra la clase adaptadora*/ 
        $this->getResourceLoader()->addResourceType('entity', 'entitys/', 'Entity');
        $this->getResourceLoader()->addResourceType('service', 'services/', 'Service');
        $response = new Zend_Controller_Response_Http();
        $response->setHeader('Content-Type', 'text/html; charset=utf-8')
                ->setHeader('Accept-Encoding', 'gzip, deflate')
                ->setHeader('Expires', 'max-age=' . 20, true)
                ->setHeader('Cache-Control', 'private', 'must-revalidate')
                ->setHeader('Pragma', 'no-cache', true);
        $response->sendResponse();
    }

}

