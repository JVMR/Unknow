$(document).ready(function(){
    $('#nDepartamento').on('change', function(){
        $.ajax({
            type: 'GET',
            url: 'GestionarPersona?operacion=listarProvincia',
            data: 'codigoDep='+$('#nDepartamento').val(),
            statusCode: {
                404: function() {
                    console.log('Pagina no encontrada');
                },
                500: function(){
                    console.log('Error en el servidor');
                }
            },
            success: function(dados){
                pegadados = dados.split(":");
                limparselect();
                if(dados == ''){
               	 	$('#nProvincia').append('<option value ="-1">[Seleccione Provincia]</option>');
                    $('#nProvincia').append('<option>El departamento no tiene provincia</option>');
                }else{
                	$('#nProvincia').append('<option value ="-1">[Seleccione Provincia]</option>');
                    for(var i = 0; i < pegadados.length - 1; i++){
                        var codigoprovincia = pegadados[i].split("-")[0]; 
                        var nomeprovincia = pegadados[i].split("-")[1];
                        $('#nProvincia').append('<option value ="'+codigoprovincia+'">'+nomeprovincia+'</option>');

                    }
                }
            }
        }) 
        function limparselect(){
            $('#nProvincia option').remove();
        }
    }); 
    $('#nProvincia').on('change', function(){
        $.ajax({
            type: 'GET',
            url: 'GestionarPersona?operacion=listarDistrito',
            data: 'codigoProv='+$('#nProvincia').val(),
            statusCode: {
                404: function() {
                    console.log('Pagina no encontrada');
                },
                500: function(){
                    console.log('Error en el servidor');
                }
            },
            success: function(dados){
                pegadados = dados.split(":");
                limparselect();
                if(dados == ''){
                	$('#nDistrito').append('<option value ="-1">[Seleccione Distrito]</option>');
                    $('#nDistrito').append('<option>La provincia no tiene distrito</option>');
                }else{
                	 $('#nDistrito').append('<option value ="-1">[Seleccione Distrito]</option>');
                      for(var i = 0; i < pegadados.length - 1; i++){
                        var codigoDist = pegadados[i].split("-")[0]; 
                        var nomDistrito = pegadados[i].split("-")[1];
                        $('#nDistrito').append('<option value ="'+codigoDist+'">'+nomDistrito+'</option>');

                    }
                }
            }
        }) 
        function limparselect(){
            $('#nDistrito option').remove();
        }
    }); 
    
    
});