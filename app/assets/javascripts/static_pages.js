$(document).ready(function() {
	
	$(".country").mouseenter(function() {
		$(this).fadeTo( "slow", 1)
		})

	$(".country").mouseleave(function() {
  	$(this).fadeTo( "slow", 0.85)
	})

	  $(window).load(function() {

	    if($(window).width()<481){
	        $('#taj-video').get(0).pause();
	        $('#taj-video').remove();
	        $('#video-container').css("background", "url(chavaz.jpg");
	    }
	    
	});
})
