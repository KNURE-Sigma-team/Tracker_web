<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<!-- URLs -->
<spring:url value="/resources/core/css/style-view_points.css" var="mapCss" />
<spring:url value="/resources/core/js/script-map.js" var="mapJs" />
<spring:url value="/resources/core/js/jquery-2.1.4.js" var="jquery" />
<spring:url value="/resources/core/js/script-view_points.js" var="view_points" />

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

<title>Insert title here</title>
</head>
<body>
	<div id="menu" align="center">
		<button onclick = changeMode() >Change mode</button>
		<div id = "editAreaMenu">
			<table>
				<tr>
					<td>Edit area menu</td>
				</tr>
				<tr>
					<td> Area name: </td>
					<td> <input id="textInputAreaName" type="text"/> </td>
				</tr>
				<tr>
					<td> <div id='descriptionAreaType'></div></td>
					<td> <input id="buttonAreaType" type="button" onclick="changeAreaType()" value="Change area type"/> </td>
				</tr>
				<tr>
					<td><button id="confirmAreaChanges" onclick = removeArea() >Remove area</button></td>
				</tr>
				<tr>
					<td>
						<button id="confirmAreaChanges" onclick = confirmChanges() >Confirm changes</button>
						<div id="confirmChangesResult"></div>
					</td>
				</tr>
			</table>
		</div>
		<div id = "viewMenu">
			<div>
				<spring:url value="${currentChild.avatar}" var="imageChild" />
				<img id="child_avatar" src="${imageChild}"/>
			</div>
			<div>
				Child:
				<select id="childLogin" onchange = "childChanged()">
					<c:forEach items="${listOfChild}" var="child" >
						<option value = ${child.login}
							<c:if test="${currentChild.login==child.login}">selected</c:if>> 
							${child.login}
						</option>
					</c:forEach>
				</select>
			</div>
			<div>
				Date:
				<select id="dateSelect" onchange = "dateChanged()">
					<c:forEach items="${listOfDates}" var="date">
						<option value = ${date}
							<c:if test="${currentDate==date}">selected</c:if>> 
							${date}
						</option>
					</c:forEach>
				</select>
			</div>
			<div id="areaDescriptionViewMode"></div>
			<div><button id="whereIsChild" onclick = whereIsChild() >See where is my child</button></div>
			<div id="resultWhereIsChildQuery"></div>
		</div>
		<a href="<c:url value="/" />">To main menu</a>
	</div>
	<div id="map"></div>
	
	<script src="${view_points}" type="text/javascript"></script>
	<script language="javascript">
		initMap(50.003902, 36.233614);
		<c:forEach items="${listOfPoints}" var="point" >
			<c:choose>
				<c:when test="${point.pointType.name=='common'}">
					drawPoint(<c:out value="${point.x}"/>, <c:out value="${point.y}"/>,
						'<c:out value="${point.time}"/>', '<c:out value="${point.batteryStatus}"/>', 1);
				</c:when>
				<c:when test="${point.pointType.name=='on_demand'}">
					drawPoint(<c:out value="${point.x}"/>, <c:out value="${point.y}"/>,
						'<c:out value="${point.time}"/>', '<c:out value="${point.batteryStatus}"/>', 2);
				</c:when>
				<c:when test="${point.pointType.name=='storaged'}">
					drawPoint(<c:out value="${point.x}"/>, <c:out value="${point.y}"/>,
						'<c:out value="${point.time}"/>', '<c:out value="${point.batteryStatus}"/>', 3);
				</c:when>
				<c:when test="${point.pointType.name=='sos'}">
					drawSosPoint(<c:out value="${point.x}"/>, <c:out value="${point.y}"/>,
							'<c:out value="${point.time}"/>', '<c:out value="${point.batteryStatus}"/>');
				</c:when>
			</c:choose>
		</c:forEach>
		<c:forEach items="${listOfAreas}" var="area" >
			addArea(<c:out value="${area.x}"/>, <c:out value="${area.y}"/>, 
					<c:out value="${area.radius}"/>, <c:out value="${area.allowed}"/>, 
					<c:out value="${area.id}"/>, '<c:out value="${area.name}"/>');
		</c:forEach>
		setCenterMapOnCenterBiggestArea();
	</script>
</body>
</html>