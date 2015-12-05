<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<spring:url value="/resources/core/js/script-edit_child.js" var="editChildJs" />
<spring:url value="/resources/core/js/jquery-2.1.4.js" var="jquery" />
<spring:url value="/resources/core/css/style-edit_child.css" var="editChildCss" />
<spring:url value="/resources/core/css/bootstrap.css" var="bootstrapCss" />
<spring:url value="/resources/core/css/style.css" var="styleCss" />
<spring:url value="/resources/core/css/bootstrap.js" var="bootstrapJs" />
<link href="${bootstrapCss}" rel="stylesheet" type="text/css" />
<link href="${styleCss}" rel="stylesheet" type="text/css" />

<link href="${editChildCss}" rel="stylesheet" type="text/css" />

<script src="${jquery}" type="text/javascript"></script>
<title>Edit child</title>
</head>
<body>
<form id="editChildForm" method="post" enctype="multipart/form-data">
	<input name="old_child_login" type="hidden" value="${child.login}"/>
	<input name="status" type="hidden" value="edit"/>
	<table>
		<tr>
        	<td> Child image </td>
            <td>
            	<input id="input_child_avatar" type="file" name="avatar" accept="image/jpeg,image/png" onchange="readURL(this);"/>
            	<spring:url value="${child.avatar}" var="imageChild" />
                <img id="child_avatar" src="${imageChild}" />
           	</td>
           	<td>
           		${bad_image}
           	</td>
		</tr>	
		<tr>
			<td>Login: </td>
			<td><input name="child_login" type="text" required="required" pattern="[A-Za-z0-9]{4,20}" value="${child.login}"/></td>
			<td>${child_exist}</td>
		</tr>
		<tr>
			<td>Sending frequency</td>
			<td><input id="sending_frequency" name="sending_frequency" type="text" value="${child.sendingFrequency}"/> minutes </td>
			<td><div id="sending_frequency_remark">${invalid_sending_frequency}</div></td>
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

<script src="${editChildJs}" type="text/javascript"></script>
</body>
</html>