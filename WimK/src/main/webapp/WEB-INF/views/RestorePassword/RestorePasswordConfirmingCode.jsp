<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post">
		<div>Enter Security Code</div>
		<div>Please check your email for a message with your code. Your code is 10 characters long.</div>
		<div><input type="text" name="code" /></div>
		<div><input type="submit" value="Continue"/></div>
	</form>
	<a href="<c:url value="/login" />">Cancel</a>
</body>
</html>