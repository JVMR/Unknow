

function verificarFirma(){
	var pdf;
	

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

			var ver=dados.substring(0,4);
			
			if(ver=='data'){
				'################################################################################################################################################'
				
				
				$.ajax({
			           type: 'GET',
			           url: 'GestionarRES?operacion=visarRES',
			           data: 'id='+$('#txtIdRES').val()+'&tipo=2',
			           statusCode: {
			               404: function() {
			                   console.log('Pagina no encontrada');
			               },
			               500: function(){
			                   console.log('Error en el servidor');
			               }
			           },
			           success: function(datos){
			        	   '==========================================================================================================='
			        	   var fechaGenerado;
			        	   var referencia;
			        	   var Descriptor;
			        	   var objetoConsulta;
			        	   var analisis;
			        	   var idLES;
			        	   var idAsalariado;
			        	   var nombrePrimerEmpleado;
			        	   var dniPrimerEmpleado;
			        	   
	   
			        	   pegadados = datos.split("{");
			        	   for(var i=0; i<pegadados.length -1; i++){
			        		   if(i==0){
			        			    fechaGenerado=pegadados[i].split("{"); 
			        		   }else if(i==1){
			        			    referencia=pegadados[i].split("{"); 
			        		   }else if(i==2){
			        			    Descriptor=pegadados[i].split("{");
			        		   }else if(i==3){
			        			    objetoConsulta=pegadados[i].split("{");
			        		   }else if(i==4){
			        			    analisis=pegadados[i].split("{");
			        		   }else if(i==5){
			        			   idLES=pegadados[i].split("{");
			        		   }else if(i==6){
			        			   idAsalariado=pegadados[i].split("{");
			        		   }else if(i==7){
			        			   nombrePrimerEmpleado=pegadados[i].split("{");
			        		   }else if(i==8){
			        			   dniPrimerEmpleado=pegadados[i].split("{");
			        		   }
			        	   }
			        	   
			   				
			   				$.ajax({
			   					type: 'GET',
			   					url: 'GestionarRES?operacion=visarRES',
			   					data: 'id='+$('#txtIdRES').val()+'&tipo=3',
			   					statusCode: {
			   					 404: function() {
					                   console.log('Pagina no encontrada');
					               },
					               500: function(){
					                   console.log('Error en el servidor');
					               }
			   					},
			   					success: function(firma){
				   				
					   				var doc = new jsPDF();
					   				
					   				doc.setFontType('bold');
					   				doc.text(50, 20, 'INSTITUTO NACIONAL DE REHABILITACI\u00d3N - \n');
					   				doc.text(60, 27, 'DRA. ADRIANA REBAZA FLOREZ \n');
					   						    				
					   				doc.setFont("courier");
					   				doc.setFontType("normal");
					   				doc.setFontSize(13);
					   				doc.text(20, 50, 'PARA   : Director General\n');
					   				doc.text(20, 57, 'DE     : PERSONA QUE HICE RES\n');
					   				doc.text(20, 63, 'ASUNTO : Resoluci\u00f3n de Solicitud de LES\n');
					   				doc.text(20, 70, 'FECHA  : '+fechaGenerado+'\n' );

					   				doc.setFont("times");
					   				doc.setFontType("bold");
					   				doc.setFontSize(12);
					   				doc.text(20, 90, 'REFERENCIA: \n');

					   				doc.setFont("courier");
					   				doc.setFontType("normal");
					   				doc.setFontSize(13);
					   				doc.text(50,95, referencia+'\n');

					   				doc.setFont("times");
					   				doc.setFontType("bold");
					   				doc.setFontSize(12);
					   				doc.text(20, 110, 'DESCRIPTOR: \n');

					   				doc.setFont("courier");
					   				doc.setFontType("normal");
					   				doc.setFontSize(13);
					   				doc.text(50,115, Descriptor+'\n');

					   				doc.setFont("times");
					   				doc.setFontType("bold");
					   				doc.setFontSize(12);
					   				doc.text(20, 130, 'OBJETO DE CONSULTA: \n');

					   				doc.setFont("courier");
					   				doc.setFontType("normal");
					   				doc.setFontSize(13);
					   				doc.text(50,140, objetoConsulta+'\n');

					   				doc.setFont("times");
					   				doc.setFontType("bold");
					   				doc.setFontSize(12);
					   				doc.text(20, 150, 'AN\u00c1LISIS: \n');

					   				doc.setFont("courier");
					   				doc.setFontType("normal");
					   				doc.setFontSize(13);
					   				doc.text(50,160, analisis+'\n');

					   				doc.setFont("helvetica");
					   				doc.setFontType("normal");
					   				doc.setFontSize(12);
					   				doc.text(20, 180, 'El asalariado en cumplimiento con las normas legales establecida por el  Congreso de la \n Rep\u00fablica del Per\u00fa, la Ley 29344 - El Marco de'+
					   				'Aseguramiento Universal en Salud, la Ley \n 29761 - Ley de'+
					   				'Financiamiento P\u00fablico de los Reg\u00edmenes Subsidiado y Semicontributivo \n'+
					   				'del Aseguramiento Universal en Salud, el Decreto Legislativo 276 aprobado con el decreto \n supremo 005-90-PCM.')

					   				doc.setFont("helvetica");
					   				doc.setFontType("normal");
					   				doc.setFontSize(12);
					   				doc.text(20, 210, 'Por tanto, se resuelve que la licencia por enfermedad subsidiada con c\u00f3digo '+idLES+' y c\u00f3digo \n de asalariado '+idAsalariado+' es previamente'+
					   				' ES APROBADO por el an\u00e1lisis mencionado. ');

					   				doc.setFont("helvetica");
					   			    doc.setFontType("normal");
					   			    doc.setFontSize(10);
					   			    doc.text(20, 255, '-------------------------------------------------------------------' );
					   			    doc.text(20, 260, 'Director de Personal : ' +nombrePrimerEmpleado);
					   			    doc.text(20, 265, 'DNI : '+dniPrimerEmpleado);

					   			    
					   			    doc.addImage(dados, 'JPEG', 150, 227, 25, 25);
					   			 doc.addImage(firma, 'JPEG', 35, 227, 25, 25);
					   			    doc.setFont("helvetica");
					   			    doc.setFontType("normal");
					   			    doc.setFontSize(10);
					   			    doc.text(125, 255, '-------------------------------------------------------------------');
					   			    doc.text(125, 260, 'Director Ejecutivo : '+$('#txtEmpleadoNmbres').val());
					   			    doc.text(125, 265, 'DNI : '+$('#txtEmpleadoDNI').val());

					   				
					   			  pdf = doc.output('datauristring');

					   			document.getElementById('rutaPDF').value=pdf;

					   			$('#btnCancelar').click();
					   		
					   			$('iframe').attr('src',  pdf);
					   			
					   			
					   			
					   			$.ajax({
						   			 type: 'GET',
						            url: 'GestionarRES?operacion=actualizarEstadoVisado',
						            data: 'txtIdRES='+$('#txtIdRES').val()+'&rdEstado=9&txtIdEmpleado='+$('#txtIdEmpleado').val()+'&rutaPDF='+pdf,
						            statusCode: {
						                404: function() {
						                    console.log('Pagina no encontrada');
						                },
						                500: function(){
						                    console.log('Error en el servidor');
						                }
						            },
						            success: function(respuesta){
						          	  
						          	  alert(pdf);
						          	var idRES=$('#txtIdRES').val();
						          	  $('#mensaje').attr({
						                    'class': 'alert alert-success alert-dismissable',
						                    'style':'display: block;'
						                  });
						                  $('#iconoMensaje').attr('class','fa fa-check');
						                  $('#contenido').empty();
						                  $('#contenido').append('<b>ESTADO ACTUALIZADO CORECTAMENTE</b><p>La Resoluci\u00f3n de Solicitud de LES n\u00famero  "'+idRES+'"  ha sido rechazado correctamente</p>');
						                  window.scrollTo(0,0);

						                  
						            }
						   			});
					   			
					   			
					   			
			   					}
			   				});
			   				'aca la nueva funtion'
			   				
		
			   				
			   			 
			        	  '==========================================================================================================='
			           }
			       }); 
				
				
				
				
			
				'################################################################################################################################################'
			}else{
				$('#btnCancelar').click();
				$('#mensaje').attr({
					'class': 'alert alert-danger alert-dismissable',
					'style':'display: block;'
				});
				$('#iconoMensaje').attr('class','fa fa-ban');
				$('#contenido').empty();
				$('#contenido').append('<b>ERROR!</b><p>'+dados+'</p>');
				window.scrollTo(0,0);
				
			}			 
		}
	});
	return false;
}

