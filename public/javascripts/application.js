// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

/* Scrolls message container to bottom/newest message */
function scroll_to_bottom(){
	// this was how I did it before jQuery
	//document.getElementById('messages_container').scrollTop=document.getElementById('messages_container').scrollHeight;
	// this is how after
	$("#messages_container").animate({ scrollTop: $("#messages_container").attr("scrollHeight") }, 3000);
}

function initialize_page(){
	scroll_to_bottom();
	
	// unobtrusive-ize the submit new message form
	$('#new_message').submit(function (){  
		$.post($(this).attr('action'), $(this).serialize(), null, "script");  
		return false;  
	});
	
	// unobtrusive-ize the nickname form
	$('#change_nickname').submit(function (){  
		$.post($(this).attr('action'), $(this).serialize(), null, "script");  
		return false;  
	});
}
