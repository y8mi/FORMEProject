$(document).ready(function(){
  $('#showPassword').on('click', function(){
    var passwordField = $('#password');
    var passwordFieldType = passwordField.attr('type');
    if(passwordFieldType == 'password')
    {
        passwordField.attr('type', 'text');
        $(this).val('Hide');
    } else {
        passwordField.attr('type', 'password');
        $(this).val('Show');
    }
  });
});

$(document).ready(function(){
	  $('#shownewPassword').on('click', function(){
	    var passwordField = $('#newpassword');
	    var passwordFieldType = passwordField.attr('type');
	    if(passwordFieldType == 'password')
	    {
	        passwordField.attr('type', 'text');
	        $(this).val('Hide');
	    } else {
	        passwordField.attr('type', 'password');
	        $(this).val('Show');
	    }
	  });
	});