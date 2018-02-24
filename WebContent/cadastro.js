$("#cadastroForm").submit(function( event ) {

    event.preventDefault();
   
    var $form = $( this );

    // Para Debbuging
    var data = "pName="+ $('#pName').val() +"pPrice=" + $('#pPrice').val() + "pAmount" + $("#pAmount").val();
    console.log(data);
   
	    $.ajax({
	        type: $form.attr('method'),
	        url:  $form.attr('action'),
	        data: data,
	        success: function (data) {

	        	//window.location.href("index.jsp");

	        }
	    });   
}); 