var map;

var editMode = false;

var imageOfPoint = "/wimk/resources/core/images/point.png";

var allowedColor = '#00ff00';
var forbiddenColor = '#ff0000';

var listArea = [];
var sizeListArea = 0;

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

// Function for create map on the page.
function initMap(latitude, longitude) {
	map = new google.maps.Map(document.getElementById('map'), {
		center : {
			lat : latitude,
			lng : longitude
		},
		zoom : 16
	});
}

// Function for draw point on the map.
function drawPoint(latitude, longitude) {
	var marker = new google.maps.Marker({
		position : {
			lat : latitude,
			lng : longitude
		},
		map : map,
		icon : imageOfPoint
	});
}

// Function for change mode (Edit area mode, View mode).
function changeMode() {
	if (editMode) {
		editMode = false;
		drawingManager.setMap(null);
		document.getElementById ( "confirmAreaChanges" ).style.visibility = "hidden";
		document.getElementById ( "changeAreaColor" ).style.visibility = "hidden";
	} else {
		editMode = true;
		drawingManager.setMap(map);
		document.getElementById ( "confirmAreaChanges" ).style.visibility = "visible";
		document.getElementById ( "changeAreaColor" ).style.visibility = "visible";
	}
	
	for(i = 0; i < sizeListArea; ++i){
		listArea[i].circle.setEditable(editMode);
	}
}

// Fucntion for change (color) for draw area. (Allowed or forbidden).
function changeDrawingColor(){
	if(drawingManager.circleOptions.fillColor == allowedColor){
		drawingManager.circleOptions.fillColor = forbiddenColor;
	} else {
		drawingManager.circleOptions.fillColor = allowedColor;
	}
}

// Function for adding area from database.
function addArea(x, y, radius, isAllowed, id) {
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
	
	listArea[sizeListArea] = {
		circle : circle,
		status : 'old',
		id : id
	}
	
	// Description events of areas
	google.maps.event.addListener(circle, 'center_changed', function() {
		for(i=0; i < sizeListArea; ++i){
			if(listArea[i].circle.getCenter() == circle.getCenter()
				&& listArea[i].circle.getRadius() == circle.getRadius()
				&& listArea[i].circle.fillColor == circle.fillColor){
				listArea[i].status = 'changed';
				break;
			}
		}
	});
	google.maps.event.addListener(circle, 'radius_changed', function() {
		for(i=0; i < sizeListArea; ++i){
			if(listArea[i].circle.getCenter() == circle.getCenter() 
				&& listArea[i].circle.getRadius() == circle.getRadius()
				&& listArea[i].circle.fillColor == circle.fillColor){
				listArea[i].status = 'changed';
				break;
			}
		}
	});
	google.maps.event.addListener(circle, 'dblclick', function() {
		for(i=0; i < sizeListArea; ++i){
			if(listArea[i].circle.getCenter() == circle.getCenter() 
				&& listArea[i].circle.getRadius() == circle.getRadius()
				&& listArea[i].circle.fillColor == circle.fillColor){
				if(editMode){
					circle.setVisible(false);
					listArea[i].status = 'removed';
				}
				break;
			}
		}
	});
	sizeListArea++;
}

// Description of actions for new areas.
google.maps.event.addListener(drawingManager, 'circlecomplete', function(circle) {
	listArea[sizeListArea++] = {
		circle : circle,
		status : 'new'
	};
	google.maps.event.addListener(circle, "dblclick", function (e) { 
		for(i=0; i < sizeListArea; ++i){
			if(listArea[i].circle.getCenter() == circle.getCenter() 
				&& listArea[i].circle.getRadius() == circle.getRadius()
				&& listArea[i].circle.fillColor == circle.fillColor){
				if(editMode){
					circle.setVisible(false);
					listArea[i].status = 'removed_not_check';
				}
				break;
			}
		}
	});
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
			'&latitude='+listArea[i].circle.getCenter().lat()+
			'&longitude='+listArea[i].circle.getCenter().lng()+
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