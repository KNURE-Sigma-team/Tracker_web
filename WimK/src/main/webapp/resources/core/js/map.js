/*==================================================
			Declaring Variables
==================================================*/
// Google map on the page
var map;
// Line between common points
var polyline = new google.maps.Polyline({
    strokeColor: '#000000',
    strokeOpacity: 1.0,
    strokeWeight: 2
 });

// Flag for determinating edit mode
var editMode = false;

// URI of images for draw point on the map
var imageOfPoint = "/wimk/resources/core/images/point.png";
var imageOfSosPoint = "/wimk/resources/core/images/point_sos.png";
// Alphabet for labeles on the points
var EnglishAlphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
var currentLetter = 0;

// Colors of areas
var allowedColor = '#00ff00';
var forbiddenColor = '#ff8c00';

// List of all area on the map
var listArea = [];
var sizeListArea = 0;
var areaFontSize = 25;

// Selected area
var selectedArea = null;

// Initial settings of drawing manager;
var drawingManager = new google.maps.drawing.DrawingManager({
	drawingControl : true,
	drawingControlOptions : {
		position : google.maps.ControlPosition.TOP_CENTER,
		drawingModes : [ google.maps.drawing.OverlayType.CIRCLE ]
	},
	circleOptions : {
		fillColor : allowedColor,
		fillOpacity : 0.35,
		strokeWeight : 1,
		clickable : true,
		editable : true,
		zIndex : 1
	}
});
/*===================================================
 				Page events
===================================================*/

// Function for change mode (Edit area mode, View mode).
function changeMode() {
	if (editMode) {
		editMode = false;
		drawingManager.setMap(null);

		document.getElementById ( "editAreaMenu" ).style.visibility = "hidden";
		selectedArea = null;
		document.getElementById("textInputAreaName").oninput = null;
	} else {
		editMode = true;
		drawingManager.setMap(map);
		document.getElementById ( "editAreaMenu" ).style.visibility = "visible";
		
		document.getElementById("textInputAreaName").oninput = function(){
			selectedArea.label.set('text', document.getElementById("textInputAreaName").value);
			if(selectedArea.status == 'old'){
				selectedArea.status = 'changed';
			}
		};
	}
	
	for(i = 0; i < sizeListArea; ++i){
		listArea[i].circle.setEditable(editMode);
	}
}

function removeArea(){
	if(selectedArea != null && confirm("Are you sure?")){
		selectedArea.circle.setMap(null);
		selectedArea.label.set('map',null);
		if(selectedArea.status == 'old'){
			selectedArea.status = 'removed';
		} else {
			selectedArea.status = 'removed_not_check';
		}
		selectedArea = null;
	}
}
/*==================================================
			Functions for area events
==================================================*/
// Event: 'click' on the area
function selectCircle(circle){
	if(editMode){
		for(i=0; i < sizeListArea; ++i){
			if(compareCircles(listArea[i].circle, circle)) {
				selectedArea = listArea[i];
				document.getElementById("textInputAreaName").value = selectedArea.label.text;
				break;
			}
		}
	}
}
// Event: 'change_radius' of old area
function radiusOldAreaChanged(circle){
	for(i=0; i < sizeListArea; ++i){
		if(compareCircles(listArea[i].circle, circle)) {
			listArea[i].status = 'changed';
			break;
		}
	}
}
// Event: 'center_changed' of old area
function centerOldAreaChanged(circle){
	for(i=0; i < sizeListArea; ++i){
		if(compareCircles(listArea[i].circle, circle)) {
			listArea[i].status = 'changed';
			listArea[i].label.set('position', circle.getCenter());
			break;
		}
	}
}
// Event: 'change_radius' of new area
function radiusNewAreaChanged(circle){
	for(i=0; i < sizeListArea; ++i){
		if(compareCircles(listArea[i].circle, circle) && listArea[i].status == 'old') {
			listArea[i].status = 'changed';
			break;
		}
	}
}
// Event: 'center_changed' of new area
function centerNewAreaChanged(circle){
	for(i=0; i < sizeListArea; ++i){
		if(compareCircles(listArea[i].circle, circle)) {
			if(listArea[i].status == 'old') {
				listArea[i].status = 'changed';
			}
			listArea[i].label.set('position', circle.getCenter());
			break;
		}
	}
}
/*==================================================
		Functions for interacting with the map
==================================================*/
// Function for create map on the page.
function initMap(latitude, longitude) {
	map = new google.maps.Map(document.getElementById('map'), {
		center : {
			lat : latitude,
			lng : longitude
		},
		zoom : 16
	});
	
	google.maps.event.addListener(map, 'zoom_changed', function() {
		areaFontSize = (map.getZoom()-16)*5 + 28;
		for(i=0; i < sizeListArea; ++i){
			listArea[i].label.set('fontSize', areaFontSize);
		}
	});
	
	polyline.setMap(map);
}

