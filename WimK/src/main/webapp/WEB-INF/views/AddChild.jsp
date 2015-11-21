<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add new child</title>
</head>
<body>
	<div align="center">
        <form:form action="add_child" method="post" commandName="userForm">
            <table border="0">
                <tr>
                    <td colspan="2" align="center"><h2>Spring MVC Form Demo - Add child</h2></td>
                </tr>
                <tr>
          		    <td>Child name:</td>
				<td><form:input path="login" required="required" pattern="[A-Za-z0-9]{6,20}" /></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" value="Add child" /></td>
                </tr>
            </table>
        </form:form>
        <a href="<c:url value="/" />" role="button">Back</a>
    </div>
</body>
</html>