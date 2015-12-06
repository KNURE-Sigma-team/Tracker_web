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
<spring:url value="/resources/core/js/script-edit_profile.js" var="editProfileJs" />
<spring:url value="/resources/core/js/jquery-2.1.4.js" var="jquery" />
<spring:url value="/resources/core/css/bootstrap.css" var="bootstrapCss" />
<spring:url value="/resources/core/css/style.css" var="styleCss" />
<spring:url value="/resources/core/css/bootstrap.js" var="bootstrapJs" />
<link href="${bootstrapCss}" rel="stylesheet" type="text/css" />
<link href="${styleCss}" rel="stylesheet" type="text/css" />

<script src="${jquery}" type="text/javascript"></script>

<title>Edit profile</title>
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
<div class = "content container">
<form id="editProfileForm" method="post">
			Login:
			<div style="font-size:14pt"> ${parent.login} <span style="font-size:10pt" title="If you want to change login, then contact with support team."> (?)</span></div>
			Name:
			<input class = "form-control" name="name" required="required" pattern="[A-Za-z0-9][A-Za-z0-9 ]{4,16}" value="${parent.name}"/>
			Removing frequency
			<div class="input-group">
				<input class = "form-control"  id= "removing_frequency" name="removing_frequency" type="text" value="${parent.removingFrequency}"/>
				<span class="input-group-addon">days</span>
			</div>
			<div id="removing_frequency_remark">${invalid_sending_frequency}</div>
			<button class = "btn btn-success pull-right btn-lg" type="submit">Change profile </button>
</form>
</div>
<script src="${editProfileJs}" type="text/javascript"></script>
</body>
</html>