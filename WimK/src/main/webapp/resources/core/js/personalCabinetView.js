var childs = [];
currentChild = 0;

function addChild(login, sendingFrequency){
	childs[currentChild++] = {
		login : login,
		sendingFrequency : sendingFrequency,
	};
}

function viewChild(childNumber){
	document.getElementById("childLogin").innerHTML = childs[childNumber].login;
	document.getElementById("childSendingFrequency").innerHTML = childs[childNumber].sendingFrequency + 'ms';
}

function previousChild(){
	currentChild = (currentChild - 1 + childs.length) % childs.length;
	viewChild(currentChild);
}

function nextChild(){
	currentChild = (currentChild + 1) % childs.length;
	viewChild(currentChild);
}