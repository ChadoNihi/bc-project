$ ->
	$('#masonry-container').imagesLoaded ->
		$('#masonry-container').masonry
			itemSelector: '.box'
			gutterWidth: 30
			percentPosition: true