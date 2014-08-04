$(document).ready(function() {
	
	$(".country").mouseenter(function() {
		$(this).fadeTo( "fast", 1)
		})

	$(".country").mouseleave(function() {
  	$(this).fadeTo( "fast", 0.85)
	})
  
})