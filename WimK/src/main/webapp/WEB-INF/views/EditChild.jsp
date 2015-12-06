<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
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

<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container">
        <ul class="nav navbar-nav">
        <li><img class = "cover" src = "http://cs612117.vk.me/u59503884/docs/13f4436f9f33/logo1.png" /></li>
        <li><a href="<c:url value="/add_child" />" role="button">Add child</a></li>
        <li><a href="<c:url value="/view_points" />" role="button">View points of child</a></li>
        <li><a href="<c:url value="/personal_cabinet" />" role="button">Personal cabinet</a></li>
        </ul>
	<div class = "navbar-right">
	<sec:authorize access="isAuthenticated()">
	<p>
		<sec:authentication property="principal.username" />
	</p>
	</sec:authorize>
	<a href="<c:url value="/logout" />" role="button">Sign out</a>
	</div>
  </div>
</nav>
<div class = "container content edit_child_form">
<form class = "form simple_form" id="editChildForm" method="post" enctype="multipart/form-data">
	<input class = "form-control" name="old_child_login" type="hidden" value="${child.login}"/>
    <div class = "col-md-8">
    <spring:url value="${child.avatar}" var="imageChild" />
    <img id="child_avatar" src="${imageChild}" />
	<br />
	<br />	
           	<input id="input_child_avatar" type="file" name="avatar" accept="image/jpeg,image/png" onchange="readURL(this);"/>
     		${bad_image}
    </div>
    <div class = "col-md-4">
	<input name="status" type="hidden" value="edit"/>
	<table>
		<tr>
			<td> Login:</td>
			<td><input class = "form-control" name="child_login" type="text" required="required" pattern="[A-Za-z0-9]{4,20}" value="${child.login}"/></td>
			<td>${child_exist}</td>
		</tr>
		<tr>
			<td>Sending frequency</td>
			<td>
				<div class = "input-box">
					<div class="input-group">
						<input class = "form-control" id="sending_frequency" name="sending_frequency" type="text" value="${child.sendingFrequency}"/>
						<span class="input-group-addon">days</span>
					</div>
				 </div>
			 </td>
			<td><div id="sending_frequency_remark">${invalid_sending_frequency}</div></td>
		</tr>
		<tr>
			<td colspan="2">
				<button class = "btn btn-success btn-block" type="submit">Save child</button>
			</td>
		</tr>
	</table>
	</div>
</form>
<form class = "form" method="post">
	<input class = "form-control" name="child_login" type="hidden" value="${child.login}"/>
	<input class = "form-control" name="status" type="hidden" value="remove"/>
	<button class = "btn btn-warning pull-right" type="submit" onClick="return confirm('Are you sure want to remove this child?')"> Remove child</button>
</form>
</div>
<script src="${editChildJs}" type="text/javascript"></script>

</body>
</html>