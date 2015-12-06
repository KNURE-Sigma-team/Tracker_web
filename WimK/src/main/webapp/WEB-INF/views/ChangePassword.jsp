<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<spring:url value="/resources/core/js/password.js" var="pasJs" />
<spring:url value="/resources/core/js/changePasswordView.js"
	var="pasViewJs" />
<spring:url value="/resources/core/js/jquery-2.1.4.js" var="jquery" />

<script src="${pasJs}" type="text/javascript"></script>
<script src="${jquery}" type="text/javascript"></script>
<spring:url value="/resources/core/css/bootstrap.css" var="bootstrapCss" />
<spring:url value="/resources/core/css/bootstrap.js" var="bootstrapJs" />
<spring:url value="/resources/core/css/style.css" var="styleCss" />

<link href="${bootstrapCss}" rel="stylesheet" type="text/css" />
<link href="${styleCss}" rel="stylesheet" type="text/css" />

<title>Change password</title>
</head>
<body>
<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container">
        <ul class="nav navbar-nav">
        <li><img class = "cover" src = "https://psv4.vk.me/c612117/u59503884/docs/710d25190dcc/logo1.png?extra=5vH7LDByJ1q2iiO-nqjFnWavGfWNy7SEf4XakZ9fBgjZyy8PLrOtGChfdvYb8gry1EPyV7ueNBH8_qUG1kUmvmZND_5J88oo" /></li>
        <li><a href="<c:url value="/add_child" />" role="button">Add child</a></li>
        <li><a href="<c:url value="/view_points" />" role="button">View points of child</a></li>
        <li><a href="<c:url value="/personal_cabinet" />" role="button">Personal cabinet</a></li>
        <li><a href="<c:url value="/user_manual" />">Help</a></li>
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
	<c:choose>
		<c:when test="${answer != null}">
			<h2> ${answer} </h2>
		</c:when>
		<c:otherwise>
	    <div class="form-group form">
			<form id="changePasForm" method="post">
						Old password:
						<input class = "form-control" id="old_password" name="old_password" type="password" />
						<div id="old_password_remark">${errorOldPassword}</div>
						New password:
						<input class = "form-control" id="new_password" name="new_password" type="password" title="Strong password must contain digit, big letter, small letter, special character"/>
	                        <div>
	                            <div id="new_password_remark">Too short</div>
	                            <div ><img id="new_password_remark_image" src="/wimk/resources/core/images/pasword_strength/invalid_password.png" /></div>
	                        </div>
						Confirm password:
						<input class = "form-control" id="confirm_password" name="confirm_password" type="password" />
						<div id="confirm_password_remark"></div>
						<button class = "btn btn-success pull-right" type="submit"> Change password</button>
			</form>
	 </div>
		</c:otherwise>
	</c:choose>
</div>
	<script src="${pasViewJs}" type="text/javascript"></script>
</body>
</html>