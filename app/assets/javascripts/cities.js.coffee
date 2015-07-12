$(document).on "page:change", ->
	timerEl = document.querySelector('.num-line[data-utcoffset]')
	if timerEl
		utcoffsetMatch = timerEl.dataset.utcoffset.match /[+|-]?\d{1,2}/
		utcoffsetH = parseInt utcoffsetMatch[0], 10
		utcoffsetM = parseInt(utcoffsetMatch[1], 10) || 0
		time = new Date(new Date().getTime() + utcoffsetH * 3600000 + utcoffsetM * 60000)
		h = time.getHours()
		m = time.getMinutes()
		s = time.getSeconds()
		tick = ->
			s = (s+1)%60
			m = (m+1)%60 if s == 0
			h = (h+1)%24 if m == 0

			timerEl.textContent = "#{if h<10 then '0' else ''}#{h}:#{if m<10 then '0' else ''}#{m}:#{if s<10 then '0' else ''}#{s}"

		tick()
		setInterval tick, 1000