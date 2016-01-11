$(document).ready(function(){
	// $(".btn-default").click(function(){
	// 	$(this).siblings(".hidden-content").show();

	// });
	$('a[data-toggle="popover"]').click(function(){
		
		$('[data-toggle="popover"]').popover();  
		
	});

	$(document).on('click', '.btn-default',function(){
		
		$(".col-md-4").fadeOut(300);
		
	});
	$(document).on('mouseover', '.btn-primary',function(){
		
		$(this).siblings(".hidden-content").toggle(300);
		
	});

	$( "form" ).submit(function( event ) {
	  //alert( "Handler for .submit() called." );
	  // console.log($(this).serialize())
	  event.preventDefault();
	  $.ajax({
	  type: "POST",
	  url: '/urls',
	  data: $(this).serialize(),
	  success: function(response){
	  	// $('.last-child').html(response);
	  	$('.last-child').append(response);
	  	// alert(response)
	  },
	  dataType: 'html'
		});
	});

	function showValues() {
	    var str = $( "form" ).serialize();
	    $( "#results" ).html( str );
	  };
  	$( "input[type='text'] ").on( "mouseleave", function (){
  		showValues();
  	});

	
});