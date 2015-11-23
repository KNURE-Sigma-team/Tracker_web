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

<spring:url value="/resources/core/js/style-add_child.css" var="addChildCss" />
<spring:url value="/resources/core/js/script-add_child.js" var="addChildJs" />
<spring:url value="/resources/core/js/jquery-2.1.4.js" var="jquery" />
<spring:url value="/resources/core/css/style-add_child.css" var="addChildCss" />

<link href="${addChildCss}" rel="stylesheet" type="text/css" />

<script src="${jquery}" type="text/javascript"></script>

<title>Add new child</title>
</head>
<body>
	<div align="center" class = >
        <form action="add_child" method="post" enctype="multipart/form-data">
            <table border="0">
                <tr>
                    <td colspan="2" align="center"><h2>Spring MVC Form Demo - Add child</h2></td>
                </tr>
                <tr>
          		    <td>Child name:</td>
				<td><input name="login" required="required" pattern="[A-Za-z0-9]{3,20}" /></td>
                </tr>
                <tr>
                	<td> Child image </td>
                	<td>
                		<input id="input_child_avatar" type="file" name="avatar" accept="image/jpeg,image/png" onchange="readURL(this);"/>
                		<img id="child_avatar" src="/wimk/resources/core/images/child_avatars/default.png" />
                	</td>
                </tr>
                <tr>
                	<td>${error}</td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" value="Add child" /></td>
                </tr>
            </table>
        </form>
        <a href="<c:url value="/" />" role="button">Back</a>
    </div>
    
    <script src="${addChildJs}" type="text/javascript"></script>
</body>
</html>