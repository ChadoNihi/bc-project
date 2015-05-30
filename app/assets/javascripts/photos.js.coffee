$ ->
	$('#masonry-container').imagesLoaded ->
		$('#masonry-container').masonry
			itemSelector: '.box'
			isFitWidth: true