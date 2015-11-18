<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Registration</title>
</head>
<body>
	<div align="center">
		<div id = "message"> ${restore_password_message} </div>
		<c:url value="/j_spring_security_check" var="loginUrl" />
		<form action="${loginUrl}" method="post">
			<table border="0">
				<tr>
					<td><h2>Please sign in</h2></td>
				</tr>
				<tr>
					<td><input type="text" name="j_username" placeholder="Login"
						required autofocus /></td>
				</tr>
				<tr>
					<td><input type="password" name="j_password"
						placeholder="Password" required /></td>
				</tr>
				<tr>
					<td><button type="submit" style="width:210x;height:20px">Войти</button></td>
				</tr>
			</table>
			<div id = "error"> ${error_message} </div>
		</form>
		<form action="register">
			<button type="submit">Registration</button>
		</form>
		<form action="restore_password">
			<button type="submit">Forget password?</button>
		</form>
	</div>
</body>
</html>