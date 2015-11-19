function validateRemovingFrequyncyField(){
	value = document.getElementById("removing_frequency").value;
	if(value >= 5 && value <= 90){
		return true;
	}
	return false;
}

document.getElementById("removing_frequency").oninput = function(){
	if(validateRemovingFrequyncyField()){
		document.getElementById("removing_frequency_remark").innerHTML = "";
	} else {
		document.getElementById("removing_frequency_remark").innerHTML = "Removing frequency must be number between 5 and 90 days";
	}
};

$('#editProfileForm').submit(function() {
	  if(!validateRemovingFrequyncyField()){
		  return false;
	  }
	  return true;
});