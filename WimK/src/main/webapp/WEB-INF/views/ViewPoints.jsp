<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="viewPoints/map.css">
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCV1ck7gCmYPxEXLsYPDsU6LIXcbd1OKXM&callback=initMap"></script>
<script type="text/javascript"
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCV1ck7gCmYPxEXLsYPDsU6LIXcbd1OKXM&libraries=drawing"></script>
<script type="text/javascript">
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
  });
}
</script>

<style>
html, body {
	height: 100%;
	margin: 0;
	padding: 0;
}
#map {
	height: 100%;
	width: 80%;
	float: right;
}
#menu{
	height: 100%;
	width: 20%;
	float: left;
	background-color: #ffffff;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<div id="menu" align="center">
		<select onchange = "document.location='view_points?currentChild='+this.options[this.selectedIndex].value">
		<%@ page import = "java.util.List" %>
		<%@ page import = "com.wimk.entity.Child"%>
		<%@ page import = "com.wimk.entity.Point"%>
			<%
			List<Child> listOfChild = (List<Child>)request.getAttribute("listOfChild");
			Child currentChild = (Child) request.getAttribute("currentChild");
			for (int i=0; i < listOfChild.size(); ++i){
			%>
			<option value = <%= listOfChild.get(i).getLogin() %>
			<% if(currentChild.getLogin() == listOfChild.get(i).getLogin()) {%> selected <%} %> > 
			<%= listOfChild.get(i).getLogin() %></option>
			<%
			}
			%>
		</select>
		<br/>
		<a href="<c:url value="/" />">To main menu</a>
	</div>
	<div id="map"></div>
	<script language="javascript">
		var map = initMap(50.003902, 36.233614);
		<%
		List<Point> listOfPoints = (List<Point>)request.getAttribute("listOfPoints");
		for (int i=0; i < listOfPoints.size(); ++i){
		%>
			drawPoint(<%= listOfPoints.get(i).getX() %>, <%= listOfPoints.get(i).getY() %>, map);
		<%
		}
		%>
	</script>
</body>
</html>