$ ->
	initializeGmap = (idSelec) ->
		geocoder = new google.maps.Geocoder()
		address = 'Zurich, Western Europe'
		geocoder.geocode { 'address': address }, (results, status) ->
			if status == google.maps.GeocoderStatus.OK
				mapOptions =
					center: results[0].geometry.location
					zoom: 8
				map = new google.maps.Map document.getElementById('map-canvas'), mapOptions
			else
				document.getElementById('map-canvas').value 'Map outage'

        
	initializeGmap "map-canvas"


	if $('#gmap', 'main').length
		google.maps.event.addDomListener window, 'load', initialize