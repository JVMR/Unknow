<%@ taglib uri="misLibrerias" prefix="cbo"%>
<%@page import="entidad.Empleado"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Unidad Organica</title>
<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>
<!-- bootstrap 3.0.2 -->
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<!-- font Awesome -->
<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<!-- Ionicons -->
<link href="css/ionicons.min.css" rel="stylesheet" type="text/css" />
<!-- Theme style -->
<link href="css/AdminLTE.css" rel="stylesheet" type="text/css" />
<!-- DATA TABLES -->
<link href="css/datatables/dataTables.bootstrap.css" rel="stylesheet"
	type="text/css" />

<link href="css/nuestros/unidadorgánica.css" rel="stylesheet"
	type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->
</head>
<body class="skin-blue">
	<!-- Recupero datos de empleado que ingreso -->
	<%
		Empleado empleado = (Empleado) session
				.getAttribute("USUARIO_LOGEADO");
	%>


	<!-- header logo: style can be found in header.less -->
	<header class="header">
		<a href="bienvenido.jsp" class="logo"> <!-- Add the class icon to your logo image or logo icon to add the margining -->
			INR
		</a>
		<!-- Header Navbar: style can be found in header.less -->
		<nav class="navbar navbar-static-top" role="navigation">
			<!-- Sidebar toggle button-->
			<a href="#" class="navbar-btn sidebar-toggle" data-toggle="offcanvas"
				role="button"> <span class="sr-only">Toggle navigation</span> <span
				class="icon-bar"></span> <span class="icon-bar"></span> <span
				class="icon-bar"></span>
			</a>
			<div class="navbar-right">
				<ul class="nav navbar-nav">
					<!-- User Account: style can be found in dropdown.less -->
					<li class="dropdown user user-menu"><a href="#"
						class="dropdown-toggle" data-toggle="dropdown"> <i
							class="glyphicon glyphicon-user"></i> <span><%=empleado.getNombresEmpleado()%>&nbsp;<%=empleado.getApellidoPaterno()%><i
								class="caret"></i></span>
					</a>
						<ul class="dropdown-menu">
							<!-- User image -->
							<li class="user-header bg-light-blue"><img
								src="GestionarEmpleado?operacion=fotoEmpleado&id=<%=empleado.getIdEmpleado()%>"
								class="img-circle" alt="User Image" />
								<p><%=empleado.getNombresEmpleado()%>&nbsp;<%=empleado.getApellidoPaterno()%><br />
									<%=empleado.getIdCargo()%>
									<small>Asalariado desde <%=empleado.getFechaIngreso()%></small>
								</p></li>
							<li class="user-footer">
								<div class="pull-left">
									<a href="perfil.jsp" class="btn btn-default btn-flat">Profile</a>
								</div>
								<div class="pull-right">
									<a href="logout" class="btn btn-default btn-flat">Salir</a>
								</div>
							</li>
						</ul></li>
				</ul>
			</div>
		</nav>
	</header>
	<div class="wrapper row-offcanvas row-offcanvas-left">
		<!-- Left side column. contains the logo and sidebar -->
		<aside class="left-side sidebar-offcanvas"> <!-- Inicio del Menu -->               
                <!-- sidebar: style can be found in sidebar.less -->
                <section class="sidebar">
                    <!-- Sidebar user panel -->
                    <div class="user-panel">
                        <div class="pull-left image">
                            <img src="GestionarEmpleado?operacion=fotoEmpleado&id=<%=empleado.getIdEmpleado() %>" class="img-circle" alt="User Image" />
                        </div>
                        <div class="pull-left info">
                            <p>Hola,&nbsp;<%=empleado.getNombresEmpleado()%> </p>

                            <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
                        </div>
                    </div>                    
                    <!-- sidebar menu: : style can be found in sidebar.less -->
                    <ul class="sidebar-menu">
                        <li>
                            <a href="bienvenido.jsp">
                                <i class="fa fa-dashboard"></i> <span>Bienvenido</span>
                            </a>
                        </li>
                        <li>
                            <a href="perfil.jsp">
                                <i class="fa fa-th"></i> <span>Perfil</span>
                            </a>
                        </li>
                        <li class="treeview active">
                        	<a href="unidadOrganica.jsp">
                        		<i class="fa fa-bar-chart-o"></i>
                        		<span>Unidad Orgánica</span>
                        		<i class="fa fa-angle-left pull-right"></i>
                        	</a>
                        	<ul class="treeview-menu">
                                <li class="active"><a href="registraUnidadOrganica.jsp"><i class="fa fa-angle-double-right"></i>Registrar Unidad Organica</a></li>
                                <li><a href="gestionarUnidadOrganica?operacion=listarUnidad"><i class="fa fa-angle-double-right"></i>Listar Unidad Organica</a></li>
                           </ul>
                        </li>
                        <li class="treeview">
                            <a href="equipo.jsp">
                                <i class="fa fa-bar-chart-o"></i>
                                <span>Equipo</span>
                                <i class="fa fa-angle-left pull-right"></i>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="registraEquipo.jsp"><i class="fa fa-angle-double-right"></i> Registrar Equipo</a></li>
                                <li><a href="gestionarEquipo?operacion=listarEquipos"><i class="fa fa-angle-double-right"></i> Listar Equipo</a></li>
                           </ul>

                        </li>      
                              
                        <li class="treeview">
                            <a href="empleado.jsp">
                                <i class="fa fa-bar-chart-o"></i>
                                <span>Empleado</span>
                                <i class="fa fa-angle-left pull-right"></i>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="registrarEmpleado.jsp"><i class="fa fa-angle-double-right"></i> Registrar Empleado</a></li>
                                <li><a href="GestionarEmpleado?operacion=listarEmpleado"><i class="fa fa-angle-double-right"></i> Listar Empleado</a></li>
                           </ul>

                        </li>   
                        <li class="treeview ">

                            <a href="empleado.jsp">
                                <i class="fa fa-bar-chart-o"></i>
                                <span>Persona</span>
                                <i class="fa fa-angle-left pull-right"></i>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="registrarPersona.jsp"><i class="fa fa-angle-double-right"></i> Registrar Persona</a></li>
                                <li><a href="GestionarPersona?operacion=listarPersona"><i class="fa fa-angle-double-right"></i> Listar Persona</a></li>
                           </ul>

                        </li>
                 
                       <li class="treeview">
                            <a href="LES.jsp">
                                <i class="fa fa-bar-chart-o"></i>
                                <span>LES</span>
                                <i class="fa fa-angle-left pull-right"></i>
                            </a>
                            <ul class="treeview-menu">

                                <li><a href="GestionarLES?operacion=listarCargoxNombre&nom=<%=empleado.getIdCargo() %>&id=<%=empleado.getIdEmpleado()%>"><i class="fa fa-angle-double-right"></i>Gestionar LES</a></li>
                                 <li><a href="GestionarLES?operacion=listarLes"><i class="fa fa-angle-double-right"></i>Consultar Solicitud LESs</a></li>
								<li><a href="evaluarSolicitudLES.jsp"><i class="fa fa-angle-double-right"></i>Evaluar Solicitud LES</a></li>

                           </ul>
                        </li> 
                     
                        <li class="treeview">
                        	<a href="RES.jsp">
                        		<i class="fa fa-bar-chart-o"></i>
                        		<span>RES</span>
                        		<i class="fa fa-angle-left pull-right"></i>
                        	</a>
                        	<ul class="treeview-menu">
                                <li><a href="generarRES.jsp"><i class="fa fa-angle-double-right"></i>Generar Resolucion administrativa de LES</a></li>
                           		<li><a href="actualizarRES.jsp"><i class="fa fa-angle-double-right"></i>Generar Resolucion administrativa de LES</a></li>
                                <li><a href="consutaRes.jsp"><i class="fa fa-angle-double-right"></i>Consultar Solicitud RES</a></li>
                           
                           </ul>

                        </li>
                        <li class="treeview">
                        	<a href="#">
                        		<i class="fa fa-bar-chart-o"></i>
                        		<span>Descanso Médico</span>
                        		<i class="fa fa-angle-left pull-right"></i>
                        	</a>
                        	<ul class="treeview-menu">
                                <li><a href="consultarDM.jsp"><i class="fa fa-angle-double-right"></i>Evaluar Descanso Médico</a></li>
                           </ul>
                        </li>          
					</ul>

                       
                </section>
                <!-- /.sidebar -->
            </aside><!-- Fin del Menu -->

		<!-- Right side column. Contains the navbar and content of the page -->
		<aside class="right-side">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>Registrar Unidad Orgánica<small>Agregue una oficina del INR Dra.
						Adriana Rebaza Flores</small>
				</h1>
				<!-- Modificar al crear nuevos -->
				<ol class="breadcrumb">
					<li><a href="bienvenido.jsp"><i class="fa fa-dashboard"></i>
							Home</a></li>
					<li><a href="unidadOrganica.jsp">Unidad Organica</a></li>
					<li class="active">Registrar Unidad Orgánica</li>
				</ol>
			</section>

			<!-- Main content -->
			<!-- ############################################################################################################################################ -->
			<section class="content">
				<div class="box box-primary">
					<div class="row">
						<!-- left column -->
						<div class="col-md-11" style="padding-left: 80px">
							<div class="box-header">
								<h3 class="box-title">Datos de Unidad Orgánica u Oficina</h3>
							</div>
							<!-- /.box-header -->
							<!-- form start -->
							<form  action="gestionarUnidadOrganica"  id="registrarUnidad" role="registrarUnidad">
							<!-- <input type="hidden" name="operacion" value="registrarUnidad">  -->
							<input type="hidden" name="operacion" value="registrarUnidad"> 
							<div class="box-body">
							

							<!-- contenedor de errores -->
								<div class="col-md-12">
									<div class="errorHandler alert alert-danger no-display" style="display: none;">
										<i class="fa fa-times-circle-o"></i> Ud. tiene algunos errores en el formulario. Por favor revisar los campos.
									</div>
									<div class="successHandler alert alert-success no-display" style="display: none;">
										<i class="fa fa-check"></i> La validacion de campos es correcta!
									</div>
								</div>  
							
							
								
								<div class="form-group">
									<label for="txtNombreUnidad">Nombre de Unidad</label> <input
										type="text" class="form-control" id="txtNombreUnidad"
										name="txtNombreUnidad" 
										placeholder="Ingrese Nombre de Unidad u Oficina">
								</div>
								<div class="form-group">
									<label for="txtDescripcionUnidad">Descripción</label> <input
										type="text" class="form-control" id="txtDescripcionUnidad"
										name="txtDescripcionUnidad"
										placeholder="Ingrese una descripción">
								</div>
								<br>
								
								
								
								<div class="col-md-6">
								<div class="box-header">
									<h3 class="box-title">
										Cargos <small>Agregar datos del cargo encargado de la Unidad Orgánica</small>
									</h3>
								</div>
								<!-- /.box-header -->

								<div class="form-group">
									<label for="txtNombreCargo">Nombre de Cargo</label> <input
										type="text" class="form-control" id="txtNombreCargo" readonly="readonly"
										name="txtNombreCargo" value="Encargado de">
								</div>
								<div class="form-group">
									<label for="txtSueldo">Sueldo del Cargo</label>
									<div class="input-group">
										<span class="input-group-addon">$</span> <input
											class="form-control" type="text" name="txtSueldo" id="txtSueldo"></input> <span
											class="input-group-addon">.00</span>
									</div>
								</div>
							</div>


							<div class="col-md-6">

								<div class="box-header">
									<h3 class="box-title">
										Rol <small> Elija los privilegios que tendra el
											siguiente Cargo</small>
									</h3>
								</div>
								<div class="row">
									<div class="col-lg-6">
										<div class="input-group">
											<span class="input-group-addon"> <input
												type="checkbox" name="chkGestionarLES" id="chkGestionarLES">
											</span> <input type="text" class="form-control"
												name="txtGestionarLES"
												value="Gestionar Licencia de Enfermedad Subsidiada"
												readonly="readonly">
										</div>
										<br>

										<div class="input-group">
											<span class="input-group-addon"> <input
												type="checkbox" name="chkGestionarRES" id="chkGestionarRES">
											</span><input type="text" class="form-control"
												name="txtGestionarRES" value="Gestionar Resolucion de LES"
												readonly="readonly">
										</div>
										<br>


										<div class="input-group">
											<span class="input-group-addon"> <input
												type="checkbox" name="chkVerificarLES" id="chkVerificarLES">
											</span> <input type="text" class="form-control"
												name="txtVerificarLES" value="Verificar LES"
												readonly="readonly">
										</div>
										<br>
										
										<div class="input-group">
											<span class="input-group-addon"> <input
												type="checkbox" name="chkVerificarRES" id="chkVerificarRES">
											</span> <input type="text" class="form-control"
												name="txtVerificarRES" value="Verificar RES"
												readonly="readonly">
										</div>
										<br>

										<div class="input-group">
											<span class="input-group-addon"> <input
												type="checkbox" name="chkVisarRES" id="chkVisarRES">
											</span> <input type="text" class="form-control"
												name="txtVisarRES" value="Visar RES"
												readonly="readonly">
										</div>
										<br>

										

									</div>

									<div class="col-lg-6">
									<div class="input-group">
											<span class="input-group-addon"> <input
												type="checkbox" name="chkListarLES" id="chkListarLES">
											</span> <input type="text" class="form-control"
												name="txtListarLES" value="Listar LES"
												readonly="readonly">
										</div>
										<br>
										<div class="input-group">
											<span class="input-group-addon"> <input
												type="checkbox" name="chkListarRES" id="chkListarRES">
											</span> <input type="text" class="form-control"
												name="txtListarRES" value="Listar RES"
												readonly="readonly">
									</div>
										<br>

										<div class="input-group">
											<span class="input-group-addon"> <input
												type="checkbox" name="chkMantenimiento" id="chkMantenimiento">
											</span> <input type="text" class="form-control"
												name="txtMantenimiento" value="Mantenimiento"
												readonly="readonly">
										</div>
										<br>

										<div class="input-group">
											<span class="input-group-addon"> <input
												type="checkbox" name="chkReportes" id="chkReportes">
											</span> <input type="text" class="form-control" name="txtReportes"
												value="Reportes" readonly="readonly">
										</div>
										<br>
										<!-- /input-group -->
									</div>
									<!-- /.col-lg-6 -->
								</div>
								<!-- /.row -->

							</div>
								
								
								
								
								
								
							</div>

							
							<div class="box-footer" align="center">
							<button type="submit" class="btn btn-primary">Grabar
								Nueva Unidad<i class="fa fa-arrow-circle-right"></i></button>
							</div>
						</form>

						</div>
						


						
						<!--  -->
						<!-- fin del formulario -->
					</div>
					<!-- /.box primary-->

					<!--/.col (left) -->
				</div>
				<!-- /.row -->
			</section>
			<!-- /.content -->
			<!-- ############################################################################################################################################ -->
		</aside>
		<!-- /.right-side -->
	</div>
	<!-- ./wrapper -->


	<!-- jQuery 2.0.2 -->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="js/bootstrap.min.js" type="text/javascript"></script>
	<!-- AdminLTE App -->
	<script src="js/AdminLTE/app.js" type="text/javascript"></script>
	<!-- DATA TABES SCRIPT -->
	<script src="js/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
	<script src="js/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
	<!-- Jquery validate -->
	<script src="js/jquery_validacion/jquey.js" type="text/javascript"></script>
	<script src="js/jquery_validacion/jquery.validate.js" type="text/javascript"></script>
	<script src="js/jquery_validacion/jquery.validate.min.js"></script>
	<script src="js/jquery_validacion/messages_es.js" type="text/javascript"></script>
	
	<!-- Validación del formulario-->
	<script src="js/jquery_validacion/form-RegistraUnidad.js"></script>
	
	<script type="text/javascript">
	$(function(){
		var nomUnidad;
		var nomCargo;
		var txt;
		var txt2;
		var espacio=" ";
			$('#txtNombreUnidad').blur(function(){
				nomUnidad = document.getElementById("txtNombreUnidad").value;
				txt=nomUnidad.substr(0,200);
				
				nomCargo = document.getElementById("txtNombreCargo").value;
				txt2=nomCargo.substr(0,20);
				txt2=txt2.concat(espacio);
				
				$("#txtNombreCargo").attr('value',txt2.concat(txt));
			});
			FormValidator.init();	
	});
	
	
	</script>
</body>
</html>
	