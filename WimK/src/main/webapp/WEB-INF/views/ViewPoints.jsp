<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<!-- URLs -->
<spring:url value="/resources/core/css/map.css" var="mapCss" />
<spring:url value="/resources/core/js/map.js" var="mapJs" />
<spring:url value="/resources/core/js/jquery-2.1.4.js" var="jquery" />
<spring:url value="/resources/core/js/view_points.js" var="view_points" />

<!-- CSS styles -->
<link href="${mapCss}" rel="stylesheet" type="text/css"/>

<!-- JS scripts -->
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCV1ck7gCmYPxEXLsYPDsU6LIXcbd1OKXM&callback=initMap"></script>
<script type="text/javascript"
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCV1ck7gCmYPxEXLsYPDsU6LIXcbd1OKXM&libraries=drawing"></script>
<script src="http://google-maps-utility-library-v3.googlecode.com/svn/trunk/maplabel/src/maplabel.js"></script>
<script src="${mapJs}" type="text/javascript"></script>
<script src="${jquery}" type="text/javascript"></script>
<script src="${view_points}" type="text/javascript"></script>

<title>Insert title here</title>
</head>
<body>
	<div id="menu" align="center">
		<select id="childLogin" onchange = "childChanged()">
			<c:forEach items="${listOfChild}" var="child" >
				<option value = ${child.login}
					<c:if test="${currentChild.login==child.login}">selected</c:if>> 
					${child.login}
				</option>
			</c:forEach>
		</select>
		<select id="dateSelect" onchange = "dateChanged()">
			<c:forEach items="${listOfDates}" var="date">
				<option value = ${date}
					<c:if test="${currentDate==date}">selected</c:if>> 
					${date}
				</option>
			</c:forEach>
		</select>
		<br/>
		<a href="<c:url value="/" />">To main menu</a>
		<br/>
		<button onclick = changeMode() >Change mode</button>
		<br/>
		<button id="confirmAreaChanges" onclick = confirmChanges() >Confirm changes</button>
		<br/>
		<button id="changeAreaColor" onclick = changeDrawingColor() >Change drawing color</button>
	</div>
	<div id="map"></div>
	<script language="javascript">
		initMap(50.003902, 36.233614);
		<c:forEach items="${listOfPoints}" var="point" >
			drawPoint(<c:out value="${point.x}"/>, <c:out value="${point.y}"/>);
		</c:forEach>
		<c:forEach items="${listOfAreas}" var="area" >
			addArea(<c:out value="${area.x}"/>, <c:out value="${area.y}"/>, 
					<c:out value="${area.radius}"/>, <c:out value="${area.allowed}"/>, 
					<c:out value="${area.id}"/>, '<c:out value="${area.name}"/>');
		</c:forEach>
	</script>
</body>
</html>