<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Restore password</title>
<spring:url value="/resources/core/js/jquery-2.1.4.js" var="jquery" />
<spring:url value="/resources/core/css/bootstrap.css" var="bootstrapCss" />
<spring:url value="/resources/core/css/style.css" var="styleCss" />
<spring:url value="/resources/core/css/bootstrap.js" var="bootstrapJs" />
<link href="${bootstrapCss}" rel="stylesheet" type="text/css" />
<link href="${styleCss}" rel="stylesheet" type="text/css" />

<script src="${pasJs}" type="text/javascript"></script>
<script src="${jquery}" type="text/javascript"></script>

</head>
<body>
	<div align="center">
		<c:url value="/restore_password" var="restoreUrl" />
	    <div class="form_group">
			<form action="${restoreUrl}" method="get">
				<h3 class = "form-signin-heading">Password restoration</h2>
				<input type="email" placeholder = "Your email" class = "form-control" required="required" name="email" title="Strong password must contain digit, big letter, small letter, special character"/>
				<div>${email_not_exist}</div>
				<button type="submit" class = "btn btn-success">Restore</button>
			</form>
		</div>
       <a href="<c:url value="/" />">Back</a>
	</div>
	
</body>
</html>