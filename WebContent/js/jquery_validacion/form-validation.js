var FormValidator = function () {   
    var runValidator2 = function () {
        var form1 = $('#ingresaEmpleado');
        var errorHandler1 = $('.errorHandler', form1);
        var successHandler1 = $('.successHandler', form1);
        $('#ingresaEmpleado').validate({
            errorElement: "span", // contain the error msg in a span tag
            errorClass: 'help-block',
            errorPlacement: function (error, element) { // render error placement for each input type
                if (element.attr("type") == "radio" || element.attr("type") == "checkbox") { // for chosen elements, need to insert the error after the chosen container
                    error.insertAfter($(element).closest('.form-group').children('div').children().last());
                } else {
                    error.insertAfter(element);
                    // for other inputs, just perform default behavior
                }
            },
            ignore: "",
            rules: {
            	txtDNI: {
                    minlength: 8,
                    required: true
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
                    required: true
                },
                txtNombre: {
                	minlength: 2,
                    required: true
                },
                txtApellidoP: {
                	minlength: 2,
                    required: true
                },
                txtApellidoM: {
                	minlength: 2,
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
                },
                txtUsuario: {
                    required: true
                },
                
            },
            messages: {
            	txtDni : "Ingresa el DNI",
            	txtFecha : "Ingresa la fecha",
            	
                firstname: "Please specify your first name",
                lastname: "Please specify your last name",
                email: {
                    required: "Ingrese su email",
                    email: "Your email address must be in the format of name@domain.com"
                },
                txtTelefono:{
                	 required: "Ingrese su telefono",
                	 minlength:"El numero debe ser mayor a 7"
                },
                gender: "Please check a gender!"
            },
            invalidHandler: function (event, validator) { //display error alert on form submit
                successHandler1.hide();
                errorHandler1.show();
            },
            highlight: function (element) {
                $(element).closest('.help-block').removeClass('valid');
                // display OK icon
                $(element).closest('.form-group').removeClass('has-success').addClass('has-error').find('.symbol').removeClass('ok').addClass('required');
                // add the Bootstrap error class to the control group
            },
            unhighlight: function (element) { // revert the change done by hightlight
                $(element).closest('.form-group').removeClass('has-error');
                // set error class to the control group
            },
            success: function (label, element) {
                label.addClass('help-block valid');
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