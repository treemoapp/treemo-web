$(document).ready(function() {

  var handler = Gmaps.build('Google');

	$.getJSON("http://localhost:3000/checkins.json", function(data) {
		// Get the element with id summary and set the inner text to the result.
    handler.buildMap({
  		internal: {
  			id: 'multi_markers'
  		}
  	}, function() {
  		var markers = handler.addMarkers(data);
  		handler.bounds.extendWith(markers);
  		handler.fitMapToBounds();
  	});
	});









});
