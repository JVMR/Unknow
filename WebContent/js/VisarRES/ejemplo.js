
function crearPDF_RES(fechaGenerado,referencia,Descriptor,objetoConsulta,analisis,idLES,idAsalariado,nombrePrimerEmpleado,dniPrimerEmpleado,nombreSegEmp,DNISegEmp,firma01,firma02){
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
    doc.text(20, 265, 'DNI : '+dniPrimerEmpleado );

    doc.setFont("helvetica");
    doc.setFontType("normal");
    doc.setFontSize(10);
    doc.text(125, 255, '-------------------------------------------------------------------');
    doc.text(125, 260, 'Director Ejecutivo : '+$('#txtEmpleadoNmbres').val());
    doc.text(125, 265, 'DNI : '+$('#txtEmpleadoDNI').val());

doc.addImage(firma01, 'JPEG', 125, 227, 25, 25);
doc.addImage(dados, 'JPEG', 150, 227, 25, 25);




var string = doc.output('datauristring');


$('iframe').attr('src', string);

	
}











