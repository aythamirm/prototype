
$("document").ready(function() {

	/*Start: Prevent the default white background on blur of top navigation */
	$(".dropdown-menu li a").mousedown(function() {
		var dropdown = $(this).parents('.dropdown');
		var link = dropdown.children(':first-child');
		link.css('background-color', "#2E3436");
		link.css('color', 'white');
	});
	/*End: Prevent the default white background on blur of top navigation */

  /*Start : Automatically start the slider */
	$('.carousel').carousel({
      interval: 4000
   });
	$('#myTab a[href="#inbox"]').tab('show')
	$('#myTab a[href="#calendar"]').tab('show')
	$('#myTab a[href="#diary"]').tab('show')	
	$('#myTab a[href="#statistics"]').tab('show')	
	$('#myTab a[href="#notification"]').tab('show')
	$('#myTab a[href="#social"]').tab('show')				
	/*End: Automatically start the slider */


})

});
