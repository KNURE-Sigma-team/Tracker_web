<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<c:url value="/restore_password" var="restoreUrl" />

		<form action="${restoreUrl}" method="get">
			<table border="0">
				<tr>
					<td><h2>Please type address your email</h2></td>
				</tr>
				<tr>
					<td><input type="text" name="email"/></td>
					<td>${email_not_exist}</td>
				</tr>
				<tr>
					<td colspan="2"><button type="submit" style="width:210x;height:20px">Send</button></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>