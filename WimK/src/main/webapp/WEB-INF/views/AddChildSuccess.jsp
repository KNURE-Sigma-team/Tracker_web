<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Successful operation</title>
</head>
<body>
	<div align="center">
        <table border="0">
			<tr>
				<td colspan="2" align="center"><h2>Adding child Succeeded!</h2></td>
			</tr>
			<tr>
				<td>Login:</td>
				<td>${child.login}</td>
			</tr>
		</table>
		<p> <a href="<c:url value="/" />" role="button">To main menu</a></p>
    </div>
</body>
</html>