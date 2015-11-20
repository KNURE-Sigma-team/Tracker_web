/*
 * Functions for validating password
 */
 const passwordAccept = 'password accept';
 const passwordTooShort = 'Too short';
 const passwordTooLong = 'Too long';
 const passwordConsistSpacebar = 'password cannot consist spacebar';

 function validatePassword(password){
 	for(var i = 0; i < password.length; ++i){
 		if(password.charCodeAt(i) == 32){
 			return passwordConsistSpacebar;
 		}
 	}
 	if(password.length < 8){
 		return passwordTooShort;
 	}
 	if(password.length > 20){
 		return passwordTooLong;
 	}
 	return passwordAccept;
 }

 const passwordTypes = ["invalid password", "Weak", "Fair", "Good", "Strong"];

 function passwordStrength(password){
 	var consistSmallLetter = 0;
 	var consistBigLetter = 0;
 	var consistDigit = 0;
 	var consistOtherChar = 0;
 	var charCode;
 	for(var i = 0; i < password.length; ++i){
 		charCode = password.charCodeAt(i);
 		if(charCode >= 65 && charCode <= 90){
 			consistBigLetter = 1;
 		} else if(charCode >= 97 && charCode <= 122) {
 			consistSmallLetter = 1;
 		} else if(charCode >= 48 && charCode <= 57) {
 			consistDigit = 1;
 		} else {
 			consistOtherChar = 1;
 		}
 	}
 	return passwordTypes[consistBigLetter + consistDigit + consistOtherChar + consistSmallLetter];
 }

function setImageInvalidPassword(img){
 	img.src = "/wimk/resources/core/images/pasword_strength/invalid_password.png";
 }

function setImageBadPassword(img){
 	img.src = "/wimk/resources/core/images/pasword_strength/bad_password.png";
 }

 function setTextBadPassword(element){
 	element.innerHTML = "Bad".fontcolor("#ff0000");
 }

function setImageFairPassword(img){
 	img.src = "/wimk/resources/core/images/pasword_strength/fair_password.png";
 }

 function setTextFairPassword(element){
 	element.innerHTML = "Fair".fontcolor("#ffff00");
 }

function setImageGoodPassword(img){
 	img.src = "/wimk/resources/core/images/pasword_strength/good_password.png";
 }

 function setTextGoodPassword(element){
 	element.innerHTML = "Good".fontcolor("#00a2e8");
 }

 function setImageStrongPassword(img){
 	img.src = "/wimk/resources/core/images/pasword_strength/strong_password.png";
 }

 function setTextStrongPassword(element){
 	element.innerHTML = "Strong".fontcolor("#00cc00");
 }