var flagPasswordStrength = false;

document.getElementById("new_password").oninput = function(){
	var pas = document.getElementById("new_password").value;
	var result = validatePassword(pas);
	if(result == passwordAccept){
		result = passwordStrength(pas);
		if(result == passwordTypes[1] || result == passwordTypes[0]){
			flagPasswordStrength = false;
		} else {
			flagPasswordStrength = true;
		}
	} else {
		flagPasswordStrength = false;
	}
	document.getElementById("new_password_remark").innerHTML = result.toString();
};

function checkEmpty(){
	var flag = false;
	if(document.getElementById("old_password").value.length == 0){
		document.getElementById("old_password_remark").innerHTML = "field can't be empty";
		flag = true;
	} else {
		document.getElementById("old_password_remark").innerHTML = "";
	}
	if(document.getElementById("new_password").value.length == 0){
		document.getElementById("new_password_remark").innerHTML = "field can't be empty";
		flag = true;
	} else {
		if(document.getElementById("new_password_remark").innerHTML == "field can't be empty"){
			document.getElementById("new_password_remark").innerHTML = "";
		}
	}
	if(document.getElementById("confirm_password").value.length == 0){
		document.getElementById("confirm_password_remark").innerHTML = "field can't be empty";
		flag = true;
	} else {
		if(document.getElementById("confirm_password_remark").innerHTML == "field can't be empty"){
			document.getElementById("confirm_password_remark").innerHTML = "";
		}
	}
	return flag;
}

function checkEqual(){
	if(document.getElementById("new_password").value != document.getElementById("confirm_password").value){
		document.getElementById("confirm_password_remark").innerHTML = "New password and Confirm password must be same";
		return false;
	}
	return true;
}

$('#changePasForm').submit(function() {
	  if(checkEmpty()){
		  return false;
	  }
	  if(!checkEqual()){
		  return false;
	  }
	  return flagPasswordStrength;
});