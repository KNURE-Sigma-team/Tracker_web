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
	$.ajax({
		type: "POST",
		url:  "/wimk/where_is_child",
		data: "child=" + document.getElementById("childLogin").value,
		success : function(message){
			document.getElementById('resultWhereIsChildQuery').innerHTML = "Request has sent. Reload this page in 1-2 minutes";
			setTimeout(clearResultWhereIsChildQuery, 800);
		}
	});
}
function clearResultWhereIsChildQuery(){
	document.getElementById('resultWhereIsChildQuery').innerHTML = "";
}