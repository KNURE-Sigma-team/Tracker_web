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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel = "shortcut icon" href="/wimk/resources/core/images/favicon.ico" />
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,700&subset=latin,cyrillic' rel='stylesheet' type='text/css'/>

<spring:url value="/resources/core/css/style-personal_cabinet.css"
	var="personalCabinetCss" />
<spring:url value="/resources/core/css/bootstrap.css" var="bootstrapCss" />
<spring:url value="/resources/core/css/bootstrap.js" var="bootstrapJs" />
<spring:url value="/resources/core/css/style.css" var="styleCss" />

<link href="${personalCabinetCss}" rel="stylesheet" type="text/css" />
<link href="${bootstrapCss}" rel="stylesheet" type="text/css" />
<link href="${styleCss}" rel="stylesheet" type="text/css" />

<title>Personal cabinet</title>
</head>
<body>

<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container">
        <ul class="nav navbar-nav">
        <li><a href="<c:url value="/personal_cabinet" />"><img class = "cover" src = "/wimk/resources/core/images/logo.png" /></a></li>
        <li><a href="<c:url value="/add_child" />" role="button">Add child</a></li>
        <li><a href="<c:url value="/view_points" />" role="button">View geopoints of child</a></li>
        <li><a href="<c:url value="/personal_cabinet" />" role="button">Personal cabinet</a></li>
        <li><a href="<c:url value="/user_manual" />">Help</a></li>
        <li><a href="<c:url value="/mobile_user_manual" />">Mobile app info</a></li>
        </ul>
	<div class = "navbar-right">
	<sec:authorize access="isAuthenticated()">
	<p class="email">
		<sec:authentication property="principal.username" />
	</p>
	</sec:authorize>
	<a href="<c:url value="/logout" />" role="button">Sign out</a>
	</div>
  </div>
</nav>

	<div class = "content info" align="center">
		<table>
			<tr>
				<td>Your name:</td>
				<td>${parent.name}</td>
			</tr>
			<tr>
				<td>Your child's points are stored for :</td>
				<td>${parent.removingFrequency} days</td>
			</tr>
			<tr>
				<td><a class="btn btn-info" href="<c:url value='/change_password' />">Change
						password</a></td>
				<td><a class="btn btn-info" href="<c:url value='/edit_profile' />">Edit profile</a></td>
			</tr>
		</table>
	</div>
	<div class = "container" align = "center">
		<c:choose>
			<c:when test="${fn:length(listOfChild) gt 0}">
				<div class="container">
					<c:forEach items="${listOfChild}" var="child" varStatus="status">
						<c:if test="${status.index % 2 == 0}">
							<div class="row">
						</c:if>
						<div class="child col-md-6">
							<div>
								<spring:url value="${child.avatar}" var="imageChild" />
								<a href="view_points?currentChild=${child.login}">
								<img id="child_avatar" src="${imageChild}"/>
								</a>
							</div>
							<div>login: <c:out value="${child.login}" /></div>
							<div>sending frequency: <c:out value="${child.sendingFrequency}" /> minutes </div>
							<form action="edit_child">
								<input type="hidden" name="child" value="${child.login}" /> 
								<button class = "btn btn-primary" type="submit" value="edit">Edit</button>
							</form>
						</div>
						<c:if test="${status.index % 2 == 1}">
							</div>
						</c:if>
					</c:forEach>
					<c:if test="${fn:length(listOfChild) % 2 == 1}">
							<div class="child col-md-6">
							<br />
							<br />
							<br />
							<br />	
							<br />
								<a href="<c:url value="/add_child" />" class="btn btn-success" role="button">Add child</a>
							</div>
						</div>
					</c:if>
					<c:if test="${fn:length(listOfChild) % 2 == 0}">
						<div class="row">
							<div class="child col-md-6">
							<br />
							<br />
							<br />
							<br />
							<br />						
								<a href="<c:url value="/add_child" />" class="btn btn-success" role="button">Add child</a>
							</div>
						</div>
			</c:if>
				</div>
			</c:when>
			<c:otherwise>
					Your have not registered your child yet
					<a href="<c:url value="/add_child" />" class="btn btn-success" role="button">Add child</a>
			</c:otherwise>
		</c:choose>
	</div>

	<script src="${bootstrapJs}" type="text/javascript"></script>
	
</body>
</html>