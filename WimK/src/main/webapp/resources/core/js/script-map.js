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
var imageOfPointOnDemand = "/wimk/resources/core/images/point_on_demand.png";
var imageOfPointStoraged = "/wimk/resources/core/images/point_storaged.png";
// Alphabet for labeles on the points
var EnglishAlphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
var currentLetter = 0;

// Colors of areas
var allowedColor = '#00ff00';
var forbiddenColor = '#ff8c00';

// List of all area on the map
var listArea = [];
var sizeListArea = 0;
var scopeOfLabelZoom = 4;
var areaFontSize = 18;

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
/*=====================================================================================
 									Page events
======================================================================================*/

// Function for change mode (Edit area mode, View mode).
function changeMode() {
	if (editMode) {
		editMode = false;
		drawingManager.setMap(null);
		document.getElementById ( "editAreaMenu" ).style.display = "none";
		document.getElementById ( "viewMenu" ).style.display = "block";

		selectedArea = null;
		document.getElementById("textInputAreaName").oninput = null;
	} else {
		editMode = true;
		drawingManager.setMap(map);
		document.getElementById ( "editAreaMenu" ).style.display = "block";
		document.getElementById ( "viewMenu" ).style.display = "none";

		document.getElementById("textInputAreaName").oninput = function(){
			selectedArea.label.set('text', document.getElementById("textInputAreaName").value);
			selectCircle(selectedArea.circle);
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
			remeberUserAboutUnsavedData();
		} else {
			selectedArea.status = 'removed_not_check';
		}
		selectedArea = null;
	}
}

function changeAreaType(){
	if(selectedArea != null){
		if(selectedArea.circle.fillColor == allowedColor){
			selectedArea.circle.setOptions({fillColor: forbiddenColor});
			setDescriptionAreaType('Area is forbidden');
		} else {
			selectedArea.circle.setOptions({fillColor: allowedColor});
			setDescriptionAreaType('Area is allowed');
		}
		if(selectedArea.status == 'old'){
			selectedArea.status = 'changed';
			remeberUserAboutUnsavedData();
		}
	}
}

// Change text in div with id descriptionAreaType
function setDescriptionAreaType(description){
	document.getElementById('descriptionAreaType').innerHTML = description;
}

// If user changed area and didn't confirm changes, this function will be perfomed.
function remeberUserAboutUnsavedData(){
	window.onbeforeunload = function (evt) {
		var message = "You changed areas and did not confirm your changes.";
		if (typeof evt == "undefined") {
			evt = window.event;
		}
		if (evt) {
			evt.returnValue = message;
		}
		return message;
	};
}

