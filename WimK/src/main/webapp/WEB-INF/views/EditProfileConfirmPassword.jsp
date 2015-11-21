<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
</head>
<body>
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
<a href="<c:url value="/personal_cabinet" />">Cancel</a>
</body>
</html>