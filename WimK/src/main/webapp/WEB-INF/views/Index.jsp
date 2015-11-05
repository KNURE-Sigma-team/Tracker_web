<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Registration</title>
</head>
<body>
	<div align="center">
		<h1>WimK.com</h1>
		<p>WimK - this is service ...</p>
		<sec:authorize access="!isAuthenticated()">
			<p>
				<a href="<c:url value="/login" />" role="button">Sing in</a>
			</p>
		</sec:authorize>
		<sec:authorize access="isAuthenticated()">
			<p>
				Your login:
				<sec:authentication property="principal.username" />
			</p>
			<p>
				<a href="<c:url value="/add_child" />" role="button">Add child</a>
			</p>
			<p>
				<a href="<c:url value="/view_points" />" role="button">View
					points of child</a>
			</p>
			<p>
				<a href="<c:url value="/personal_cabinet" />" role="button">Personal
					cabinet</a>
			</p>
			<p>
				<a href="<c:url value="/logout" />" role="button">Sing out</a>
			</p>
		</sec:authorize>
	</div>
</body>
</html>