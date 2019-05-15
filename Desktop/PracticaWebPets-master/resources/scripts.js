function enlace (evento){
	$("#section").html('<div class="loader"><img src="resources/123456789.gif">cargando...</div>');
	$("#section").fadeOut(200, function(){
		$("#section").load(evento).fadeIn(2000);
	});
	return false;	
}