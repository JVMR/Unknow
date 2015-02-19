function grabarEstado(obj){
	
	var idAprobador=document.getElementById('txtIdEmpleado').value;
	var idRES=document.getElementById('txtIdRES').value;
	var tipo=typeof(idRES);
	
	
	var idEstado;
	var pdf;
	
	if(tipo=="string"){
			if (!obj.rdEstado[0].checked && !obj.rdEstado[1].checked){
				alert("Debe elegir una opción de estado")
				'return false;'
			}else if(!obj.rdEstado[0].checked){
				'rechazado'
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
			       	  
			       	  alert('Se actualizó correctamente el estado de la REsolución');
				       	 $.ajax({ 
				       		 type: 'GET',
					          url: 'GestionarRES?operacion=listaVisarRES',
				       		 
				       	 })
			          	
			          }
			      }) 
				
				'return false;'
			}else{
				'aprobado'
				idEstado=9;
				'##############################################################################################################################'
				$.ajax({
			           type: 'GET',
			           url: 'GestionarRES?operacion=visarRES',
			           data: 'id='+id,
			           statusCode: {
			               404: function() {
			                   console.log('Pagina no encontrada');
			               },
			               500: function(){
			                   console.log('Error en el servidor');
			               }
			           },
			           success: function(datos){
			        	  
			        	   var fechaGenerado;
			        	   var referencia;
			        	   var Descriptor;
			        	   var objetoConsulta;
			        	   var analisis;
			        	   var idLES;
			        	   var idAsalariado;
			        	   
			        	   pegadados = datos.split("/");
			        	   for(var i=0; i<pegadados.length -1; i++){
			        		   if(i==0){
			        			    fechaGenerado=pegadados[i].split("/"); 
			        		   }else if(i==1){
			        			    referencia=pegadados[i].split("/"); 
			        		   }else if(i==2){
			        			    Descriptor=pegadados[i].split("/");
			        		   }else if(i==3){
			        			    objetoConsulta=pegadados[i].split("/");
			        		   }else if(i==4){
			        			    analisis=pegadados[i].split("/");
			        		   }else if(i==5){
			        			   idLES=pegadados[i].split("/");
			        		   }else if(i==6){
			        			   idAsalariado=pegadados[i].split("/");
			        		   }
			        	   }
			        	   
			           	var getImageFromUrl = function(url, callback) {
			           		var img = new Image(), data, ret = {
			           			data: null,
			           			pending: true
			           		};
			           		
			           		img.onError = function() {
			           			throw new Error('Cannot load image: "'+url+'"');
			           		};
			           		img.onload = function() {
			           			var canvas = document.createElement('canvas');
			           			document.body.appendChild(canvas);
			           			canvas.width = img.width;
			           			canvas.height = img.height;

			           			var ctx = canvas.getContext('2d');
			           			ctx.drawImage(img, 0, 0);
			           			// Grab the image as a jpeg encoded in base64, but only the data
			           			data = canvas.toDataURL('image/jpeg').slice('data:image/jpeg;base64,'.length);
			           			// Convert the data to binary form
			           			data = atob(data);
			           			document.body.removeChild(canvas);

			           			ret['data'] = data;
			           			ret['pending'] = false;
			           			if (typeof callback === 'function') {
			           				callback(data);
			           			}
			           		};
			           		img.src = url;

			           		return ret;
			           	};

			           	// Since images are loaded asyncronously, we must wait to create
			           	// the pdf until we actually have the image data.
			           	// If we already had the jpeg image binary data loaded into
			           	// a string, we create the pdf without delay.
			           	
								var createPDF = function(imgData) {
						
			           		
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
			            doc.text(20, 260, 'Director de Personal : ' );
			            doc.text(20, 265, 'DNI : ' );

			            doc.setFont("helvetica");
			            doc.setFontType("normal");
			            doc.setFontSize(10);
			            doc.text(125, 255, '-------------------------------------------------------------------');
			            doc.text(125, 260, 'Director Ejecutivo : ' );
			            doc.text(125, 265, 'DNI : ' );

			   				doc.addImage(imgData, 'JPEG', 125, 227, 25, 25);
			   				
			   				var string = doc.output('datauristring');
			   				
			   				document.getElementById("error").value = string;
			   				$('iframe').attr('src', string);
			   				
			   			
								}
			           	
								

			   				getImageFromUrl('firma01.jpg', createPDF);
			   				
			   				$('#lstRES').modal({
			   					show: 'false'
			   				});
			   				
			           	
			           }
			       }) 
				
				
				
				'##############################################################################################################################'
				'return false;'
			}
			
			
		return false;
		
		
	}else{
		alert('Primero debe buscar una resolución a evaluar');
		
		return false;
		
		
	}
	'return false;'
		
				
}


function grabar00Estado(obj){
	
	var idRES=''+document.getElementById('txtIdRES').value;
	if(idRES.length>1){
		alert('no hay codigo  '+idRES);
		return false;
	}else{
		
		alert(idRES);
		return false;
	}

				
	}
	
	