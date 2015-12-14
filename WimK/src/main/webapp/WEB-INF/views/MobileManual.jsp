<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel = "shortcut icon" href="/wimk/resources/core/images/favicon.ico" />

<spring:url value="/resources/core/css/bootstrap.css" var="bootstrapCss" />
<spring:url value="/resources/core/css/bootstrap.js" var="bootstrapJs" />
<spring:url value="/resources/core/css/style.css" var="styleCss" />
<spring:url value="/resources/core/css/style-user_manual.css" var="userManualCss" />

<link href="${bootstrapCss}" rel="stylesheet" type="text/css" />
<link href="${styleCss}" rel="stylesheet" type="text/css" />
<link href="${userManualCss}" rel="stylesheet" type="text/css" />

<title>User manual</title>
</head>
<body style="margin : 10pt">
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container">
			<ul class="nav navbar-nav">
				<li><a href="<c:url value="/personal_cabinet" />" style="padding:  0;"><img class = "cover" src = "/wimk/resources/core/images/logo.png" /></a></li>
				<li><a href="<c:url value="/add_child" />" role="button">Add child</a></li>
				<li><a href="<c:url value="/view_points" />" role="button">View geopoints of child</a></li>
				<li><a href="<c:url value="/personal_cabinet" />" role="button">Personal cabinet</a></li>
				<li><a href="<c:url value="/user_manual" />">Help</a></li>
				<li><a href="<c:url value="/mobile_user_manual" />">Mobile app info</a></li>
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
<div class = "container content">
	<h1>Manual for mobile application</h1>
	<br/>
	<br/>
	<h2>First stages:</h2>
	<div>1) Download apk file on your phone.</div>
	<div>
		<div>Link for download from our site: </div>
		<div><a href="/wimk/resources/core/distributions/app-debug.apk">app-debug.apk</a></div>
	</div>
	<div>
		<div>Link for download from google drive: </div>
		<div><a href="https://docs.google.com/uc?authuser=0&id=0B50OqEYAM1b8dmNXYjVQWnI5WHc&export=download">app-debug.apk</a></div>
	</div>
	<div>2) In your phone file explorer click on this file.</div>
	<div>3) During the installation, allow access to the Internet and geolocation services</div>
	<h3>Possible warnings:</h3>
	<div> <h4>1. On your phone disabled installation of unknown applications: <h4></div>
	<div> For resolve this problem. Follow next steps:</div>
	<div> 1) Go to settings of your phone.</div>
	<div> 2) Come in "Security" settings.</div>
	<div> 3) Enable "Unknown sources. Allow installation of non-Market apps.".</div>
	<br/>
	<h2>Starting work with program</h2>
	<div>After installing the application, on your desktop will appear two shortcuts.</div>
	<br/>
	<img src="/wimk/resources/core/images/mobile_user_manual/icons.png" />
	<br/>
	<br/>
	<div>First icon, called "WinK", opens the login form of our program. </div>
	<div>Second icon, called “SOS”, created to provide easy access to SOS button functionality. </div>
	<br/>
	<div><b>Warning: “SOS” shortcut will not work until you are logining into the application and selecting the child. If You taped “SOS” shortcut before you are logining, then you will get an error message.</b> </div>
	<br/>
	<h2>Login form</h2>
	<div>After clicking on the “WimK” icon will be open login form of our application. See screenshot.</div>
	<img src="/wimk/resources/core/images/mobile_user_manual/login_form.png" />
	<div>This form has two text fields and only one button. To login in application you must input your e-mail and password, which you inputting during registration, in the text fields. After entering this information click on Login button. After successful login you will directed to child selecting form of our application.</div>
	<br/>
	<div><b>Note:</b> Registration are available only in web application. If you forgot your password, you can use “Forgot password?” function in our web application. If your account has only one child, after successful login you will directed to main form of our application.</div>
	<br/>
	<div><b>Warning: If you will try login on account which didn`t has child, you will get an error message. </b> </div>
	<br/>
	<h2>Child selecting form</h2>
	<br/>
	<img src="/wimk/resources/core/images/mobile_user_manual/child_selecting_form.png" />
	<br/>
	<br/>
	<div>On this activity you can tap on child’s name for select child, which will tracked by our application.</div>
	<br/>
	<h2>Main form</h2>
	<br/>
	<img src="/wimk/resources/core/images/mobile_user_manual/main_form.png" />
	<br/>
	<br/>
	<div>This is main form of our application, which provide main functionality. This form has one text label and two buttons. On text label you can see name of your child which tracked on this device at the moment. Here you can start and stop background service, which sending geolocations of your child. </div>
	<br/>
	<img src="/wimk/resources/core/images/mobile_user_manual/start_notification.png" />
	<br/>
	<br/>
	<div>Notification like this will inform you about 	status of background service. </div>
	<br/>
	<div><b>Note:</b>: If you will try start background service with switched off geolocation, you will directed to geolocation settings form for switched their on.</div>
	<br/>
	<div><b>Warning: If you will try start background service with dropped internet connection, geolocation of your child will be storaged on device and you will get an error message.</b></div>
	<br/>
	<h2>Widget of SOS button </h2>
	<br/>
	<img src="/wimk/resources/core/images/mobile_user_manual/widget.png" />
	<br/>
	<br/>
	<div>This is view of widget of  your desktop. Widget is the comfortable way to provide functionality of SOS button to you. By tapped  on widget, your child can send SOS message to us, and we will inform you on email like this:</div>
	<br/>
	<img src="/wimk/resources/core/images/mobile_user_manual/email.png" />
	<br/>
	<br/>
	<br/>
	<h2>Other Questions</h2>
	<p>If you did not find there ask on your question. Contact with our support team - company.wimk@gmail.com. </p>
</div>
</body>
</html>