function validateSendingFrequyncyField(){
	value = document.getElementById("sending_frequency").value;
	if(value >= 5 && value <= 90){
		return true;
	}
	return false;
}

document.getElementById("sending_frequency").oninput = function(){
	if(validateSendingFrequyncyField()){
		document.getElementById("sending_frequency_remark").innerHTML = "";
	} else {
		document.getElementById("sending_frequency_remark").innerHTML = "Sending frequency must be number between 5 and 90 minutes";
	}
};
alert(1);
$('#editChildForm').submit(function() {
	  if(!validateSendingFrequyncyField()){
		  return false;
	  }
	  return true;
});