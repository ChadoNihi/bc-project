$(document).on 'page:load', ->
	flashesDiv = document.getElementsByClassName('flashes')[0]
	if flashesDiv
		setTimeout((-> flashesDiv.className += ' hide'), 0)
		setTimeout((-> flashesDiv.style.display = 'none'), 6000)