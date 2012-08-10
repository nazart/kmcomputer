

jQuery(document).ready(function(){
	var fl=false, 
		fl2=false;
	jQuery('.block-cart-header .cart-content').hide();
	jQuery('.block-cart-header  .amount a, .block-cart-header .cart-content').hover(function(){
		jQuery('.block-cart-header .cart-content').stop(true, true).slideDown(400);
	},function(){
		jQuery('.block-cart-header .cart-content').stop(true, true).delay(400).slideUp(300);
	})
	});	


jQuery(document).ready(function(){
       jQuery("a[data-gal^='prettyPhoto']").prettyPhoto({
            animationSpeed: 'normal',
            padding: 40,
            opacity: 0.35,
            showTitle: true,
            allowresize: true,
            counter_separator_label: '/',          
            theme: 'facebook' 
        });
    });