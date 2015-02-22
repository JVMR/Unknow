
function grabarEstado(obj){
	
	var idRES=document.getElementById('txtIdRES').value;
	var idAprobador=document.getElementById('txtIdEmpleado').value;
	var idEstado;
	var pdf;
	
	if(idRES==0){
		'No hay Resolución'
		
		$('#mensaje').attr({
			'class': 'alert alert-danger alert-dismissable',
			'style':'display: block;'
		});
		$('#iconoMensaje').attr('class','fa fa-ban');
		$('#contenido').empty();
		$('#contenido').append('<b>NO HAY UNA RESOLUCI\u00d3N!</b><p>Primero debe escoger una Resoluci\u00f3n de LES. Por favor, seleccione la opci\u00f3n "Buscar Resoluciones de LES"</p>');
		window.scrollTo(0,0);		
		
		return false;
	}else{
		'°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°° si hay una resolucion  °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°'
		if (!obj.rdEstado[0].checked && !obj.rdEstado[1].checked){
			
			$('#mensaje').attr({
				'class': 'alert alert-warning alert-dismissable',
				'style':'display: block;'
			});
			$('#iconoMensaje').attr('class','fa fa-warning');
			$('#contenido').empty();
			$('#contenido').append('<b>FALTA ELEGIR UNA OPCI\u00d3N DE EVALUACI\u00d3N</b><p>Debe elegir una opci\u00f3n de evaluaci\u00f3n : "Visado" o "Desaprobado"</p>');
			window.scrollTo(0,0);
			return false;
		}else if(!obj.rdEstado[0].checked){
			'-------------------------------------- rechazado ---------------------------------------------'
			
			$('#mensaje').attr('style','display: none');
			window.scrollTo(0,0);
			$.confirm({
				'title'		: 'Confirmaci\u00f3n de Evaluaci\u00f3n',
				'message'	: ' ¿Est\u00e1 seguro que desea rechazar esta Resoluci\u00f3n de LES?',
				'buttons'	: {
					'Si'	: {
						'class'	: 'blue',
						'action': function(){
							
							idEstado=7;
							pdf='no hay';
							
							$.ajax({
						          type: 'GET',
						          url: 'GestionarRES?operacion=actualizarEstadoVisado',
						          data: 'txtIdRES='+idRES+'&rdEstado='+idEstado+'&txtIdEmpleado='+idAprobador+'&pdf='+pdf,
						          statusCode: {
						              404: function() {
						                  console.log('Pagina no encontrada');
						              },
						              500: function(){
						                  console.log('Error en el servidor');
						              }
						          },
						          success: function(datos){
						       	       	  
							       	 $.ajax({ 
							       		 type: 'GET',
								          url: 'GestionarRES?operacion=listaVisarRES',
								          statusCode: {
								              404: function() {
								                  console.log('Pagina no encontrada');
								              },
								              500: function(){
								                  console.log('Error en el servidor');
								              }
								          },
								          success: function(){
								        	  
								        	  'se refresca la pagina para que sea visible el cambio de estado en el modal'
								        	  setTimeout("location.href='GestionarRES?operacion=listaVisarRES'", 8000);
								        	  
								          }
							       	 })
							       	 
							       	$('#mensaje').attr({
						                  'class': 'alert alert-success alert-dismissable',
						                  'style':'display: block;'
						                });
						                $('#iconoMensaje').attr('class','fa fa-check');
						                $('#contenido').empty();
						                $('#contenido').append('<b>ESTADO ACTUALIZADO CORECTAMENTE</b><p>La Resoluci\u00f3n de Solicitud de LES n\u00famero  "'+idRES+'"  ha sido rechazado correctamente</p>');
						                window.scrollTo(0,0);
							       	 
							       	
						          }
						      })
						      							
						}
					},
					'No'	: {
						'class'	: 'gray',
						'action': function(){
							'location.reload(true);'
							$('#pdf').removeAttr('src');
						}	// Nothing to do in this case. You can as well omit the action property.
					}
				}
			});
			
			
			
			return false;
			'-------------------------------------- hasta aca esta rechazado ---------------------------------------------'
		}else{
			'+++++++++++++++++++++++++++++++++++++++++ aprobado +++++++++++++++++++++++++++++++++++++++++++++++'
			
			
			$('#mensaje').attr('style','display: none');
			window.scrollTo(0,0);
			
			$('#mConfirmarFirma').modal('show');
			
			return false;
			'+++++++++++++++++++++++++++++++++++++++++ hasta aca esta aprobado +++++++++++++++++++++++++++++++++++++++++++++++'
		}
		
		return false;
		'°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°° hasta aca hay una resolucion  °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°'
	}
	
	return false;
}




'#############################################################################################################'


