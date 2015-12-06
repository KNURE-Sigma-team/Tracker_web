<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<spring:url value="/resources/core/css/bootstrap.css" var="bootstrapCss" />
<spring:url value="/resources/core/css/style.css" var="styleCss" />
<spring:url value="/resources/core/css/bootstrap.js" var="bootstrapJs" />
<link href="${bootstrapCss}" rel="stylesheet" type="text/css" />
<link href="${styleCss}" rel="stylesheet" type="text/css" />

<title>Registration</title>
</head>
<body>
	<div class="container center" align="center">
		<div id = "message"> ${restore_password_message} </div>
		<div class = "form_group">
			<c:url value="/j_spring_security_check" var="loginUrl" />
			<form action="${loginUrl}" method="post" class="form-signin">

				<h2 class = "form-signin-heading">Please sign in</h2>
					<input type="text" name="j_username" placeholder="Login"
							required autofocus class="form-control"/></td>
					<input type="password" name="j_password"
							placeholder="Password" required class="form-control"/>
					<button type="submit" class = "btn btn-lg btn-success btn-block">Log in</button>
				<div id = "error"> ${error_message} </div>
			</form>
			</div>
			<form action="restore_password">
				<button type="submit" class = "btn btn-warning">Forgot password?</button>
			</form>
        <a href="<c:url value="/" />">Back</a>			
	</div>

</body>
</html>