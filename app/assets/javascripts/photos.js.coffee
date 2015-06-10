$ ->
	$('#masonry-container').imagesLoaded ->
		$('#masonry-container').masonry
			itemSelector: '.box'
			gutterWidth: 20
			isFitWidth: true
			percentPosition: true