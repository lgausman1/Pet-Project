var petmatch = {};
petmatch.memberSignIn = function() {
	$("#formToggle").on('click', function(e){
		e.preventDefault();
		var modalHeader = $("#myModalLabel").html("Sign In");
		$("#signDiv").hide();
		$("#logDiv").show();
		//more logic
	});
}

petmatch.memberRegister = function() {
	$("#formToggle2").on('click', function(e){
		e.preventDefault();
		var modalHeader = $("#myModalLabel").html("Register");
		$("#logDiv").hide();
		$("#signDiv").show();
		//more logic
	});
}