$(document).on "page:change", ->
	$('#masonry-container').imagesLoaded ->
		$('#masonry-container').masonry
			itemSelector: '.box'
			gutterWidth: 20
			isFitWidth: true
###
	if false
		for arrow, i in document.querySelectorAll('main .block ul.hor-list li a:after')
			do (arrow) ->
				arrow.style.animation = 'rotate-3d 3s'
				arrow.style.animationFillMode = 'forwards'
				arrow.style.animationDelay = i*0.3+'s'
###