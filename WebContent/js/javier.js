$(function() {	
			
			$('#reservation').daterangepicker({format: 'DD/MM/YYYY'});				
			$('.applyBtn').click(function(){	
				var f1 =document.getElementsByName("daterangepicker_start")[0].value;
				var f2=document.getElementsByName("daterangepicker_end")[0].value;
				var sFecha1=f1.split("/");
				var sFecha2=f2.split("/");
				var dtFecha1=new Date(sFecha1[2]+"/"+sFecha1[1]+"/"+sFecha1[0]);
				var dtFecha2=new Date(sFecha2[2]+"/"+sFecha2[1]+"/"+sFecha2[0]);
				var dif = dtFecha2 - dtFecha1;
				var dias = Math.floor(dif / (1000 * 60 * 60 * 24)); 
			    $("#fecha1").attr('value',sFecha1[2]+"/"+sFecha1[1]+"/"+sFecha1[0]);	
			    $("#fecha2").attr('value',sFecha2[2]+"/"+sFecha2[1]+"/"+sFecha2[0]);
			    $("#cantidad").attr('value',dias);
			    $("#cantidad1").attr('value',dias);
			});	
                        
			 $("#datemask2").inputmask("yyyy/mm/dd", {"placeholder": "yyyy/mm/dd"});
             
             $("[data-mask]").inputmask();
			 $('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
                 checkboxClass: 'icheckbox_minimal',
                 radioClass: 'iradio_minimal'
             });
             //Red color scheme for iCheck
             $('input[type="checkbox"].minimal-blue, input[type="radio"].minimal-blue').iCheck({
                 checkboxClass: 'icheckbox_minimal-blue',
                 radioClass: 'iradio_minimal-blue'
             });
             //Flat red color scheme for iCheck
             $('input[type="checkbox"].flat-blue, input[type="radio"].flat-blue').iCheck({
                 checkboxClass: 'icheckbox_flat-blue',
                 radioClass: 'iradio_flat-blue'
             });
             $('#Vista').click(function(){
            	var dni=$('#txtDNI').val();
            	var nomEmp= $('#txtNombre').val();
            	var cargo= $('#txtCargo').val();
            	var unidad= $('#txtUnidad').val();
            	var equipo= $('#txtEquipo').val();
            	var fechaNac= $('#txtFechaN').val();
            	var celular= $('#txtFono').val();
            	var seguroS= $('#txtSeguroSocial').val();
            	var sueldo= $('#txtSueldo').val();
            	var motivo= $('#cboLicencia').val();
            	var fecha= $('#txtFechaI').val();
            	var diagnostico= $('#Diagnostico').val();
            	var fechaDesc= $('#reservation').val();
            	var cantidad= $('#cantidad').val();
            	var descripcion= $('#txtLicencia').val();
            	
            	doc = new jsPDF();
           		doc.addPage();
           		

           		doc.text(20, 20, 'LICENCIA POR ENFERMEDAD SUBSIDIADA');
           		//Empleado
           		doc.text(20, 40, 'Datos del Empleado');
           		doc.text(23, 50, 'Nombre del Empleado   : '+nomEmp);
           		doc.text(23, 57, 'Fecha de Nacimiento   : '+fechaNac);
           		doc.text(23, 64, 'Numero Celular    : '+celular);
           		doc.text(23, 71, 'Seguro Social    : '+seguroS);
           		
           		//Detalle Cargo
           		doc.text(20, 81, 'Datos del Trabajo');         		
           		doc.text(23, 91, 'Unidad Organica   : '+unidad);
           		doc.text(23, 98, 'Equipo    : '+equipo);
           		doc.text(23, 105, 'Cargo    : '+cargo);
           		doc.text(23, 112, 'Sueldo :  S/.  '+sueldo);
           		
           		//Descanso Medico
           		doc.text(20, 122, 'Descanso Medico');         		
           		doc.text(23, 132, 'Descanso Medico  : '+diagnostico);
           		doc.text(23, 139, 'Rango de Fecha   : '+fechaDesc);
           		doc.text(23, 146, 'Dias Subsidiados    : '+cantidad);
           		
           		//Descripcion Solicitud
           		doc.text(20, 156, 'Descripcion Solicitud');         		
           		doc.text(23, 166, 'Motivo Licencia   : '+motivo);
           		doc.text(23, 173, 'Descripcion    : '+descripcion);
           		
           		// Making Data URI
           		var out = doc.output();
           		var url = 'data:application/pdf;base64,' + Base64.encode(out);
           		$('#VisorPDF').attr('src',url);
             });
		});