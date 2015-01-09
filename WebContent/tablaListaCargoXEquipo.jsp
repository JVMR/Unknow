<%@page import="entidad.ListaCargoEquipo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.lowagie.text.pdf.ArabicLigaturizer"%>
<%@ taglib uri="http://displaytag.sf.net/el" prefix="display"%>
<%@ taglib uri="misLibrerias" prefix="cbo"%>
<%@page import="entidad.Empleado"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registro de Equipos</title>
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

</head>
<body>

	<form role="form" name="equipo" action="gestionarEquipo" >
				<div class="box-body">
								<div class="col-md-4">
									<div class="box-header">
										<h3 class="box-title">
											Cargos <small>Agregar datos del Cargo</small>
										</h3>
									</div>
									<!-- /.box-header -->
							      <input type="hidden" name="operacion" value="agregarCargo">  
									<div class="form-group">
										<label for="txtNombreCargo">Nombre de Cargo</label> <input
											type="text" class="form-control" id="txtNombreCargo"
											name="txtNombreCargo" placeholder="Ingrese Nombre de Cargo">
									</div>
									<div class="form-group">
										<label for="txtSueldo">Sueldo del Cargo</label>
										<div class="input-group">
											<span class="input-group-addon">$</span> <input
												class="form-control" type="text" name="txtSueldo"></input> <span
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
										<div class="col-md-6">
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
											<!-- /input-group -->

											<div class="input-group">
												<span class="input-group-addon"> <input
													type="checkbox" name="chkVerificarLES" id="chkVerificarLES">
												</span> <input type="text" class="form-control"
													name="txtVerificarLES" value="Verificar LES"
													readonly="readonly">
											</div>
											<br>


										</div>

										<div class="col-md-6">
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
													type="checkbox" name="chkMantenimiento" id="chkMantenimiento">
												</span> <input type="text" class="form-control"
													name="txtMantenimiento" value="Mantenimiento"
													readonly="readonly">
											</div>
											<br>
											<!-- /input-group -->
											

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
								
									</div>
									<!-- /.row -->		
							
							<div class="col-md-11">
							
								<button type="submit" class="btn btn-primary">Agregar Cargo</button> 
								
									<div class="box">
										<div class="box-body table-responsive">							
										
								<display:table name="CargoxEquipo" id="tbE" requestURI="gestionarEquipo?operacion=listarEquipos" class="table table-bordered table-striped">
                               	<display:column property="itemCargo" title="ITEM CARGO"></display:column>
                               	<display:column property="nombreCargo" title="NOMBRE DE CARGO"></display:column>
                               	<display:column property="sueldo" title="SUELDO DE CARGO"></display:column>
                               	<display:column  title="ROL"></display:column>
                               	<display:column property="gestionarLES" title="GESTIONAR LES"></display:column>
                               	<display:column property="gestionarRES" title="GESTIONAR RES"></display:column>
                               	<display:column property="verficarLES" title="VERIFICAR LES"></display:column>
                               	<display:column property="verificarRES" title="VERIFICAR RES"></display:column>
                               	<display:column property="mantenimiento" title="MANTENIMIENTO"></display:column>
                               	<display:column property="reporte" title="REPORTE"></display:column>
                              	<display:column title="OPERACIÓN">
                              		<div class="btn-group">
                                            <button type="button" class="btn btn-info btn-flat"><i class="fa fa-gear"></i></button>
                                            <button type="button" class="btn btn-info btn-flat dropdown-toggle" data-toggle="dropdown">
                                                <span class="caret"></span>
                                                <span class="sr-only">Toggle Dropdown</span>
                                            </button>
                                            <ul class="dropdown-menu" role="menu">
                                                <li><a href="gestionarEquipo?operacion=quitarCargo&idItem=${tbE.getItemCargo()}"><i class="fa fa-times-circle"></i> Eliminar</a></li>
                                            </ul>
                                    </div>   
                              	</display:column>
                               	
                               </display:table> 
								</div>			
										</div>
									</div>
							
							
							
								</div>
							</form>



<!-- jQuery 2.0.2 -->
	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="js/bootstrap.min.js" type="text/javascript"></script>
	<!-- AdminLTE App -->
	<script src="js/AdminLTE/app.js" type="text/javascript"></script>
	<!-- DATA TABES SCRIPT -->
	<script src="js/plugins/datatables/jquery.dataTables.js"
		type="text/javascript"></script>
	<script src="js/plugins/datatables/dataTables.bootstrap.js"
		type="text/javascript"></script>
</body>
</html>