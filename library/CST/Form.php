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
    function removeDecorators(){
        $elementos = $this->getElements();
        foreach($elementos as $index){
            $index->removeDecorator('label');
        }
    }
    


    //put your code here
}

?>
