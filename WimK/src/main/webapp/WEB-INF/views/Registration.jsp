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

<spring:url value="/resources/core/js/password.js" var="pasJs" />
<spring:url value="/resources/core/js/script-registration_view.js" var="pasViewJs" />
<spring:url value="/resources/core/js/jquery-2.1.4.js" var="jquery" />

<script src="${pasJs}" type="text/javascript"></script>
<script src="${jquery}" type="text/javascript"></script>
<title>Registration</title>
</head>
<body>
    <div align="center">
        <form:form action="register" method="post" id="registrationForm" commandName="userForm">
            <table border="0">
                <tr>
                    <td colspan="2" align="center"><h2>Registration</h2></td>
                </tr>
                <tr>
          		    <td>User E-mail:</td>
				<td><form:input type="email" required="required" path="login"/></td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td><form:password path="password" id="new_password" required="required"/></td>
                    <td>
                        <div>
                            <div id="new_password_remark">Too short</div>
                            <div ><img id="new_password_remark_image" src="/wimk/resources/core/images/pasword_strength/invalid_password.png" /></div>
                        </div>
                    </td>
                </tr>
				<tr>
                    <td>Confirm password:</td>
                    <td><input type="password" id="confirm_password" required="required"/></td>
                    <td><div id="confirm_password_remark"></div></td>
                </tr>
                <tr>
                    <td>Name:</td>
                    <td><form:input path="name"  required="required" pattern="[A-Za-z0-9][A-Za-z0-9 ]{4,16}"/></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" value="Register" /></td>
                </tr>
            </table>
        </form:form>
        <div id = error>${error_message}</div>
        <a href="<c:url value="/login" />">Back</a>
        <script src="${pasViewJs}" type="text/javascript"></script>
    </div>
</body>
</html>