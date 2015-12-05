<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<spring:url value="/resources/core/css/bootstrap.css" var="bootstrapCss" />
<spring:url value="/resources/core/css/bootstrap.js" var="bootstrapJs" />
<link href="${personalCabinetCss}" rel="stylesheet" type="text/css" />
<link href="${bootstrapCss}" rel="stylesheet" type="text/css" />

<title>User manual</title>
</head>
<body>
	<h5>User manual</h5>
	
	<h3>Terms</h3>
	<p> 
		Point - is point on the map, which contain coordinated, time and battery status. Points are sending by children from phone.
		Point can be four types:
		1. Common. It is point which sending from child phone every "child frequency" minutes. Mark as blue point.
		2. SOS. It is point which sending from child phone when you child press SOS button on phone. Mark as big red point. Notification that your child press this button will send on your email.
		3. On demand point. It is point which sending from child phone every case when you press button "Where is my child" on map view. Mark as blue point with red exclamation point inside.
		4. Stored point. It is point which can't send on time (Absent connection with WimK service), saved on phone and sending while connection appear. Mark as grey point
		Note: The maximum phone can save points only for two days.
	</p>
	<p>
		Area - is area on the map. Area can be allowed and forbidden
		Forbidden area. If your child send to WimK common point, on demand point or stored point which locate into forbidden area, then WimK send message on your email with information about this situation.
		Allowed area. If your child send to WimK common point, on demand point or stored point which locate outside all allowed areas, then WimK send message on your email with information about this situation.
	 </p>
	
	
	<h3>Map view</h3>
	<p> 
		Map view is page where you can view points of your child and add, edit and remove areas. This page contain two modes:
		1. View mode. In this mode you can view points of child.
		2. Edit mode. In this mode you can add, edit and remove areas.
	</p>
	<p> To get to the page, press  menu item "View points of child" in top menu </p>
	
	<h2>Change mode</h2>
	<p> For change mode of page, follow next steps: </p> 
	<p> 1) Press button "Change mode".</p>
	
	<h2>View child points</h2>
	<p> For view points of child for current day, follow next steps: </p>
	<p> 1) You must be in view mode.</p> 
	<p> 2) Select child from drop menu "Child", which points you want to view.</p>
	<p> 3) Select date from drop menu "Date", which points you want to view.</p>
	<p> 4) All points for this day will show on the map.</p>
	<p> Note: Default location of pointer on the map is center of center of the biggest allowed area, otherwise is center of Earth. </p>
	<p> Note: To scale map use mouse wheel</p>
	
	<h2>Demand current location of child</h2>
	<p> For see current location of child, follow next steps: </p>
	<p> 1) You must be in view mode.</p> 
	<p> 2) Press button "See where is my child"</p>
	<p> 3) Reload page in 1 - 2 minutes</p>
	<p> Note: If you authorize child in several devices, then will demand location only last child. </p>
	<p> Note: If you authorize child in several devices and logout last authorize. Point will not demand. </p>
	
	<h2>Add area</h2>
	<p> For add area, follow next steps: </p>
	<p> 1) You must be in edit mode.</p> 
	<p> 2) Select circle symbol from menu on top of the map.</p>
	<p> 3) Bring mouse cursor on the map.</p>
	<p> 4) Press down left button of mouse.</p>
	<p> 5) Bring cursor to any side.</p>
	<p> 6) Press up left mouse button </p>
	<p> 7) Press button "Confirm changes" for save this area on server </p>
	<p> Note: Area will be added only for current child which select in drop menu.</p>
	
	<h2>Change area center</h2>
	<p> For edit area center, follow next steps: </p>
	<p> 1) You must be in edit mode.</p> 
	<p> 2) Select hand symbol from menu on top of the map.</p>
	<p> 3) Select area which you want change by clicking left button of mouse into area location</p>
	<p> Note: If one area cover other. And you click in intersection will select newer area</p>
	<p> 4) Bring mouse cursor to center of area (small white circle in area center) which you want to change.</p>
	<p> 5) Press down left button of mouse.</p>
	<p> 6) Bring cursor to location where you want to be center of area.</p>
	<p> 7) Press up left mouse button </p>
	<p> 8) Press button "Confirm changes" for save this changes on server </p>
	<p> Note: Area will be changed only for current child which select in drop menu.</p>
	
	<h2>Change area size</h2>
	<p> For edit area size, follow next steps: </p>
	<p> 1) You must be in edit mode.</p> 
	<p> 2) Select hand symbol from menu on top of the map.</p>
	<p> 3) Select area which you want change by clicking left button of mouse into area location</p>
	<p> Note: If one area cover other. And you click in intersection will select newer area</p>
	<p> 4) Bring mouse cursor to size marker of area (small white circle on top, bottom, left, tight sides) which you want to change.</p>
	<p> 5) Press down left button of mouse.</p>
	<p> 6) Bring cursor any side and change area size.</p>
	<p> 7) Press up left mouse button </p>
	<p> 8) Press button "Confirm changes" for save this changes on server </p>
	<p> Note: Area will be changed only for current child which select in drop menu.</p>
	
	<h2>Change area name</h2>
	<p> For edit area name, follow next steps: </p>
	<p> 1) You must be in edit mode.</p> 
	<p> 2) Select hand symbol from menu on top of the map.</p>
	<p> 3) Select area which you want change by clicking left button of mouse into area location</p>
	<p> Note: If one area cover other. And you click in intersection will select newer area</p>
	<p> 4) Input area name what are you want for this area in "Area name" field</p>
	<p> 5) Press button "Confirm changes" for save this changes on server </p>
	<p> Note: Area will be changed only for current child which select in drop menu.</p>
	
	<h2>Change area type</h2>
	<p> For edit area type, follow next steps: </p>
	<p> 1) You must be in edit mode.</p> 
	<p> 2) Select hand symbol from menu on top of the map.</p>
	<p> 3) Select area which you want change by clicking left button of mouse into area location</p>
	<p> Note: If one area cover other. And you click in intersection will select newer area</p>
	<p> 4) Press "Change area type" button</p>
	<p> 5) Press button "Confirm changes" for save this changes on server </p>
	<p> Note: Area will be changed only for current child which select in drop menu.</p>
	
	<h2>Remove</h2>
	<p> For edit area type, follow next steps: </p>
	<p> 1) You must be in edit mode.</p> 
	<p> 2) Select hand symbol from menu on top of the map.</p>
	<p> 3) Select area which you want remove by clicking left button of mouse into area location</p>
	<p> Note: If one area cover other. And you click in intersection will select newer area</p>
	<p> 4) Press "Remove area" button</p>
	<p> 5) In pop-up window press "OK" </p>
	<p> 6) Press button "Confirm changes" for save this changes on server </p>
	<p> Note: Area will be removed only for current child which select in drop menu.</p>
	
	
	
	<h3>Personal cabinet</h3>
	<p> Personal cabinet is page where you can view, add and edit personal data and information about your child. </p>
	<p> To get to the page, press  menu item "Personal cabinet" in top menu </p>
	
	<h2>For change password follow next steps: </h2>
	<p> 1) Press button "Change password", so that go to special page for change password</p>
	<p> 2) Input your old password in field "Old password".	</p>
	<p> 3) Input your new password in field "New password"</p>
	<p> 4) Input your new password again in field "Confirm password", for confirm your password</p>
	<p> Note: Must be filled all fields. Otherwise you can't change password.</p>
	<p> Note: New password and old password must be same. Otherwise you can't change password.</p>
	<p> Note: Length of new password must be between 8 and 20 characters. Otherwise you can't change password.</p>
	<div> 
		Note: Password strength showed color line near "New password".
		<p> Strength password must contain at least one big latin letter, one small latin letter, one number, ones special symbol </p>
	</div> 
	<p> 5) After filling all fields press button "Change password" for confirm changes</p>
	<p> Note: If old password is wrong, after pressing button "Change password" will be show label "Old password is wrong" </p>
	<p> 6) In success case you will go to personal cabinet</p>
	
	<h2>For edit personal data (name, removing frequency) of you account follow next steps: </h2>
	<p> 1) Press button "Edit profile", so that go to special page for edit profile</p>
	<p> 2) Input your right name in field "Name"</p>
	<p>	Note: Value of name can contain only latin characters, numbers and symbol of space; and must length between 4 and 16 symbols</p>
	<p>	3) Input removing frequency that you want in field "Removing frequency". Removing frequency is the value of days that our system stores location points of your children.</p>
	<p> Note: Field "Removing frequency" can contain only numbers. Number in field cannot be smaller than 5 or bigger than 90 days. 
	<p> 4) After filling all fields press button "Change profile" for confirm changes</p>
	<p> 5) In success case you will go to personal cabinet</p>
	
	<h2>For add child follow next steps: </h2>
	<p> 1) Press button "Add child" in end of child list, so that go to special page for add child </p>
	<p> 2) Input login of child in field "Login"</p>
	<p> Note: Child login can contain only latin characters and numbers and must length between 4 and 20 symbols</p>	
	<p> 3) Option: Select child avatar you must press button "Choose file" and choose image from files on your computer.</p>
	<p> Note: Format of child avatars can be only PNG (.png) or JPEG (.jpg).</p>
	<p> Note: If You don't select child WimK automatically set default avatar for your child.</p>
	<p> Note: Field "Removing frequency" by default set in 30 minutes.</p>
	<p> 4) After filling all fields press button "Save child" for confirm changes</p>
	<p> 5) In success case you will go to personal cabinet</p>

	<h2>For change child information follow next steps: </h2>
	<p> 1) Press button "edit" under child which you want to change, so that go to special page for edit child</p>
	<p> 2) For change child login you must input right login of child in field "Login"</p>
	<p> Note: Child login can contain only latin characters and numbers and must length between 4 and 20 symbols</p>
	<p>	3) For change sending frequency you must input sending frequency that you want in field "Sending frequency". Sending frequency is the frequency of sending location coordinates from your child to server.</p>
	<p> Note: Field "Removing frequency" can contain only numbers. Number in field cannot be smaller than 5 or bigger than 90 minutes. </p>
	<p> 4) For change child avatar you must press button "Choose file" and choose image from files on your computer.</p>
	<p> Note: Format of child avatars can be only PNG (.png) or JPEG (.jpg).</p>
	<p> 5) After filling all fields press button "Save child" for confirm changes</p>
	<p> 6) In success case you will go to personal cabinet</p>
	
	<h2>For remove child information follow next steps: </h2>
	<p> 1) Press button "edit" under child which you want to remove, so that go to special page for edit child</p>
	<p> 2) Press button "Remove child". </p>
	<p> 3) In pop-up window press "OK" </p>
	<p> 4) In success case you will go to personal cabinet</p>
	
</body>
</html>