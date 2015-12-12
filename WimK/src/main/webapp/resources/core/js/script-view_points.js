function dateChanged(){
	var e1 = document.getElementById('dateSelect');
	var e2 = document.getElementById('childLogin');
	
	document.location = 'view_points?currentChild='+e2.options[e2.selectedIndex].value+'&date='+e1.options[e1.selectedIndex].value;
}
function childChanged(){
	var e = document.getElementById('childLogin');
	document.location = 'view_points?currentChild='+e.options[e.selectedIndex].value;
}
function whereIsChild(){
	document.getElementById('resultWhereIsChildQuery').innerHTML = "";
	$.ajax({
		type: "POST",
		url:  "/wimk/where_is_child",
		data: "child=" + document.getElementById("childLogin").value,
		success : function(message){
			if(message == "OK"){
				setTimeout(setOkResult, 500);
			} else {
				setTimeout(setNotOkResult, 500);
			}
		}
	});
}
function setOkResult(){
	document.getElementById('resultWhereIsChildQuery').innerHTML = "Request has sent. Reload this page in 1-2 minutes";
}
function setNotOkResult(){
	document.getElementById('resultWhereIsChildQuery').innerHTML = "Service can't request location of your child, now";
}