<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<spring:url value="/resources/core/css/style-personal_cabinet.css"
	var="personalCabinetCss" />
<spring:url value="/resources/core/css/bootstrap.css" var="bootstrapCss" />
<spring:url value="/resources/core/css/bootstrap.js" var="bootstrapJs" />

<link href="${personalCabinetCss}" rel="stylesheet" type="text/css" />
<link href="${bootstrapCss}" rel="stylesheet" type="text/css" />

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
			<tr>
				<td><a href="<c:url value='/edit_profile' />">Edit profile</a></td>
			</tr>
		</table>
	</div>
	<br />
	<br />
	<br />
	<div>
		<c:choose>
			<c:when test="${fn:length(listOfChild) gt 0}">
				Children:
				<div class="container">
					<c:forEach items="${listOfChild}" var="child" varStatus="status">
						<c:if test="${status.index % 2 == 0}">
							<div class="row">
						</c:if>
						<div class="child col-md-6">
							<div>
								<spring:url value="${child.avatar}" var="imageChild" />
								<img id="child_avatar" src="${imageChild}"/>
							</div>
							<div>login: <c:out value="${child.login}" /></div>
							<div>sending frequency: <c:out value="${child.sendingFrequency}" /> minutes </div>
							<form action="edit_child">
								<input type="hidden" name="child" value="${child.login}" /> 
								<input type="submit" value="edit" />
							</form>
						</div>
						<c:if test="${status.index % 2 == 1}">
							</div>
						</c:if>
					</c:forEach>
					<c:if test="${fn:length(listOfChild) % 2 == 1}">
							<div class="child col-md-6">
								<a href="<c:url value="/add_child" />">Add child</a>
							</div>
						</div>
					</c:if>
					<c:if test="${fn:length(listOfChild) % 2 == 0}">
						<div class="row">
							<div class="child col-md-6">
								<a href="<c:url value="/add_child" />">Add child</a>
							</div>
						</div>
					</c:if>
				</div>
			</c:when>
			<c:otherwise>
					Your have not registered your child yet
					<a href="<c:url value="/add_child" />">Add child</a>
			</c:otherwise>
		</c:choose>
	</div>
	<div align="center">
		<a href="<c:url value='/' />">Back</a>
	</div>

	<script src="${bootstrapJs}" type="text/javascript"></script>
</body>
</html>