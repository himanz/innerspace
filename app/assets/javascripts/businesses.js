$(document).ready(function() {
	
	$(".streetview-image").mouseenter(function() {
		$(this).fadeTo( "slow", 0.5)
		})

	$(".streetview-image").mouseleave(function() {
  	$(this).fadeTo( "slow", 1)
	})

	/* * * CONFIGURATION VARIABLES: EDIT BEFORE PASTING INTO YOUR WEBPAGE * * */
    var disqus_shortname = 'scoutingit'; // required: replace example with your forum shortname

    /* * * DON'T EDIT BELOW THIS LINE * * */
    (function() {
        var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
        dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js';
        (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
    })();
})

