/*
 * Functions for validating password
 */
const passwordAccept = 'password accept';
const passwordErrorSize = 'password length should be between 8 and 20 characters';
const passwordConsistSpacebar = 'password cannot consist spacebar';

function validatePassword(password){
	for(var i = 0; i < password.length; ++i){
		if(password.charCodeAt(i) == 32){
			return passwordConsistSpacebar;
		}
	}
	if(password.length < 8 || password.length > 20){
		return passwordErrorSize;
	}
	return passwordAccept;
}

const passwordTypes = ["very weak password", "weak password", "middle password", "strong password", "very strong password"];

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