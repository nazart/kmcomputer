<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Form
 *
 * @author Laptop
 */
class CST_Form extends Zend_Form
{
    function init() {
        parent::init();
        
    }
    function customDecoratorFile($file){
        $this->setDecorators(array(array('ViewScript',array('viewScript'=>$file))));
    }
    


    //put your code here
}

?>
