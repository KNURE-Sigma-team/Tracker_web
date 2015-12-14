<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel = "shortcut icon" href="/wimk/resources/core/images/favicon.ico" />
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,700&subset=latin,cyrillic' rel='stylesheet' type='text/css'/>

<spring:url value="/resources/core/js/style-add_child.css" var="addChildCss" />
<spring:url value="/resources/core/js/script-add_child.js" var="addChildJs" />
<spring:url value="/resources/core/js/jquery-2.1.4.js" var="jquery" />
<spring:url value="/resources/core/css/style-add_child.css" var="addChildCss" />

<link href="${addChildCss}" rel="stylesheet" type="text/css" />

<script src="${jquery}" type="text/javascript"></script>
<spring:url value="/resources/core/css/bootstrap.css" var="bootstrapCss" />
<spring:url value="/resources/core/css/bootstrap.js" var="bootstrapJs" />
<spring:url value="/resources/core/css/style.css" var="styleCss" />

<link href="${personalCabinetCss}" rel="stylesheet" type="text/css" />
<link href="${bootstrapCss}" rel="stylesheet" type="text/css" />
<link href="${styleCss}" rel="stylesheet" type="text/css" />

<title>Add new child</title>
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

	<div align="center" class = "container content">
	    <h2  class = "form-signin-heading">Add your child</h2>
	    <div class = "simple_form">
        <form class = "form add-child-form" action="add_child" method="post" enctype="multipart/form-data" >
          		<div class="row">
          			<!-- <label for = "login">Child name:</label> -->
	          		<div class="col-md-5 col-md-offset-1">
	          			<img id="child_avatar" src="/wimk/resources/core/images/child_avatars/default.png" />
	             		<input id="input_child_avatar" type="file" name="avatar" accept="image/jpeg,image/png" onchange="readURL(this);"/>
	          		</div>
	          		<div class="col-md-4 col-md-offset-1">
						<input class = "form-control" placeholder = "Child's name" name="login" required="required" pattern="[A-Za-z0-9]{3,20}" />
		               	${error}
						<input class = "btn btn-success btn-block" type="submit" value="Add child" />
					</div>
          		</div>
        </form>
        </div>
    </div>
<script src="${addChildJs}" type="text/javascript"></script>
</body>
</html>