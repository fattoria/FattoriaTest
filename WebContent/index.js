$("#deleteForm").submit(function( event ) {

    event.preventDefault();
    request.setParameter("")
    var $form = $( this );
   
	    $.ajax({
	        type: $form.attr('method'),
	        url:  $form.attr('action'),
	        data: data,
	        success: function (data) {
	           //console.log("Hey, we got reply form java side, with following data: ");
	           console.log(data);
	           window.location.replace("index.jsp");
	
	        }
	    });   
}); 