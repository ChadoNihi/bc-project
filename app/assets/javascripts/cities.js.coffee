$ ->
	timerEl = document.querySelector('.num-line[data-utcoffset]')
	if timerEl
		time = new Date(new Date().getTime() + parseInt(timerEl.dataset.utcoffset, 10) * 3600000)
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