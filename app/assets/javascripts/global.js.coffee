$(document).on 'page:load ready', ->
	flashesDiv = document.getElementsByClassName('flashes')[0]
	if flashesDiv
		flashesDiv.className += ' hide'
		setTimeout((-> flashesDiv.style.display = 'none'), 6000)