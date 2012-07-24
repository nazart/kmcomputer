$(document).ready(function(){
    /*agregar productos al carrito de compras*/
    $('a[id^="ajax_id_product"]').click(function(event){
        event.preventDefault();
        cadena=this.id;
        cadena = cadena.replace('ajax_id_product','form_pres');
        $('#'+cadena).submit();
    });
    
    /*eliminar productos del carrito de compras*/
    $('a[id^="eliminarCarrito_"]').click(function(event){
        event.preventDefault();
        cadena=this.id;
        cadena = cadena.replace('eliminarCarrito_','ItemCarrito_');
        $.ajax({
            url: ($('#'+this.id).attr("href")),
            success: function(data) {
                $('.result').html(data);
            }
        });
        
        $('#'+cadena).hide("slow");
        
        //alert($('#ListProduct').length);
        
    });
    
    
   
});