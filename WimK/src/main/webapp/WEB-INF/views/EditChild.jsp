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
<form method="post">
	<input name="old_child_login" type="hidden" value="${child.login}"/>
	<input name="status" type="hidden" value="edit"/>
	<table>
		<tr>
			<td>Login: </td>
			<td><input name="child_login" type="text" required="required" pattern="[A-Za-z0-9]{4,20}" value="${child.login}"/></td>
			<td>${child_exist}</td>
		</tr>
		<tr>
			<td>Sending frequency</td>
			<td><input name="sending_frequency" type="text" required="required" pattern="[0-9]{1,3}" value="${child.sendingFrequency}"/> minutes</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="Save child"/>
			</td>
		</tr>
	</table>
</form>
<form method="post">
	<input name="child_login" type="hidden" value="${child.login}"/>
	<input name="status" type="hidden" value="remove"/>
	<table>
		<tr>
			<td>
				<input type="submit" value="Remove child" onClick="return confirm('Are you sure want to remove this child?')"/>
			</td>
		</tr>
	</table>
</form>
<a href="<c:url value="/personal_cabinet" />">Back</a>
</body>
</html>