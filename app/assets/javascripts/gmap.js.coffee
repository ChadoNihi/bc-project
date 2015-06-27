$ ->
	initializeGmap = (idSelec) ->
		geocoder = new google.maps.Geocoder()
		address = 'Zurich, Western Europe'
		geocoder.geocode { 'address': address }, (results, status) ->
			if status == google.maps.GeocoderStatus.OK
				mapOptions =
					center: results[0].geometry.location
					zoom: 7
				map = new google.maps.Map document.getElementById('map-canvas'), mapOptions

				marker = new google.maps.Marker
					position: map.getCenter()
					map: map
					title: address

				weatherwindow = new google.maps.InfoWindow
					content: "<p style='background: #000000;'>weather</p>"

				weatherwindow.open map, marker

			else
				document.getElementById('map-canvas').value 'Map outage'

	if $('#map-canvas', 'main').length
		initializeGmap "map-canvas"