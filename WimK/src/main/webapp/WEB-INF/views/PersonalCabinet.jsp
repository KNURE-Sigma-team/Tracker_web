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
		<table>
			<tr>
				<td>Your name:</td>
				<td>${parent.name}</td>
			</tr>
			<tr>
				<td>Your email:</td>
				<td>${parent.login}</td>
			</tr>
			<tr>
				<td>Your removing frequency :</td>
				<td>${parent.removingFrequency} days</td>
			</tr>
			<tr>
				<td><a href="<c:url value='/change_password' />">Change
						password</a></td>
			</tr>
		</table>
	</div>
	<br />
	<br />
	<br />
	<div align="center">
		<table>
			<c:choose>
				<c:when test="${currentChild!=null}">
					<tr>
						<td colspan="2"><input type="button" value="previous"
							onclick="previousChild()"> Child <input type="button"
							value="next" onclick="nextChild()"></td>
					</tr>
					<tr>
						<td>login:</td>
						<td><div id="childLogin">${currentChild.login}</div></td>
					</tr>
					<tr>
						<td>sending frequency:</td>
						<td><div id="childSendingFrequency">${currentChild.sendingFrequency} ms</div></td>
					</tr>
				</c:when>
				<c:otherwise>
					<tr>
						<td>Your have not registered your child yet</td>
						<td><a href="<c:url value="/add_child" />">Add child</a></td>
					</tr>
				</c:otherwise>
			</c:choose>
		</table>
	</div>
	<div>
		<a href="<c:url value='/' />">Back</a>
	</div>
</body>
</html>