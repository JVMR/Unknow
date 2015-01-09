var FormValidator = function () {   
    var runValidator2 = function () {
        var form1 = $('#ingresaEmpleado');
        var errorHandler1 = $('.errorHandler', form1);
        var successHandler1 = $('.successHandler', form1);
        $('#ingresaEmpleado').validate({
            errorElement: "label", // contain the error msg in a span tag
            errorClass: 'control-label',
            errorPlacement: function (error, element) { // render error placement for each input type
                if (element.attr("type") == "radio" || element.attr("type") == "checkbox") { // for chosen elements, need to insert the error after the chosen container
                    error.insertAfter($(element).closest('.form-group').children('div').children().last());
                } else {
                    error.insertAfter(element);
                    // for other inputs, just perform default behavior
                }
            },
            rules: {
            	txtDNI: {
                    required: true,
                    minlength: 8,
                    number: true
                },
                cboCargo: {
                    required: true
                },
                txtFechaN: {
                    required: true
                },
                txtFechaI: {
                    required: true
                },
                txtPssword1: {
                    required: true
                },
                txtPssword: {
                    required: true,
                    equalTo: "#txtPssword1"
                    
                },
                txtNombre: {
                	minlength: 3,
                    required: true
                },
                txtApellidoP: {
                	minlength: 3,
                    required: true
                },
                txtApellidoM: {
                	minlength: 3,
                    required: true
                },
                cboEstado: {
                    required: true
                },
                txtFono: {
                	minlength: 7,
                    required: true
                },
                txtSeguroSocial: {
                	minlength: 7,
                    required: true
                }
                
            },
            messages: {
            	txtDNI :{
            		required: "Ingresa el DNI",
            		minlength:"Debe ser minimo de 8 caracteres",
            		number:"Se ingresa solo numeros"} ,
            	txtFechaN : "Ingresa la fecha",
            	txtFechaI : "Ingresa la fecha",
            	txtApellidoP: "Ingrese su Apellido Paterno",
            	txtApellidoM: "Ingrese su Apellido Materno",
                txtNombre: "Ingrese su Nombre Completo",
                cboCargo: {
                    required: "Ingrese el estado"
                    	},
                cboCargo: {
                     required: "Ingrese el estado"
                 },
                txtPssword1:{
                	required:"Ingrese su contraseña"              	
                },
                txtPssword:{
                	required:"Repita su contraseña",
                	equalTo: "Debe ser iguales"                	
                },
                txtFono:{
                	 required: "Ingrese su telefono",
                	 minlength:"El numero debe ser mayor a 7"
                },
                txtSeguroSocial:{
               	 required: "Ingrese su Seguro Social",
               	 minlength:"El numero debe ser mayor a 11"
               }
            },
            invalidHandler: function (event, validator) { //display error alert on form submit
                successHandler1.hide();
                errorHandler1.show();
            },
            highlight: function (element) {
                $(element).closest('.control-label').removeClass('valid');
                // display OK icon
                $(element).closest('.form-group').removeClass('has-success').addClass('has-error').find('.symbol').removeClass('ok').addClass('required');
                // add the Bootstrap error class to the control group
            },
            unhighlight: function (element) { // revert the change done by hightlight
                $(element).closest('.form-group').removeClass('has-error');
                // set error class to the control group
            },
            success: function (label, element) {
                label.addClass('control-label valid');
                // mark the current input as valid and display OK icon
                $(element).closest('.form-group').removeClass('has-error').addClass('has-success').find('.symbol').removeClass('required').addClass('ok');
            }
        });
    };
    
    
    return {
        //main function to initiate template pages
        init: function () {
            runValidator2();
            
        }
    };
}();