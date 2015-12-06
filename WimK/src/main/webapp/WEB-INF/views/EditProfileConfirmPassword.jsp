<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<spring:url value="/resources/core/css/bootstrap.css" var="bootstrapCss" />
<spring:url value="/resources/core/css/style.css" var="styleCss" />
<spring:url value="/resources/core/css/bootstrap.js" var="bootstrapJs" />
<link href="${bootstrapCss}" rel="stylesheet" type="text/css" />
<link href="${styleCss}" rel="stylesheet" type="text/css" />

<title>Insert title here</title>
</head>
<body>
<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container content">
        <ul class="nav navbar-nav">
        <li><img class = "cover" src = "https://psv4.vk.me/c612117/u59503884/docs/710d25190dcc/logo1.png?extra=5vH7LDByJ1q2iiO-nqjFnWavGfWNy7SEf4XakZ9fBgjZyy8PLrOtGChfdvYb8gry1EPyV7ueNBH8_qUG1kUmvmZND_5J88oo" /></li>
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
<form method="post">
	<table>
		<tr>
			<td>Input your password for confirm changes:</td>
			<td><input name="password" type="password" required="required"/></td>
			<td>${invalid_password}</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="Change profile"/>
			</td>
		</tr>
	</table>
</form>
</div>

<a href="<c:url value="/personal_cabinet" />">Cancel</a>
</body>
</html>