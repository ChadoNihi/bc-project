$ ->
	$('#masonry-container').imagesLoaded ->
		$('#masonry-container').masonry
			itemSelector: '.box'
			gutterWidth: 20
			isFitWidth: true

	if index
		for a, i in document.querySelectorAll('main .block ul.hor-list li a')
			do (a) ->
				a.style.animation = 'list-letters-apart 1.5s'
				a.style.animationDelay = i*0.3+'s'