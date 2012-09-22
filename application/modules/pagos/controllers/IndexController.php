<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of BuscarController
 *
 * @author Laptop
 */
class Pagos_IndexController extends CST_Controller_ActionPagos {

    public function init() {
        parent::init();
        /* Initialize action controller here */
    }

    public function indexAction() {
        try {
            $this->_helper->layout()->disableLayout();
            $this->_helper->viewRenderer->setNoRender();
            $listener = new CST_IpnListener();
            $fc = Zend_Controller_Front::getInstance();
            $paypalConf = $fc->getParam('bootstrap')->getOption('paypal');
            $paramConfig = $fc->getParam('bootstrap')->getOption('paramConfig');
            $listener->use_sandbox = $paypalConf['useSandbox'];
            try {
                $listener->requirePostMethod();
                $verified = $listener->processIpn();
            } catch (Exception $e) {
                CST_Log::info($e->__toString());
                $this->sendMailAdmin($e->__toString(), $paramConfig['correoContacto'], 'Error Pago');
            }
            CST_Log::info('leido');
            if ($verified) {
                $idTransaccion = $listener->getPostData('item_number');
                $transaccion = new Application_Entity_Transaccion();
                $transaccion->identifiqueTransaccion($idTransaccion);
                $dataTransaccion['_payReceiverId'] = $listener->getPostData('item_number');
                $dataTransaccion['_payIpnTrackId'] = $listener->getPostData('ipn_track_id');
                $dataTransaccion['_payReceiverEmail'] = $listener->getPostData('receiver_email');
                $dataTransaccion['_payPaymentType'] = $listener->getPostData('payment_type');
                $dataTransaccion['_payTxnId'] = $listener->getPostData('txn_id');
                $dataTransaccion['_payVerifySign'] = $listener->getPostData('verify_sign');
                $dataTransaccion['_payAddressStatus'] = $listener->getPostData('address_status');
                $dataTransaccion['_payPayerEmail'] = $listener->getPostData('payer_email');
                $transaccion->setProperties($dataTransaccion);
                if ($idTransaccion == $transaccion->_idTransaccion && 
                        $transaccion->_precioTransaccion = $listener->getPostData('payment_gross')) {
                    $transaccion->cancelarTransaccion($listener->getTextReport());
                } else {
                    $datosComparados = '<table>';
                    $datosComparados .= '<tr>';
                    $datosComparados .= '<td>';
                    $datosComparados .= ' ';
                    $datosComparados .= '</td>';
                    $datosComparados .= '<td>';
                    $datosComparados .= 'transaccion';
                    $datosComparados .= '</td>';
                    $datosComparados .= '<td>';
                    $datosComparados .= 'pakete';
                    $datosComparados .= '</td>';
                    $datosComparados .= '<td>';
                    $datosComparados .= 'precio';
                    $datosComparados .= '</td>';
                    $datosComparados .= '</tr>';

                    $datosComparados .= '<tr>';
                    $datosComparados .= '<td>';
                    $datosComparados .= 'datos enviados';
                    $datosComparados .= '</td>';
                    $datosComparados .= '<td>';
                    $datosComparados .= $transaccion->_idTransaccion;
                    $datosComparados .= '</td>';
                    $datosComparados .= '<td>';
                    $datosComparados .= $transaccion->_idPackageSingle;
                    $datosComparados .= '</td>';
                    $datosComparados .= '<td>';
                    $datosComparados .= $transaccion->_price;
                    $datosComparados .= '</td>';
                    $datosComparados .= '</tr>';

                    $datosComparados .= '<tr>';
                    $datosComparados .= '<td>';
                    $datosComparados .= 'datos recibidos';
                    $datosComparados .= '</td>';
                    $datosComparados .= '<td>';
                    $datosComparados .= $idTransaccion;
                    $datosComparados .= '</td>';
                    $datosComparados .= '<td>';
                    $datosComparados .= $pakagesId;
                    $datosComparados .= '</td>';
                    $datosComparados .= '<td>';
                    $datosComparados .= $listener->getPostData('payment_gross');
                    $datosComparados .= '</td>';
                    $datosComparados .= '</tr>';

                    $datosComparados .= '</table>';
                    $datosComparados .= '<hr></hr>';
                    $datosComparados .= 'datos de la trama';
                    $datosComparados .= '<hr></hr>';
                    $mensaje = 'pago verificado con exito de un pago manipulado';
                    $this->sendMailAdmin(
                            $datosComparados . $listener->getTextReport(), $paramConfig['correoContacto'], $mensaje
                    );
                    $transaccion->observarTransaccion($mensaje);
                }
            } else {
                $this->sendMailAdmin(
                        $datosComparados . $listener->getTextReport(), $paramConfig['correoContacto'], 'pago verificado sin exito'
                );
            }
        } catch (Exception $e) {
            CST_Log::info($e->__toString());
            $this->sendMailAdmin($e->__toString(), $paramConfig['correoContacto'], 'Error Pago');
            exit();
        }
    }
    
    private function sendMailAdmin($mensaje, $mail, $asunto) {
        $mail = new CST_Mail();
        $mail->setMensaje($mensaje);
        $mail->addDestinatario(array(
            'mail' => $mail, 'name' => 'administrador'
        ));
        $mail->setAsunto($asunto);
        $mail->send();
    }


}

?>
