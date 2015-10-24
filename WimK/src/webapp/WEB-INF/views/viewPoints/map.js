var imageOfPoint = "point.png";
function initMap(latitude,longitude) {
	var map = new google.maps.Map(document.getElementById('map'), {
		center: {lat: latitude, lng: longitude},
		zoom: 16
	});
	return map;
}
function drawPoint(latitude,longitude,map){
	var marker = new google.maps.Marker({
    position: {lat:latitude,lng:longitude},
    map: map,
    icon:imageOfPoint
  });
}