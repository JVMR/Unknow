
function verificarFirma(){

	$.ajax({
		type: 'GET',
		url: 'GestionarRES?operacion=validarFirma',
		data: 'txtIdUsuario='+$('#txtIdUsuario').val()+'&txtDNI='+$('#txtDNI').val()+'&txtContrasena='+$('#txtContrasena').val(),
		statusCode: {
			404: function(){
				console.log('Página no encontrada');
			},
			500: function(){
				console.log('Error en el servidor');
			}
		},
		success: function(dados){
			alert(dados);
		}
	});
	return false;
}