// This function for cancel remembering about unsaved data after confirm.
function cancelRememberUserAboutUnsavedData(){
	window.onbeforeunload = null;
}
/*==================================================
			Functions for area events
==================================================*/
// Event: 'click' on the area
function selectCircle(circle){
	for(i=0; i < sizeListArea; ++i){
		if(compareCircles(listArea[i].circle, circle)) {
			selectedArea = listArea[i];
			document.getElementById("textInputAreaName").value = selectedArea.label.text;
			document.getElementById("areaDescriptionViewMode").innerHTML = selectedArea.label.text;
			if(selectedArea.circle.fillColor == allowedColor){
				setDescriptionAreaType('Area is allowed');
				document.getElementById("areaDescriptionViewMode").innerHTML = "Allowed";
			} else {
				document.getElementById("areaDescriptionViewMode").innerHTML = "Forbidden";
				setDescriptionAreaType('Area is forbidden');
			}
			document.getElementById("areaDescriptionViewMode").innerHTML += ' area "' + selectedArea.label.text + '"';
			break;
		}
	}
}
// Event: 'change_radius' of old area
function radiusOldAreaChanged(circle){
	for(i=0; i < sizeListArea; ++i){
		if(compareCircles(listArea[i].circle, circle)) {
			listArea[i].status = 'changed';
			listArea[i].label.set('maxZoom', getMaxZoom(circle.radius));
			listArea[i].label.set('minZoom', getMaxZoom(circle.radius) - scopeOfLabelZoom);
			remeberUserAboutUnsavedData();
			break;
		}
	}
	selectCircle(circle);
}
// Event: 'center_changed' of old area
function centerOldAreaChanged(circle){
	for(i=0; i < sizeListArea; ++i){
		if(compareCircles(listArea[i].circle, circle)) {
			listArea[i].status = 'changed';
			listArea[i].label.set('position', circle.getCenter());
			remeberUserAboutUnsavedData();
			break;
		}
	}
	selectCircle(circle);
}
// Event: 'change_radius' of new area
function radiusNewAreaChanged(circle){
	for(i=0; i < sizeListArea; ++i){
		listArea[i].label.set('maxZoom', getMaxZoom(circle.radius));
		listArea[i].label.set('minZoom', getMaxZoom(circle.radius) - scopeOfLabelZoom);
		if(compareCircles(listArea[i].circle, circle) && listArea[i].status == 'old') {
			listArea[i].status = 'changed';
			remeberUserAboutUnsavedData();
			break;
		}
	}
	selectCircle(circle);
}
// Event: 'center_changed' of new area
function centerNewAreaChanged(circle){
	for(i=0; i < sizeListArea; ++i){
		if(compareCircles(listArea[i].circle, circle)) {
			if(listArea[i].status == 'old') {
				listArea[i].status = 'changed';
				remeberUserAboutUnsavedData();
			}
			listArea[i].label.set('position', circle.getCenter());
			break;
		}
	}
	selectCircle(circle);
}
/*==================================================
		Functions for interacting with the map
==================================================*/
// Function for create map on the page.
function initMap(latitude, longitude) {
	map = new google.maps.Map(document.getElementById('map'), {
		center : {
			lat : 0,
			lng : 0
		},
		zoom : 2
	});
	polyline.setMap(map);
}

// Function for draw point on the map.
function drawPoint(latitude, longitude, date, batterryStatus, pointType) {
	currentImageOfPoint = null;
	letter = "";
	switch(pointType){
		case 1:
			currentImageOfPoint = imageOfPoint;
			letter = EnglishAlphabet[currentLetter++%EnglishAlphabet.length];
			break;
		case 2:
			currentImageOfPoint = imageOfPointOnDemand;
			break;
		case 3:
			currentImageOfPoint = imageOfPointStoraged;
			break;
	}
	var marker = new google.maps.Marker({
		position : {
			lat : latitude,
			lng : longitude
		},
		map : map,
		label : letter,
		icon : currentImageOfPoint,
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
        strokeWeight : 1,
		maxZoom: getMaxZoom(circle.radius),
		minZoom: getMaxZoom(circle.radius) - scopeOfLabelZoom,
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
	        strokeWeight : 1,
	        fontSize: areaFontSize,
			maxZoom: getMaxZoom(circle.radius),
			minZoom: getMaxZoom(circle.radius) - scopeOfLabelZoom,
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
	remeberUserAboutUnsavedData();
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
	cancelRememberUserAboutUnsavedData();
}

//Function for execute query
function executeQuery(data){
	$.ajax({
		type: "POST",
		url:  "/wimk/area_editor",
		data: data,
		success : function(message){
			if(message=="OK"){
				goodResult();
			} else {
				badResult();
			}
		}
	});
}

// Functions for show user the result query
function goodResult(){
	document.getElementById('confirmChangesResult').innerHTML = "Changes was confirmed.";
	setTimeout(removeResult, 3000);
}
function badResult(){
	document.getElementById('confirmChangesResult').innerHTML = "Changes was not confirmed.";
	setTimeout(removeResult, 3000);
}
function removeResult(){
	document.getElementById('confirmChangesResult').innerHTML = "";
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

function getMaxZoom(circleRadius){
	// 21 - log(circleRadius/25,2)
	return 21 - Math.log(circleRadius/25)/Math.log(2);
}

// Set center of the map on the center of the biggest allowed area.
function setCenterMapOnCenterBiggestArea(){
	biggestCircle = null;
	for(i = 0; i < sizeListArea; i++){
		if(listArea[i].circle.fillColor == allowedColor && (biggestCircle == null || biggestCircle.radius < listArea[i].circle.radius)){
			biggestCircle = listArea[i].circle;
		}
	}
	if(biggestCircle != null){
		map.setCenter(biggestCircle.getCenter());
	}
}