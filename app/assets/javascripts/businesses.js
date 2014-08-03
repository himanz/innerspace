$(document).ready(function() {
	
	$(".streetview-image").mouseenter(function() {
		$(this).fadeTo( "slow", 0.5)
		})

	$(".streetview-image").mouseleave(function() {
  	$(this).fadeTo( "slow", 1)
	})

	
})

