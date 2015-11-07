<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<td>Login: </td>
			<td><input name="login" type="email" required="required" value="${parent.login}"/></td>
			<td>${parent_exist}</td>
		</tr>
		<tr>
			<td>Name:</td>
			<td><input name="name" required="required" pattern="[A-Za-z0-9][A-Za-z0-9 ]{4,16}" value="${parent.name}"/></td>
		</tr>
		<tr>
			<td>Removing frequency</td>
			<td><input name="removing_frequency" type="text" required="required" pattern="[0-9]{1,3}" value="${parent.removingFrequency}"/></td>
			<td>days</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="Change profile"/>
			</td>
		</tr>
	</table>
</form>
</body>
</html>