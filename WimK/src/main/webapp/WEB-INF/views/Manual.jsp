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
				<li><img class = "cover" src = "/wimk/resources/core/images/logo.png" /></li>
				<li><a href="<c:url value="/add_child" />" role="button">Add child</a></li>
				<li><a href="<c:url value="/view_points" />" role="button">View points of child</a></li>
				<li><a href="<c:url value="/personal_cabinet" />" role="button">Personal cabinet</a></li>
				<li><a href="<c:url value="/user_manual" />">Help</a></li>
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
	<h1>User manual</h1>
	<br/>
	<br/>
	<br/>
	<h2>Content</h2>
	<ul>
		<li><a href="#terms">Terms</a></li>
		<li>
			<a href="#mapView">Map View</a>
			<ul>
				<li><a href="#changeMode">change mode</a></li>
				<li><a href="#viewChildPoints">view child points</a></li>
				<li><a href="#demandCurrentLocationOfChild">demand current location of child</a></li>
				<li><a href="#addArea">add area</a></li>
				<li><a href="#changeAreaCenter">change area center</a></li>
				<li><a href="#changeAreaSize">change area size</a></li>
				<li><a href="#changeAreaName">change area name</a></li>
				<li><a href="#changeAreaType">change area type</a></li>
				<li><a href="#removeArea">remove area</a></li>
			</ul>
		</li>
		<li>
			<a href="#personalCabinet">Personal cabinet</a>
			<ul>
				<li><a href="#changePassword">change password</a></li>
				<li><a href="#editPersonalData">edit personal data</a></li>
				<li><a href="#addNewChild">add new child</a></li>
				<li><a href="#editChild">edit child</a></li>
				<li><a href="#removeChild">remove child</a></li>
			</ul>
		</li>
		<li><a href="#otherQuestions">Other Questions</a></li>
	</ul>
	<br/>
	<br/>
	<h2><a name="terms"/></a>Terms</h2>
		<p>Point - is point on the map, which contain coordinated, time and battery status. Points are sending by children from phone.</p>
		<p>Point can be four types:</p>
		<ul style="list-style-type:none">
			<li>1. Common. It is point which sending from child phone every "child frequency" minutes. Mark as blue point. <img src="/wimk/resources/core/images/points/point.png" /></li>
			<li>2. SOS. It is point which sending from child phone when you child press SOS button on phone. Mark as big red point. Notification that your child press this button will send on your email.<img src="/wimk/resources/core/images/points/point_sos.png" /></li>
			<li>3. On demand point. It is point which sending from child phone every case when you press button "Where is my child" on map view. Mark as blue point with red exclamation point inside.<img src="/wimk/resources/core/images/points/point_on_demand.png" /></li>
			<li>4. Stored point. It is point which can't send on time (Absent connection with WimK service), saved on phone and sending while connection appear. Mark as grey point.<img src="/wimk/resources/core/images/points/point_storaged.png" /></li>
		</ul>
		<p><b>Note:</b> The maximum phone can save points only for two days.</p>
	<p>
		Area - is area on the map. Area can be allowed and forbidden
		Forbidden area. If your child send to WimK common point, on demand point or stored point which locate into forbidden area, then WimK send message on your email with information about this situation.
		Allowed area. If your child send to WimK common point, on demand point or stored point which locate outside all allowed areas, then WimK send message on your email with information about this situation.
	 </p>
	
	<br/>
	<br/>
	<h2><a name="mapView"/></a>Map view</h2>
	<p> 
		Map view is page where you can view points of your child and add, edit and remove areas. This page contain two modes:
		1. View mode. In this mode you can view points of child.
		2. Edit mode. In this mode you can add, edit and remove areas.
	</p>
	<p> To get to the page, press  menu item "View points of child" in top menu </p>
	
	<h3><a name="changeMode"/></a>Change mode</h3>
	<p> For change mode of page, follow next steps: </p> 
	<p> 1) Press button "Change mode".</p>
	<img class="guide_image" src="/wimk/resources/core/images/user_manual/ChangeMode.png" />
	
	<h3><a name="viewChildPoints"/></a>View child points</h3>
	<p> For view points of child for current day, follow next steps: </p>
	<p> 1) You must be in view mode.</p> 
	<p> 2) Select child from drop menu "Child", which points you want to view.</p>
	<img class="guide_image" src="/wimk/resources/core/images/user_manual/ViewChildPoints1.png" />
	<p> 3) Select date from drop menu "Date", which points you want to view.</p>
	<img class="guide_image" src="/wimk/resources/core/images/user_manual/ViewChildPoints2.png" />
	<p> 4) All points for this day will show on the map.</p>
	<img class="guide_image" src="/wimk/resources/core/images/user_manual/ViewChildPoints3.png" />
	<p> <b>Note:</b> Default location of pointer on the map is coordinates of last point, if there are not points then center of the biggest allowed area, otherwise will show center of Earth. </p>
	<p> <b>Note:</b> If your child sent several points with same coordinates, draw only one point (image which will be image last send point). Information about all points show in point title </p>
	<p> <b>Note:</b> To get title of point, you must cover point by mouse and wait some time</p>
	<p> <b>Note:</b> To scale map use mouse wheel</p>
	
	<h3><a name="demandCurrentLocationOfChild"/></a>Demand current location of child</h3>
	<p> For see current location of child, follow next steps: </p>
	<p> 1) You must be in view mode.</p> 
	<p> 2) Press button "See where is my child"</p>
	<img class="guide_image" src="/wimk/resources/core/images/user_manual/DemandCurrentLocationOfChild1.png" />
	<p> 2.1) If this reuqest is possible show message "Request has sent. Reload this page in 1-2 minutes". </p>
	<img class="guide_image" src="/wimk/resources/core/images/user_manual/DemandCurrentLocationOfChild2.png" />
	<p> 3) Reload page in 1 - 2 minutes. In most browsers, it can do by pressing "F5".</p>
	<p> <b>Note:</b> If you authorize child in several devices, then will demand location only last child. </p>
	<p> <b>Note:</b> If you authorize child in several devices and logout last authorize. Point will not demand. </p>
	
	<h3><a name="addArea"/></a>Add area</h3>
	<p> For add area, follow next steps: </p>
	<p> 1) You must be in edit mode.</p> 
	<img class="guide_image" src="/wimk/resources/core/images/user_manual/EditMode.png" />
	<p> 2) Select circle symbol from menu on top of the map.</p>
	<img class="guide_image" src="/wimk/resources/core/images/user_manual/AddArea1.png" />
	<p> 3) Bring mouse cursor on the map.</p>
	<p> 4) Press down left button of mouse.</p>
	<p> 5) Bring cursor to any side.</p>
	<img class="guide_image" src="/wimk/resources/core/images/user_manual/AddArea2.png" />
	<p> 6) Press up left mouse button </p>
	<img class="guide_image" src="/wimk/resources/core/images/user_manual/AddArea3.png" />
	<p> 7) Press button "Confirm changes" for save this area on server </p>
	<p> <b>Note:</b> Area will be added only for current child which select in drop menu.</p>
	<img class="guide_image" src="/wimk/resources/core/images/user_manual/AddArea4.png" />

	<h3><a name="changeAreaCenter"/></a>Change area center</h3>
	<p> For edit area center, follow next steps: </p>
	<p> 1) You must be in edit mode.</p> 
	<img class="guide_image" src="/wimk/resources/core/images/user_manual/EditMode.png" />
	<p> 2) Select hand symbol from menu on top of the map.</p>
	<img class="guide_image" src="/wimk/resources/core/images/user_manual/HandSymbol.png" />
	<p> 3) Select area which you want change by clicking left button of mouse into area location</p>
	<p> <b>Note:</b> If one area cover other. And you click in intersection will select newer area</p>
	<img class="guide_image" src="/wimk/resources/core/images/user_manual/ClickOnCircle.png" />
	<p> 4) Bring mouse cursor to center of area (small white circle in area center) which you want to change.</p>
	<img class="guide_image" src="/wimk/resources/core/images/user_manual/ChangeAreaCenter1.png" />
	<p> 5) Drag area where you want.</p>
	<img class="guide_image" src="/wimk/resources/core/images/user_manual/ChangeAreaCenter2.png" />
	<p> 6) Press button "Confirm changes" for save this changes on server </p>
	<p> <b>Note:</b> Area will be changed only for current child which select in drop menu.</p>
	<img class="guide_image" src="/wimk/resources/core/images/user_manual/ChangeAreaCenter3.png" />

	<h3><a name="changeAreaSize"/></a>Change area size</h3>
	<p> For edit area size, follow next steps: </p>
	<p> 1) You must be in edit mode.</p> 
	<img class="guide_image" src="/wimk/resources/core/images/user_manual/EditMode.png" />
	<p> 2) Select hand symbol from menu on top of the map.</p>
	<img class="guide_image" src="/wimk/resources/core/images/user_manual/HandSymbol.png" />
	<p> 3) Select area which you want change by clicking left button of mouse into area location</p>
	<p> <b>Note:</b> If one area cover other. And you click in intersection will select newer area</p>
	<img class="guide_image" src="/wimk/resources/core/images/user_manual/ClickOnCircle.png" />
	<p> 4) Bring mouse cursor to size marker of area (small white circle on top, bottom, left, tight sides) which you want to change.</p>
	<img class="guide_image" src="/wimk/resources/core/images/user_manual/ChangeAreaSize1.png" />
	<p> 5) Press down left button of mouse.</p>
	<p> 6) Bring cursor any side and change area size.</p>
	<p> 7) Press up left mouse button </p>
	<p> 8) Press button "Confirm changes" for save this changes on server </p>
	<p> <b>Note:</b> Area will be changed only for current child which select in drop menu.</p>
	<img class="guide_image" src="/wimk/resources/core/images/user_manual/ChangeAreaSize2.png" />

	<h3><a name="changeAreaName"/></a>Change area name</h3>
	<p> For edit area name, follow next steps: </p>
	<p> 1) You must be in edit mode.</p> 
	<img class="guide_image" src="/wimk/resources/core/images/user_manual/EditMode.png" />
	<p> 2) Select hand symbol from menu on top of the map.</p>
	<img class="guide_image" src="/wimk/resources/core/images/user_manual/HandSymbol.png" />
	<p> 3) Select area which you want change by clicking left button of mouse into area location</p>
	<p> <b>Note:</b> If one area cover other. And you click in intersection will select newer area</p>
	<img class="guide_image" src="/wimk/resources/core/images/user_manual/ClickOnCircle.png" />
	<p> 4) Input area name what are you want for this area in "Area name" field</p>
	<img class="guide_image" src="/wimk/resources/core/images/user_manual/ChangeAreaName1.png" />
	<p> 5) Press button "Confirm changes" for save this changes on server </p>
	<p> <b>Note:</b> Area will be changed only for current child which select in drop menu.</p>
	<img class="guide_image" src="/wimk/resources/core/images/user_manual/ChangeAreaName2.png" />

	<h3><a name="changeAreaType"/></a>Change area type</h3>
	<p> For edit area type, follow next steps: </p>
	<p> 1) You must be in edit mode.</p> 
	<img class="guide_image" src="/wimk/resources/core/images/user_manual/EditMode.png" />
	<p> 2) Select hand symbol from menu on top of the map.</p>
	<img class="guide_image" src="/wimk/resources/core/images/user_manual/HandSymbol.png" />
	<p> 3) Select area which you want change by clicking left button of mouse into area location</p>
	<p> <b>Note:</b> If one area cover other. And you click in intersection will select newer area</p>
	<img class="guide_image" src="/wimk/resources/core/images/user_manual/ClickOnCircle.png" />
	<p> 4) Press "Change area type" button</p>
	<img class="guide_image" src="/wimk/resources/core/images/user_manual/ChangeAreaType1.png" />
	<p> 5) Press button "Confirm changes" for save this changes on server </p>
	<p> <b>Note:</b> Area will be changed only for current child which select in drop menu.</p>
	<img class="guide_image" src="/wimk/resources/core/images/user_manual/ChangeAreaType2.png" />

	<h3><a name="removeArea"/></a>Remove area</h3>
	<p> For edit area type, follow next steps: </p>
	<p> 1) You must be in edit mode.</p> 
	<img class="guide_image" src="/wimk/resources/core/images/user_manual/EditMode.png" />
	<p> 2) Select hand symbol from menu on top of the map.</p>
	<img class="guide_image" src="/wimk/resources/core/images/user_manual/HandSymbol.png" />
	<p> 3) Select area which you want remove by clicking left button of mouse into area location</p>
	<p> <b>Note:</b> If one area cover other. And you click in intersection will select newer area</p>
	<img class="guide_image" src="/wimk/resources/core/images/user_manual/ClickOnCircle.png" />
	<p> 4) Press "Remove area" button</p>
	<img class="guide_image" src="/wimk/resources/core/images/user_manual/RemoveArea1.png" />
	<p> 5) In pop-up window press "OK" </p>
	<img class="guide_image" src="/wimk/resources/core/images/user_manual/RemoveArea2.png" />
	<p> 6) Press button "Confirm changes" for save this changes on server </p>
	<p> <b>Note:</b> Area will be removed only for current child which select in drop menu.</p>
	<img class="guide_image" src="/wimk/resources/core/images/user_manual/RemoveArea3.png" />
	
	<br/>
	<br/>
	<h2><a name="personalCabinet"/></a>Personal cabinet</h2>
	<p> Personal cabinet is page where you can view, add and edit personal data and information about your child. </p>
	<p> To get to the page, press  menu item "Personal cabinet" in top menu </p>
	
	<h3><a name="changePassword"/></a>Change password</h3>
	<p>For change password follow next steps: </p>
	<p> 1) Press button "Change password", so that go to special page for change password</p>
	<img class="guide_image" src="/wimk/resources/core/images/user_manual/ChangePassword1.png" />
	<p> 2) Input your old password in field "Old password".	</p>
	<img class="guide_image" src="/wimk/resources/core/images/user_manual/ChangePassword2.png" />
	<p> 3) Input your new password in field "New password"</p>
	<img class="guide_image" src="/wimk/resources/core/images/user_manual/ChangePassword3.png" />
	<p> 4) Input your new password again in field "Confirm password", for confirm your password</p>
	<p> <b>Note:</b> Must be filled all fields. Otherwise you can't change password.</p>
	<p> <b>Note:</b> New password and old password must be same. Otherwise you can't change password.</p>
	<p> <b>Note:</b> Length of new password must be between 8 and 20 characters. Otherwise you can't change password.</p>
	<div> 
		<b>Note:</b> Password strength showed color line near "New password".
		<p> Strength password must contain at least one big latin letter, one small latin letter, one number, ones special symbol </p>
	</div> 
	<img class="guide_image" src="/wimk/resources/core/images/user_manual/ChangePassword4.png" />
	<p> 5) After filling all fields press button "Change password" for confirm changes</p>
	<p> <b>Note:</b> If old password is wrong, after pressing button "Change password" will be show label "Old password is wrong" </p>
	<img class="guide_image" src="/wimk/resources/core/images/user_manual/ChangePassword5.png" />
	<p> 6) In success case you will go to personal cabinet</p>

	<h3><a name="editPersonalData"/></a>Edit personal data</h3>
	<p>For edit personal data (name, removing frequency) of you account follow next steps:</p>
	<p>	<b>Note:</b> If you want ot change your email you must contact with suppert team - company.wimk@gmail.com. </p>
	<p> 1) Press button "Edit profile", so that go to special page for edit profile</p>
	<img class="guide_image" src="/wimk/resources/core/images/user_manual/EditProfile1.png" />
	<p> 2) Input your right name in field "Name"</p>
	<p>	<b>Note:</b> Value of name can contain only latin characters, numbers and symbol of space; and must length between 4 and 16 symbols</p>
	<img class="guide_image" src="/wimk/resources/core/images/user_manual/EditProfile2.png" />
	<p>	3) Input removing frequency that you want in field "Removing frequency". Removing frequency is the value of days that our system stores location points of your children.</p>
	<p> <b>Note:</b> Field "Removing frequency" can contain only numbers. Number in field cannot be smaller than 5 or bigger than 90 days. 
	<img class="guide_image" src="/wimk/resources/core/images/user_manual/EditProfile3.png" />
	<p> 4) After filling all fields press button "Change profile" for confirm changes</p>
	<img class="guide_image" src="/wimk/resources/core/images/user_manual/EditProfile4.png" />
	<p> 5) In success case you will go to personal cabinet</p>

	<h3><a name="addNewChild"/></a>Add new child</h3>
	<p>For add child follow next steps: </p>
	<p> 1) Press button "Add child" in end of child list, so that go to special page for add child </p>
	<img class="guide_image" src="/wimk/resources/core/images/user_manual/AddChild1.png" />
	<p> 2) Input login of child in field "Login"</p>
	<p> <b>Note:</b> Child login can contain only latin characters and numbers and must length between 4 and 20 symbols</p>	
	<img class="guide_image" src="/wimk/resources/core/images/user_manual/AddChild2.png" />
	<p> 3) Option: Select child avatar you must press button "Choose file" and choose image from files on your computer.</p>
	<p> <b>Note:</b> Format of child avatars must by PNG (.png) or JPEG (.jpg).</p>
	<p> <b>Note:</b> Size of child avatars must less than 10 MB.</p>
	<p> <b>Note:</b> If You don't select child WimK automatically set default avatar for your child.</p>
	<p> <b>Note:</b> Field "Removing frequency" by default set in 30 minutes.</p>
	<img class="guide_image" src="/wimk/resources/core/images/user_manual/AddChild3.png" />
	<p> 4) After filling all fields press button "Save child" for confirm changes</p>
	<img class="guide_image" src="/wimk/resources/core/images/user_manual/AddChild4.png" />
	<p> 5) In success case you will go to personal cabinet</p>

	<h3><a name="editChild"/></a>Edit child</h3>
	<p>For change child information follow next steps: </p>
	<p> 1) Press button "edit" under child which you want to change, so that go to special page for edit child</p>
	<img class="guide_image" src="/wimk/resources/core/images/user_manual/EditChild1.png" />
	<p> 2) For change child login you must input right login of child in field "Login"</p>
	<p> <b>Note:</b> Child login can contain only latin characters and numbers and must length between 4 and 20 symbols</p>
	<img class="guide_image" src="/wimk/resources/core/images/user_manual/EditChild2.png" />
	<p>	3) For change sending frequency you must input sending frequency that you want in field "Sending frequency". Sending frequency is the frequency of sending location coordinates from your child to server.</p>
	<p> <b>Note:</b> Field "Removing frequency" can contain only numbers. Number in field cannot be smaller than 5 or bigger than 90 minutes. </p>
	<img class="guide_image" src="/wimk/resources/core/images/user_manual/EditChild3.png" />
	<p> 4) For change child avatar you must press button "Choose file" and choose image from files on your computer.</p>
	<p> <b>Note:</b> Format of child avatars can be only PNG (.png) or JPEG (.jpg).</p>
	<img class="guide_image" src="/wimk/resources/core/images/user_manual/EditChild4.png" />
	<p> 5) After filling all fields press button "Save child" for confirm changes</p>
	<img class="guide_image" src="/wimk/resources/core/images/user_manual/EditChild5.png" />
	<p> 6) In success case you will go to personal cabinet</p>
	
	<h3><a name="removeChild"/></a>Remove child</h3>
	<p>For remove child information follow next steps: </p>
	<p> 1) Press button "edit" under child which you want to remove, so that go to special page for edit child</p>
	<img class="guide_image" src="/wimk/resources/core/images/user_manual/EditChild1.png" />
	<p> 2) Press button "Remove child". </p>
	<img class="guide_image" src="/wimk/resources/core/images/user_manual/RemoveChild.png" />
	<p> 3) In pop-up window press "OK" </p>
	<img class="guide_image" src="/wimk/resources/core/images/user_manual/RemoveChild2.png" />
	<p> 4) In success case you will go to personal cabinet</p>
	<br/>
	<br/>
	<h2><a name="otherQuestions"/></a>Other Questions</h2>
	<p>If you did not find there ask on your question. Contact with our support team - company.wimk@gmail.com. </p>
</div>
</body>
</html>