$(document).ready(function(){
    
    /*despligue del menu*/
    /*----------------------------------*/
    $('.navigation > li').hover(
        function () {
            //show its submenu
            $('ul:first', this).slideDown(100);
        }, 
        function () {
            //hide its submenu
            $('ul:first', this).slideUp(100);			
        }
        );
    $('.navigation > li > ul > li').hover(
        function () {
            //show its submenu
            $('ul:first', this).slideDown(100);
        }, 
        function () {
            //hide its submenu
            $('ul:first', this).slideUp(100);			
        }
        );
    /*----------------------------------*/

    /*agregar productos al carrito de compras*/
    /*----------------------------------*/

    $('a[id^="ajax_id_product"]').click(function(event){
        event.preventDefault();
        cadena=this.id;
        cadena = cadena.replace('ajax_id_product','form_pres');
        $('#'+cadena).submit();
    });
    /*----------------------------------*/
    
    /*eliminar productos del carrito de compras*/
    $('a[id^="eliminarCarrito_"]').click(function(event){
        event.preventDefault();
        cadena=this.id;
        cadena = cadena.replace('eliminarCarrito_','ItemCarrito_');
        if(confirmDialog('asdads')==true){
            alert('menaaje');
        }
        var param = new Array(2);
        param[0] = new Array(2);
        param[0][0] = this;
        param[0][1] = cadena;
        confirmDialog('mensaje',eliminarCarritoAjax,'',param);
        
    });
    
    function eliminarCarritoAjax(obj,divContent){
        $.ajax({
            url: ($('#'+obj.id).attr("href")),
            success: function(data) {
                $('.result').html(data);
            }
        });
        if(divContent!=''){
            $('#'+divContent).hide("slow",function(){
                $('#'+divContent).remove();
                var cantidadProductos = ($('#ListProduct li').size() - 2);
                if (cantidadProductos <= 1) {
                    $('#titleItemProduct').html('Tienes '+ cantidadProductos +' producto en tu carrito');
                } else {
                    $('#titleItemProduct').html('Tienes '+ cantidadProductos +' productos en tu carrito');
                }
                $('#ListProduct').find('.precioUnitario',function(){
                    alert('asdsd');
                });
            });
        }
    }
    function confirmDialog(mensaje,functionTrue, functionFalse, param){
        var callbacks = $.Callbacks();
        return $("#dialog-confirm").dialog({
            resizable: false,
            height:180,
            modal: true,
            buttons: {
                "Eliminar": function() {
                    if(functionTrue!=''){
                        callbacks.add(functionTrue);
                        paramsTrue = param[0];
                        //console.debug(param[0]);
                        callbacks.fireWith(window,paramsTrue);
                    }
                    $( this ).dialog( "close" );
                    return true;            
                },
                "Calcelar": function() {
                    if(functionFalse!=''){
                        callbacks.add(functionFalse);
                        paramsFalse = param[1];
                        callbacks.fireWith(window,paramsFalse);
                    }
                    $( this ).dialog( "close" );
                    return false;
                }
            }
        });
        
    }
    
//$("#confirmDialog").dialog()
    
});