// Function for draw point on the map.
function drawPoint(latitude, longitude, date, batterryStatus) {
	var marker = new google.maps.Marker({
		position : {
			lat : latitude,
			lng : longitude
		},
		map : map,
		label : EnglishAlphabet[currentLetter++%EnglishAlphabet.length],
		icon : imageOfPoint,
		title : 'Date: ' + date + ';\nBattery status : '+ batterryStatus + '%',
	});
	polyline.getPath().push(marker.position);
}

function drawSosPoint(latitude, longitude, date, batterryStatus) {
	var marker = new google.maps.Marker({
		position : {
			lat : latitude,
			lng : longitude
		},
		map : map,
		icon : imageOfSosPoint,
		title : 'Date: ' + date + ';\nBattery status : '+ batterryStatus + '%',
	});
}


// Function for adding old area.
function addArea(x, y, radius, isAllowed, id, name) {
	var color;
	if (isAllowed) {
		color = allowedColor;
	} else {
		color = forbiddenColor;
	}
	
	var circle = new google.maps.Circle({
		fillColor : color,
		fillOpacity : 0.35,
		strokeWeight : 1,
		clickable : true,
		editable : false,
		zIndex : 1,
		map : map,
		center : {lat: x, lng: y},
		radius : radius
	});
	
	var label = new MapLabel({
        text: name,
        position: new google.maps.LatLng(x,y),
		fontColor: '#000000',
        map: map,
        fontSize: areaFontSize,
		maxZoom:20,
		minZoom:10,
        align: 'right'
    });
	
	listArea[sizeListArea++] = {
		circle : circle,
		status : 'old',
		id : id,
		label : label
	}
	
	// Description events of areas
	google.maps.event.addListener(circle, 'click', function() {
		selectCircle(circle);
	});
	google.maps.event.addListener(circle, 'center_changed', function() {
		centerOldAreaChanged(circle);
	});
	google.maps.event.addListener(circle, 'radius_changed', function() {
		radiusOldAreaChanged(circle);
	});
}

// Description of actions for new areas.
google.maps.event.addListener(drawingManager, 'circlecomplete', function(circle) {
	listArea[sizeListArea++] = {
		circle : circle,
		status : 'new',
		label : new MapLabel({
	        text: 'NewArea',
	        position: circle.getCenter(),
			fontColor: '#000000',
	        map: map,
	        fontSize: areaFontSize,
			maxZoom:20,
			minZoom:10,
	        align: 'right'
	    }),
	};
	google.maps.event.addListener(circle, 'click', function() {
		selectCircle(circle);
	});
	google.maps.event.addListener(circle, "center_changed", function (e) { 
		centerNewAreaChanged(circle);
	});
	google.maps.event.addListener(circle, 'radius_changed', function() {
		radiusNewAreaChanged(circle);
	});
	selectCircle(circle);
});
// ======================================================================================
// 										Work with server
// ======================================================================================

// Functions for confirm changes related with areas.
function confirmChanges(){
	var data;
	for(i = 0; i < sizeListArea; ++i){
		data = '';
		if(listArea[i].status == 'new'){
			data='status=new&child='+document.getElementById("childLogin").value+
			'&latitude='+listArea[i].circle.getCenter().lat() +
			'&longitude='+listArea[i].circle.getCenter().lng() +
			'&name='+listArea[i].label.text +
			'&radius='+listArea[i].circle.getRadius() + '&allowed=';
			if(listArea[i].circle.fillColor == allowedColor){
				data = data + 'true';
			} else {
				data = data + 'false';
			}
			executeQuery(data);
			listArea[i].status = 'old';
		} else if(listArea[i].status == 'changed'){
			data='status=changed&child='+document.getElementById("childLogin").value+
			'&area_id='+listArea[i].id+
			'&latitude='+listArea[i].circle.getCenter().lat()+
			'&longitude='+listArea[i].circle.getCenter().lng()+
			'&name='+listArea[i].label.text +
			'&radius='+listArea[i].circle.getRadius() + '&allowed=';
			if(listArea[i].circle.fillColor == allowedColor){
				data = data + 'true';
			} else {
				data = data + 'false';
			}
			executeQuery(data);
			listArea[i].status = 'old';
		} else if(listArea[i].status == 'removed'){
			data='status=removed&area_id='+listArea[i].id;
			executeQuery(data);
			listArea[i].status = 'removed_not_check';
		}
	}
}

// Function for execute query
function executeQuery(data){
	$.ajax({
		type: "POST",
		url:  "/wimk/area_editor",
		data: data
	});
}

// ======================================================================================
// 										Utils 
// ======================================================================================
// Compare circles.
function compareCircles(circle1, circle2){
	if(circle1.getCenter() == circle2.getCenter() && circle1.getRadius() == circle2.getRadius() 
		&& circle1.fillColor == circle2.fillColor){
		return true;
	}
	return false;
}