<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form>
		<table>
			<tr>
				<td>Old password:</td>
				<td><input name="old_password" type="password"/></td>
			</tr>
			<tr>
				<td>New password:</td>
				<td><input name="new_password" type="password"/></td>
			</tr>
			<tr>
				<td>Confirm password:</td>
				<td><input name="confirm_password" type="password"/></td>
			</tr>
			<tr>
				<td><input type="submit" value="Change password"/></td>
			</tr>
			<tr>
				<td><a href="<c:url value="/personal_cabinet" />" role="button">Back</a></td>
			</tr>
		</table>
	</form>
</body>
</html>