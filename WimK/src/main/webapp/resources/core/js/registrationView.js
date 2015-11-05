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

function checkEqual(){
	if(document.getElementById("new_password").value != document.getElementById("confirm_password").value){
		document.getElementById("confirm_password_remark").innerHTML = "Passwords must be same";
		return false;
	}
	return true;
}

$('#registrationForm').submit(function() {
	  if(!checkEqual()){
		  return false;
	  }
	  return flagPasswordStrength;
});