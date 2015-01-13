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
            	var celular= $('#txtNombre').val();
            	var seguroS= $('#txtNombre').val();
            	var sueldo= $('#txtSueldo').val();
            	var motivo= $('#txtNombre').val();
            	var fecha= $('#txtFechaI').val();
            	var diagnostico= $('#txtNombre').val();
            	var sueldo= $('#txtNombre').val();
            	doc = new jsPDF();
           		doc.addPage();
           		
           		//Empleado
           		doc.setFontSize(18);
           		doc.setFontType("bold");
           		doc.text(20, 20, 'Datos del Empleado');
           		doc.setLineWidth(1);
           		doc.line(20, 21, 80, 21);
           		doc.setFontSize(14);
           		doc.text(20, 30, 'Nombre del Empleado : '+nomEmp);
           		doc.text(20, 40, 'Fecha de Nacimiento : '+fechaNac);
           		doc.text(20, 50, 'Numero Celular : '+celular);
           		doc.text(20, 60, 'Seguro Social : '+seguroS);
           		
           		//Detalle Cargo
           		/*doc.setFontType("bold");
           		doc.text(60, 20, 'Datos del Cargo');
           		doc.setLineWidth(1);
           		doc.line(60, 21, 80, 21);           		
           		doc.text(60, 30, 'Nombre del Empleado : '+unidad);*/
           		//doc.text(60, 40, 'Nombre del Empleado : '+equipo);
           		/*doc.text(60, 50, 'Nombre del Empleado : '+cargo);
           		doc.text(60, 60, 'Nombre del Empleado : '+sueldo);*/
           		
           		
           		// Making Data URI
           		var out = doc.output();
           		var url = 'data:application/pdf;base64,' + Base64.encode(out);
           		$('#VisorPDF').attr('src',url);
             });
		});