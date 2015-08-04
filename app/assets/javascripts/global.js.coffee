$(document).on 'page:load', ->
	flashesDiv = document.getElementsByClassName('flashes')[0]
	if flashesDiv
		document.getElementById('layout').className = 'active'
		document.getElementById('menu').className = 'active'
		setTimeout((-> flashesDiv.className += ' hide'), 0)
		setTimeout((-> flashesDiv.style.display = 'none'), 6000)