<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel = "shortcut icon" href="/wimk/resources/core/images/favicon.ico" />
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,700&subset=latin,cyrillic' rel='stylesheet' type='text/css'/>

<spring:url value="/resources/core/css/bootstrap.css" var="bootstrapCss" />
<spring:url value="/resources/core/css/style.css" var="styleCss" />
<spring:url value="/resources/core/css/bootstrap.js" var="bootstrapJs" />
<link href="${bootstrapCss}" rel="stylesheet" type="text/css" />
<link href="${styleCss}" rel="stylesheet" type="text/css" />

<title>WimK</title>
</head>
<body>
<sec:authorize access="isAuthenticated()">
<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container">
        <ul class="nav navbar-nav">
        <li><img class = "cover" src = "/wimk/resources/core/images/logo.png" /></li>
        <li><a href="<c:url value="/add_child" />" role="button">Add child</a></li>
        <li><a href="<c:url value="/view_points" />" role="button">View points of child</a></li>
        <li><a href="<c:url value="/personal_cabinet" />" role="button">Personal cabinet</a></li>
        <li><a href="<c:url value="/user_manual" />">Help</a></li>
        
        </ul>
	<div class = "navbar-right">
	<p>
		<sec:authentication property="principal.username" />
	</p>
		<a href="<c:url value="/logout" />" role="button">Sign out</a>
	</div>
  </div>
  </nav>
</sec:authorize>	
 <div class = "container" align="center">
		<img src = "https://psv4.vk.me/c610627/u59503884/docs/1047d2e69890/logo.png?extra=Wg93_7_-okoQlyhjTrGaqLYiRKyv_s0XCbQcDvlBIxawh1Kjwj85steHgWnZaRnRr7npY0Gm-Vp8fwnxIefq4DeqcIe_be9G"/>
		<h1>WimK.com is free and helpful</h1>
		<div class = "desc" style="margin-bottom:3%">
		<p class = "text-centered">“Where is my kid” (WimK) – is a service that track location your child in order to parents know where was his child. Mobile application install to child phone in order to determine child location and send this data to server, which save data in database. Later, parent can view this data. Also parents can create allowed and forbidden areas in order to when his child leave from allowed area or come into forbidden area parent can get a message about this situation. Also SOS button will be on child phone in order to child can report about critical situation.</p>
		</div>
		<div style="background:url(http://cs610124.vk.me/u32958192/docs/539a27a6496d/gFM_5z3vVYk.png)">
		</div>
		<sec:authorize access="!isAuthenticated()">
			<div class = "login-group">
			<form action="register">
				<button type="submit" class = "btn btn-lg btn-success">Register. It's free...</button>
			</form>
			<p>
				<a href="<c:url value="/login" />" role="button">Sign in</a>
			</p>
			</div>
		</sec:authorize>
	</div>

</body>
</html>
