$(document).ready(function() {
	
	$(".country").mouseenter(function() {
		$(this).fadeTo( "slow", 1)
		})

	$(".country").mouseleave(function() {
  	$(this).fadeTo( "slow", 0.85)
	})
  
})