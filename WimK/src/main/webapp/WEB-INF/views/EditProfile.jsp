<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<spring:url value="/resources/core/js/script-edit_profile.js" var="editProfileJs" />
<spring:url value="/resources/core/js/jquery-2.1.4.js" var="jquery" />

<script src="${jquery}" type="text/javascript"></script>

<title>Insert title here</title>
</head>
<body>
<form id="editProfileForm" method="post">
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
			<td><input id= "removing_frequency" name="removing_frequency" type="text" value="${parent.removingFrequency}"/> days</td>
			<td><div id="removing_frequency_remark">${invalid_sending_frequency}</div></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="Change profile"/>
			</td>
		</tr>
	</table>
</form>
<a href="<c:url value="/personal_cabinet" />">Back</a>

<script src="${editProfileJs}" type="text/javascript"></script>
</body>
</html>