<?php

class Application_Form_FormularioRegistro extends CST_Form {

    //put your code here
    public function init() {
        parent::init();

        $validators = array(
            new Zend_Validate_Db_NoRecordExists(array('table'=>'usuario','field'=>'Correo')),
            new Zend_Validate_EmailAddress()
        );
        
        $this->addElement(new Zend_Form_Element_Text('Correo',
                        array('required' => true, 'label' => 'Correo Electronico:',
                            'validators'=>$validators)));
        $this->addElement(new Zend_Form_Element_Password('Password',
                        array('required' => true, 'label' => 'Contraseña:')));
        $validatorIdentical = new Zend_Validate_Identical();
        $this->addElement(new Zend_Form_Element_Password('PasswordConfirm',
                        array('required' => true, 'label' => 'Repite tu contraseña:',
                            'validators' => array($validatorIdentical)
                )));
        $this->addElement(new Zend_Form_Element_Text('Nombres',
                        array('required' => true, 'label' => 'Nombres:')));
        $this->addElement(new Zend_Form_Element_Text('Apellidos',
                        array('required' => true, 'label' => 'Apellidos:')));
        $option = array('' => '-------', 'F' => 'Femenino', 'M' => 'Masculino');
        $this->addElement(new Zend_Form_Element_Text('Telefono',
                        array('required' => true, 'label' => 'Telefono:')));
        $this->addElement(new Zend_Form_Element_Select('Genero',
                        array('required' => true, 'multiOptions' => $option,
                            'label' => 'Genero:')));
        $captcha = new Zend_Form_Element_Captcha('captcha', array(
                    'name' => 'captcha',
                    'label' => 'Codigo de Verficacion',
                    'captcha' => array(
                        'captcha' => 'Image',
                        'wordLen' => 6,
                        'timeout' => 300,
                        'font' => APPLICATION_PATH . "/../var/fonts/FreeMonoBold.ttf",
                        'imgurl' => '/imagenCaptcha',
                        'imgDir' => APPLICATION_PATH . '/../public_html/imagenCaptcha/',
                        )));
        $this->addElement($captcha);
        $this->addElement(new Zend_Form_Element_Submit('enviar',
                        array('label' => 'Crear mi cuenta')));

        $this->setAction('/registrate');
        $this->setMethod('Post');
    }

    public function isValid($data) {
        $passwordConfirm = $this->getElement('PasswordConfirm');
        $validator = $passwordConfirm->getValidator('Identical')
                        ->setToken($data['Password'])
                ->setMessage('Debe ser igual a la contraseña ingresada', 
                        'notSame');
        return parent::isValid($data);
    }

}

?>
