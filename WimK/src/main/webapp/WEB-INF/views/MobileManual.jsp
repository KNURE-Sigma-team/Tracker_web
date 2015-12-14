<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel = "shortcut icon" href="/wimk/resources/core/images/favicon.ico" />

<spring:url value="/resources/core/css/bootstrap.css" var="bootstrapCss" />
<spring:url value="/resources/core/css/bootstrap.js" var="bootstrapJs" />
<spring:url value="/resources/core/css/style.css" var="styleCss" />
<spring:url value="/resources/core/css/style-user_manual.css" var="userManualCss" />

<link href="${bootstrapCss}" rel="stylesheet" type="text/css" />
<link href="${styleCss}" rel="stylesheet" type="text/css" />
<link href="${userManualCss}" rel="stylesheet" type="text/css" />

<title>User manual</title>
</head>
<body style="margin : 10pt">
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container">
			<ul class="nav navbar-nav">
				<li><a href="<c:url value="/personal_cabinet" />" style="padding:  0;"><img class = "cover" src = "/wimk/resources/core/images/logo.png" /></a></li>
				<li><a href="<c:url value="/add_child" />" role="button">Add child</a></li>
				<li><a href="<c:url value="/view_points" />" role="button">View geopoints of child</a></li>
				<li><a href="<c:url value="/personal_cabinet" />" role="button">Personal cabinet</a></li>
				<li><a href="<c:url value="/user_manual" />">Help</a></li>
				<li><a href="<c:url value="/mobile_user_manual" />">Mobile app info</a></li>
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
<div class = "container content">
	<h1>Manual for mobile application</h1>
	<br/>
	<br/>
	<h2>Guide for installation:</h2>
	<div>1) Download apk file on your phone.</div>
	<div>
		<div>Link for download from our site: </div>
		<div><a href="/wimk/resources/core/distributions/app-debug.apk">app-debug.apk</a></div>
	</div>
	<div>
		<div>Link for download from google drive: </div>
		<div><a href="https://docs.google.com/uc?authuser=0&id=0B50OqEYAM1b8d0l6U0c3UVNhY1U&export=download">app-debug.apk</a></div>
	</div>
	<div>2) In your phone file explorer click on this file.</div>
	<div>3) During the installation, allow access to the Internet and geolocation services</div>
	<h3>Possible warnings</h3>
	<div> On your phone disabled installation of unknown applications: </div>
	<div> For resolve this problem. Follow next steps:</div>
	<div> 1) Go to settings of your phone.</div>
	<div> 2) Come in "Security" settings.</div>
	<div> 3) Enable "Unknown sources. Allow installation of non-Market apps.".</div>
</div>
</body>
</html>