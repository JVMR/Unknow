
var FormValidator = function () {   
    var runValidator2 = function (){
        var form1 = $('#formMensaje');
        var errorHandler1 = $('.errorHandler', form1);
        var successHandler1 = $('.successHandler', form1);
        $('#formMensaje').validate({
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
              txtIdUsuario: {
                    required: true,
                    minlength: 6
                },
                txtDNI: {
                    required: true,
                    minlength: 8,
                    number: true
                },
                txtContrasena: {
                    required: true
                }
            },
            messages: {
              txtIdUsuario: {
		          required: "Debe ingresar su Código de Usuario",
		          minlength: "Debe ser mínimo de 6 caracteres"
	        },
	        txtDNI: {
	          required: "Debe ingresar su número de DNI",
	          minlength: "El número son 8 dígitos",
	          number: "Los caracterés deben ser dígitos"
	        },
	        txtContrasena: {
	          required: "Debe ingresar el password"
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



'#############################################################################################################'

