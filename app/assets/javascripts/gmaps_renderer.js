$(document).ready(function() {

  var handler = Gmaps.build('Google');
  handler.buildMap({ internal: {id: 'multi_markers'}}, function(){
    var markers = handler.addMarkers([
// change to a get for our own API to handle geolocated location data
      { lat: 43, lng: 3.5},
      { lat: 44, lng: 4},
      { lat: 45, lng: 4},
      { lat: 47, lng: 3.5},
      { lat: 49, lng: 4},
      { lat: 49, lng: 4},
      { lat: 49, lng: 4},
      { lat: 49, lng: 4},
      { lat: 49, lng: 4},
      { lat: 49, lng: 4},
      { lat: 49, lng: 4},
      { lat: 49, lng: 4},
      { lat: 49, lng: 4},
      { lat: 49, lng: 4},
      { lat: 49, lng: 4},
      { lat: 49, lng: 4},
      { lat: 49, lng: 4},
    ]);
    handler.bounds.extendWith(markers);
    handler.fitMapToBounds();
  });

});