<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<!-- URLs -->
<spring:url value="/resources/core/css/style-view_points.css" var="mapCss" />
<spring:url value="/resources/core/js/script-map.js" var="mapJs" />
<spring:url value="/resources/core/js/jquery-2.1.4.js" var="jquery" />
<spring:url value="/resources/core/js/script-view_points.js" var="view_points" />
<spring:url value="/resources/core/css/bootstrap.css" var="bootstrapCss" />
<spring:url value="/resources/core/css/bootstrap.js" var="bootstrapJs" />
<spring:url value="/resources/core/css/style.css" var="styleCss" />

<!-- CSS styles -->
<link href="${styleCss}" rel="stylesheet" type="text/css" />
<link href="${mapCss}" rel="stylesheet" type="text/css"/>
<link href="${bootstrapCss}" rel="stylesheet" type="text/css" />

<!-- JS scripts -->
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCV1ck7gCmYPxEXLsYPDsU6LIXcbd1OKXM&callback=initMap"></script>
<script type="text/javascript"
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCV1ck7gCmYPxEXLsYPDsU6LIXcbd1OKXM&libraries=drawing"></script>
<script src="http://google-maps-utility-library-v3.googlecode.com/svn/trunk/maplabel/src/maplabel.js"></script>
<script src="${mapJs}" type="text/javascript"></script>
<script src="${jquery}" type="text/javascript"></script>

<title>View points</title>
</head>
<body>
<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container">
        <ul class="nav navbar-nav">
        <li><img class = "cover" src = "http://cs612117.vk.me/u59503884/docs/13f4436f9f33/logo1.png" /></li>
        <li><a href="<c:url value="/add_child" />" role="button">Add child</a></li>
        <li><a href="<c:url value="/view_points" />" role="button">View points of child</a></li>
        <li><a href="<c:url value="/personal_cabinet" />" role="button">Personal cabinet</a></li>
        </ul>
	<div class = "navbar-right">
	<sec:authorize access="isAuthenticated()">
	<p>
		<sec:authentication property="principal.username" />
	</p>
	</sec:authorize>
	<a href="<c:url value="/logout" />" role="button">Sign out</a>
	</div>
  </div>
</nav>
	<div id="menu" class = "container" align="center">
		<button class="btn btn-primary" onclick = changeMode() >Change mode</button>
		<div id = "editAreaMenu">
				<br />
				<h2>Edit area menu</h2>
				<br /><br /><br />
					Area name:
					<input class = "form-control" id="textInputAreaName" type="text"/>
					<div id='descriptionAreaType'></div>
					<input class = "form-control"  id="buttonAreaType" type="button" onclick="changeAreaType()" value="Change area type"/>
					<button class = "btn btn-warning" id="confirmAreaChanges" onclick = removeArea() >Remove area</button>
						<button class = "btn btn-primary" id="confirmAreaChanges" onclick = confirmChanges() >Confirm changes</button>
						<div id="confirmChangesResult"></div>
		</div>
		<div id = "viewMenu">
			<div>
				<spring:url value="${currentChild.avatar}" var="imageChild" />
				<img id="child_avatar" src="${imageChild}"/>
			</div>
			<div>
<!-- 
=======
			<h3>Edit area menu</h3>
        	<ul class = "list-group">
   				<li class="list-group-item">Area name:</li>
   			</ul>
					<div id='descriptionAreaType'></div>
					<button id="buttonAreaType" class = "btn btn-default" onclick="changeAreaType()"> Change area type</button>
					<button id="confirmAreaChanges"  class = "btn btn-warning" onclick = removeArea() >Remove area</button>
					<button id="confirmAreaChanges" class = "btn btn-success" onclick = confirmChanges() >Confirm changes</button>
		</div>
		<div id = "viewMenu">
			<div class = "form-group">
>>>>>>> Stashed changes  -->
 			 <label for="sel1">Child:</label>
 			 	<form class = "form-group">
  				<select class = "form-control" id="childLogin" onchange = "childChanged()">
					<c:forEach items="${listOfChild}" var="child" >
						<option value = ${child.login}
							<c:if test="${currentChild.login==child.login}">selected</c:if>> 
							${child.login}
						</option>
					</c:forEach>
				</select>
 			 	</form>
			</div>
			<div>
 			 <label for="sel1">Date:</label>
				<select class = "form-control" id="dateSelect" onchange = "dateChanged()">
					<c:forEach items="${listOfDates}" var="date">
						<option value = ${date}
							<c:if test="${currentDate==date}">selected</c:if>> 
							${date}
						</option>
					</c:forEach>
				</select>
			</div>
			<div id="areaDescriptionViewMode"></div>
			<div><button class = "btn btn-warning" id="whereIsChild" onclick = whereIsChild() >See where is my child</button></div>
			<div id="resultWhereIsChildQuery"></div>
		</div>
	</div>
	<div id="map"></div>
	
	<script src="${view_points}" type="text/javascript"></script>
	<script language="javascript">
		initMap();
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