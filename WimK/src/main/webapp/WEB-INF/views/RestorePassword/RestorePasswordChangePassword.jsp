<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<spring:url value="/resources/core/js/password.js" var="pasJs" />
<spring:url value="/resources/core/js/script-restore_password_change_password_view.js" var="pasViewJs" />
<spring:url value="/resources/core/js/jquery-2.1.4.js" var="jquery" />
<spring:url value="/resources/core/css/bootstrap.css" var="bootstrapCss" />
<spring:url value="/resources/core/css/style.css" var="styleCss" />
<spring:url value="/resources/core/css/bootstrap.js" var="bootstrapJs" />
<link href="${bootstrapCss}" rel="stylesheet" type="text/css" />
<link href="${styleCss}" rel="stylesheet" type="text/css" />

<script src="${pasJs}" type="text/javascript"></script>
<script src="${jquery}" type="text/javascript"></script>

<title>New password</title>
</head>
<body>
<div class ="content container">
	<form id="changePasForm" method="post" class = "form">
		<table>
			<tr>
				<td><input placeholder = "New password" class = "form-control" id="new_password" name="new_password" type="password" /></td>
				<td>
                    <div>
                        <div id="new_password_remark">Too short</div>
                        <div><img id="new_password_remark_image" src="/wimk/resources/core/images/pasword_strength/invalid_password.png" title="Strong password must contain digit, big letter, small letter, special character"/></div>
                    </div>
                </td>
			</tr>
			<tr>
				<td><input placeholder = "Confirm password" class = "form-control" id="confirm_password" name="confirm_password" type="password" /></td>
				<td><div id="confirm_password_remark"></div></td>
			</tr>
			<tr>
				<td><button type="submit" class="btn btn-success">Change password</button></td>
			</tr>
		</table>
	</form>
	<a href="<c:url value="/login" />">Cancel</a>
	</div>
	<script src="${pasViewJs}" type="text/javascript"></script>
</body>
</html>