<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<spring:url value="/resources/core/js/jquery-2.1.4.js" var="jquery" />
<spring:url value="/resources/core/css/bootstrap.css" var="bootstrapCss" />
<spring:url value="/resources/core/css/style.css" var="styleCss" />
<spring:url value="/resources/core/css/bootstrap.js" var="bootstrapJs" />
<link href="${bootstrapCss}" rel="stylesheet" type="text/css" />
<link href="${styleCss}" rel="stylesheet" type="text/css" />

<script src="${pasJs}" type="text/javascript"></script>
<script src="${jquery}" type="text/javascript"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Confirm restoration</title>
</head>
<body>
	<div class = "container content">
	<form method="post" class = "form">
		<div>Please check your email for a message with your code. Your code is 10 characters long.</div>
		<div><input type="text" class = "form-control" name="code" placeholder = "Security code"/></div>
		<div><button class = "btn btn-primary pull-right" type="submit"/>Continue </button> </div>
	</form>
	<a href="<c:url value="/login" />">Cancel</a>
	</div>
</body>
</html>