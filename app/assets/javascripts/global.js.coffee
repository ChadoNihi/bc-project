$(document).on "page:change", ->
	flashesDiv = document.getElementsByClassName('flashes')[0]
	console.log flashesDiv
	if flashesDiv
		flashesDiv.className += ' hide'