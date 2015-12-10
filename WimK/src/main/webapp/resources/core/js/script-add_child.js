function readURL(input) {
	if (input.files && input.files[0]) {
		if(input.files[0].size < 10485760){
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#child_avatar').attr('src', e.target.result)
			};
			reader.readAsDataURL(input.files[0]);
			document.getElementById("error").innerHTML = "";
		} else {
			document.getElementById("error").innerHTML = "Avatar size must be less then 10 MB";
			input.value = "";
		}
	}
}