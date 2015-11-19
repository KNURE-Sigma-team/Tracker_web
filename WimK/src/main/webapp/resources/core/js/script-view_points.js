function dateChanged(){
	var e1 = document.getElementById('dateSelect');
	var e2 = document.getElementById('childLogin');
	
	document.location = 'view_points?currentChild='+e2.options[e2.selectedIndex].value+'&date='+e1.options[e1.selectedIndex].value;
}
function childChanged(){
	var e = document.getElementById('childLogin');
	document.location = 'view_points?currentChild='+e.options[e.selectedIndex].value;
}