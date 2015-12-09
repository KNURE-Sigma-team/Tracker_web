<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel = "shortcut icon" href="/wimk/resources/core/images/favicon.ico" />

<spring:url value="/resources/core/js/password.js" var="pasJs" />
<spring:url value="/resources/core/js/script-registration_view.js" var="pasViewJs" />
<spring:url value="/resources/core/js/jquery-2.1.4.js" var="jquery" />
<spring:url value="/resources/core/css/bootstrap.css" var="bootstrapCss" />
<spring:url value="/resources/core/css/style.css" var="styleCss" />
<spring:url value="/resources/core/css/bootstrap.js" var="bootstrapJs" />
<link href="${bootstrapCss}" rel="stylesheet" type="text/css" />
<link href="${styleCss}" rel="stylesheet" type="text/css" />

<script src="${pasJs}" type="text/javascript"></script>
<script src="${jquery}" type="text/javascript"></script>
<title>Registration</title>
</head>
<body>
    <div class = "container" align="center">
    <div class = "row registration">
    <div class="form_group form-signup col-md-12">
        <form:form action="register" method="post" id="registrationForm" commandName="userForm" class="form form-signup">
			<h2 class = "form-heading">Registration</h2>
				<form:input placeholder = "User email" type="email" required="required" path="login" class= "form-control"/>
                <form:password placeholder ="Password" class = "form-control" path="password" id="new_password" required="required" title="Strong password must contain digit, big letter, small letter, special character"/>
                 <input placeholder = "Confirm password" type="password" id="confirm_password" required="required" class = "form-control" />
                 <div id="confirm_password_remark"></div>
                 <form:input path="name" placeholder = "Username" required="required" pattern="[A-Za-z0-9][A-Za-z0-9 ]{4,16}" class = "form-control"/>
                 <button type="submit" value="Register" class = "btn btn-lg btn-success btn-block"> Sign up </button>
        </form:form>
           <a href="<c:url value="/" />">Back</a>
   </div>
   <div class = "col-md-6">
    <div class = "col-md-3">
   <div id="new_password_remark">Too short</div>
    <div ><img id="new_password_remark_image" src="/wimk/resources/core/images/pasword_strength/invalid_password.png" /></div>
   </div>
        <div id = error>${error_message}</div>
        <script src="${pasViewJs}" type="text/javascript"></script>
    </div>
    </div>
   </div>

</body>
</html>