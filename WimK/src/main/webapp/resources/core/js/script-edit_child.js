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

$('#editChildForm').submit(function() {
	  if(!validateSendingFrequyncyField()){
		  return false;
	  }
	  return true;
});

function readURL(input) {
	if (input.files && input.files[0]) {
		if(input.files[0].size < 10485760){
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#child_avatar').attr('src', e.target.result)
			};
			reader.readAsDataURL(input.files[0]);
			document.getElementById("image_error").innerHTML = "";
		} else {
			document.getElementById("image_error").innerHTML = "Avatar size must be less then 10 MB";
			input.value = "";
		}
	}
}