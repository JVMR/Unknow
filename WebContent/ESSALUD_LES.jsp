<%@page import="entidad.Menu"%>
<%@page import="entidad.Empleado"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>INR | ESSALUD</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- bootstrap 3.0.2 -->
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- font Awesome -->
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <!-- Ionicons -->
        <link href="css/ionicons.min.css" rel="stylesheet" type="text/css" />
        <!-- Theme style -->
        <link href="css/AdminLTE.css" rel="stylesheet" type="text/css" />
        <!-- Icono -->
        <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
		<link rel="icon" href="favicon.ico" type="image/x-icon">
        
        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->
    </head>
    <body class="skin-blue">
    	
        
        <div class="wrapper row-offcanvas row-offcanvas-left">
            <!-- Left side column. contains the logo and sidebar -->           
            

            <!-- Right side column. Contains the navbar and content of the page -->
            <aside class="right-side">                
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        SISTEMA DE GESTION DE LICENCIA POR ENFERMEDAD SUBSIDIADOS
                        <small></small>
                    </h1>
                    <ol class="breadcrumb">
                        <li class="active"><i class="fa fa-dashboard"></i>Home</li>                        
                    </ol>
                </section>

                <section class="content">
				<form action="gestionaLES">
				<input type="hidden" value="essalud" name="operacion" >			
				
				<div class="row">					
					
					<div class="col-md-8">

						<div class="box box-success">
							<div class="box-header">
								<h3 class="box-title" >Verificacion de Licencia por Enfermedad Subsidiada </h3>
							</div>
							<div class="box-body">

								<div class="form-group">
									<label>Ingrese el codigo de la Licencia por Enfermedad Subsidiada</label>
									<input type="text" name="txtIdLes">									
								</div>
							</div>
							<!-- /.box-body -->
						</div>
						<!-- /.box -->


					</div>					
					<!-- /.col (right) -->

					<div class="col-md-12">
						<div class="box box-success">
							<div class="box-body">
								<div class="form-group" align="left">

										
										
										<input type="radio" value="8" name="rdEstado">     <label>Aprobado</label>
										<br>
										<input type="radio" value="7" name="rdEstado">     <label>Desaprobado</label>
										<br>
										<br>
										
									<div align="center">									
									<button type="submit" class="btn btn-primary">Grabar Revisión</button>
										
									</div>
									
								</div>	

							</div>
						</div>
					</div>
				</div>
				<!-- /.row -->
				</form>
			</section>
			<!-- /.content -->
            </aside><!-- /.right-side -->
        </div><!-- ./wrapper -->


        <!-- jQuery 2.0.2 -->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
        <!-- Bootstrap -->
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <!-- AdminLTE App -->
        <script src="js/AdminLTE/app.js" type="text/javascript"></script>
      

    </body>
</html>