$(document).on 'page:change', ->
	handleTime = () ->
		timerEl = document.querySelector '.num-line[data-utcoffset]'
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

	handleWeather = () ->
		weatherEl = document.querySelector '.num-line[data-temp]'
		return unless weatherEl
		elData = weatherEl.dataset

		if elData.temp != 'n'
			tempK = parseInt(elData.temp, 10)
			weatherEl.innerHTML = "<img src='#{elData.iconUrl}' alt='#{elData.descr}' class='black-white'>#{Math.round(tempK - 273.15)}°C (#{Math.round(tempK*1.8 - 459.67)}°F)"
		else
			$.ajax(
				url: "http://api.openweathermap.org/data/2.5/weather?q=#{elData.city}&APPID="
				dataType: 'json'
				)
				.done (resp) ->
					weatherData = JSON.parse(JSON.stringify resp)
					temp = weatherData.main.temp
					descr = weatherData.weather[0].main
					icon = weatherData.weather[0].icon

					$.post '/cities/weatherupdt',
						temp: temp
						name: resp.name
						descr: descr
						icon: icon
						dt: resp.dt
					weatherEl.innerHTML = "<img src='http://openweathermap.org/img/w/#{icon}.png' alt='#{descr}' class='black-white'>#{Math.round(temp - 273.15)}°C (#{Math.round(temp*1.8 - 459.67)}°F)"

				.fail () ->
					weatherEl.innerHTML = ''

	handleTime()
	handleWeather()