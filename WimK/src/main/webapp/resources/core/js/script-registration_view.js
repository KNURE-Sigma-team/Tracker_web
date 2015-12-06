var flagPasswordStrength = false;
var passwordsIsEqual = false;

function setViewInvalidPassword(invalidText){
	setImageInvalidPassword(document.getElementById("new_password_remark_image"));
	document.getElementById("new_password_remark").innerHTML = invalidText;
}

function setViewBadPassword(){
	setImageBadPassword(document.getElementById("new_password_remark_image"));
	setTextBadPassword(document.getElementById("new_password_remark"));
}

function setViewFairPassword(){
	setImageFairPassword(document.getElementById("new_password_remark_image"));
	setTextFairPassword(document.getElementById("new_password_remark"));
}

function setViewGoodPassword(){
	setImageGoodPassword(document.getElementById("new_password_remark_image"));
	setTextGoodPassword(document.getElementById("new_password_remark"));
}

function setViewStrongPassword(){
	setImageStrongPassword(document.getElementById("new_password_remark_image"));
	setTextStrongPassword(document.getElementById("new_password_remark"));
}

function ready() {
    document.getElementById("new_password_remark_image").style.visibility = "hidden";
    document.getElementById("new_password_remark").style.visibility = "hidden";
  }

document.addEventListener("DOMContentLoaded", ready);

document.getElementById("new_password").oninput = function(){
    document.getElementById("new_password_remark_image").style.visibility = "visible";
    document.getElementById("new_password_remark").style.visibility = "visible";
	var pas = document.getElementById("new_password").value;
	var result = validatePassword(pas);
	if(result == passwordAccept){
		result = passwordStrength(pas);
		flagPasswordStrength = true;
		switch (result){
			case passwordTypes[1]:
				setViewBadPassword();
				break;
			case passwordTypes[2]:
				setViewFairPassword();
				break;
			case passwordTypes[3]:
				setViewGoodPassword();
				break;
			case passwordTypes[4]:
				setViewStrongPassword();
				break;
		}
	} else {
		setViewInvalidPassword(result);
		flagPasswordStrength = false;
	}
};

document.getElementById("confirm_password").oninput = function(){
	if(document.getElementById("new_password").value != document.getElementById("confirm_password").value){
		document.getElementById("confirm_password_remark").innerHTML = "Passwords must be same";
		passwordsIsEqual = false;
	} else {
		document.getElementById("confirm_password_remark").innerHTML = "";
		passwordsIsEqual = true;
	}	
};

$('#registrationForm').submit(function() {
	  return flagPasswordStrength && passwordsIsEqual;
});