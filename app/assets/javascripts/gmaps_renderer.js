$(document).ready(function() {

  var handler = Gmaps.build('Google');

	$.getJSON("https://treemo-dev.herokuapp.com/checkins.json", function(data) {
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
