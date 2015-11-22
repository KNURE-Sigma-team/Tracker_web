<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<spring:url value="/resources/core/js/password.js" var="pasJs" />
<spring:url value="/resources/core/js/changePasswordView.js"
	var="pasViewJs" />
<spring:url value="/resources/core/js/jquery-2.1.4.js" var="jquery" />

<script src="${pasJs}" type="text/javascript"></script>
<script src="${jquery}" type="text/javascript"></script>

<title>Insert title here</title>
</head>
<body>
	<c:choose>
		<c:when test="${answer != null}">
			${answer}
		</c:when>
		<c:otherwise>
			<form id="changePasForm" method="post">
				<table>
					<tr>
						<td>Old password:</td>
						<td><input id="old_password" name="old_password" type="password" /></td>
						<td><div id="old_password_remark">${errorOldPassword}</div></td>
					</tr>
					<tr>
						<td>New password:</td>
						<td><input id="new_password" name="new_password" type="password" /></td>
						<td>
	                        <div>
	                            <div id="new_password_remark">Too short</div>
	                            <div ><img id="new_password_remark_image" src="/wimk/resources/core/images/pasword_strength/invalid_password.png" /></div>
	                        </div>
	                    </td>
					</tr>
					<tr>
						<td>Confirm password:</td>
						<td><input id="confirm_password" name="confirm_password" type="password" /></td>
						<td><div id="confirm_password_remark"></div></td>
					</tr>
					<tr>
						<td><input type="submit" value="Change password" /></td>
					</tr>
				</table>
			</form>
		</c:otherwise>
	</c:choose>
	<a href="<c:url value="/personal_cabinet" />">Back</a>
	<script src="${pasViewJs}" type="text/javascript"></script>
</body>
</html>