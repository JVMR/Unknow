<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="entidad.Res"%>
<%@page import="entidad.Menu"%>
<%@ taglib uri="misLibrerias" prefix="cbo"%>
<%@page import="entidad.Empleado"%>
<%@ taglib uri="http://displaytag.sf.net/el" prefix="display"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>INR | Evaluar Solicitud LES</title>
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
		 <!-- Icono -->
        <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
		<link rel="icon" href="favicon.ico" type="image/x-icon">
		<link href="css/nuestros/unidadorgánica.css" rel="stylesheet"
			type="text/css">
			
		<link href="css/bootstrap-modal/bootstrap-modal-bs3patch.css" rel="stylesheet" />
  		<link href="css/bootstrap-modal/bootstrap-modal.css" rel="stylesheet" />

		<!-- para jspdf -->
  		<script type="text/javascript" src="examples/js/jquery/jquery-1.7.1.min.js"></script>
		<script type="text/javascript" src="examples/js/jquery/jquery-ui-1.8.17.custom.min.js"></script>
		<script type="text/javascript" src="dist/jspdf.debug.js"></script>

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
    		Empleado empleado= (Empleado) session.getAttribute("USUARIO_LOGEADO");    
    	if(empleado==null){
    		response.sendRedirect("index.jsp");
    	}else{    		
    		Menu mnu= (Menu) session.getAttribute("MenuDinamico");
    		
    		//recuperar RES
    		Res res= (Res) request.getAttribute("ResaEvaluar");
    		
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
                        <li >
                            <a href="bienvenido.jsp">
                                <i class="fa fa-dashboard"></i> <span>Bienvenido</span>
                            </a>
                        </li>
                        <li>
                            <a href="perfil.jsp">
                                <i class="fa fa-th"></i> <span>Perfil</span>
                            </a>
                        </li>
                        <li class="treeview" style="<%=mnu.getMant()%>">
                        	<a href="unidadOrganica.jsp">
                        		<i class="fa fa-bar-chart-o"></i>
                        		<span>Unidad Orgánica</span>
                        		<i class="fa fa-angle-left pull-right"></i>
                        	</a>
                        	<ul class="treeview-menu">
                                <li><a href="registraUnidadOrganica.jsp"><i class="fa fa-angle-double-right"></i>Registrar Unidad Organica</a></li>
                                <li><a href="gestionarUnidadOrganica?operacion=listarUnidad"><i class="fa fa-angle-double-right"></i>Listar Unidad Organica</a></li>
                           </ul>
                        </li>
                        <li class="treeview" style="<%=mnu.getMant()%>">
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
                              
                        <li class="treeview" style="<%=mnu.getMant()%>">
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
                        <li class="treeview" style="<%=mnu.getMant()%>">

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
                 
                       <li class="treeview" style="<%=mnu.getgLES()%>">
                            <a href="LES.jsp">
                                <i class="fa fa-bar-chart-o"></i>
                                <span>LES</span>
                                <i class="fa fa-angle-left pull-right"></i>
                            </a>
                            <ul class="treeview-menu">

                                <li><a href="GestionarLES?operacion=listarCargoxNombre&nom=<%=empleado.getIdCargo() %>&id=<%=empleado.getIdEmpleado()%>"><i class="fa fa-angle-double-right"></i>Gestionar LES</a></li>
                                 <li style="<%=mnu.getlLES()%>"><a href="GestionarLES?operacion=listarLes"><i class="fa fa-angle-double-right"></i>Consultar Solicitud LES</a></li>
								<li  style="<%=mnu.geteLES()%>"><a href="GestionarLES?operacion=evLes"><i class="fa fa-angle-double-right"></i>Evaluar Solicitud LES</a></li>

                           </ul>
                        </li> 
                     	<%
                     	String mnuInactivo="display:block;";
                     		if((mnu.getgRES().equals("display:none;")) && (mnu.getlRES().equals("display:none;")) && (mnu.geteRES().equals("display:none;")) && (mnu.getVsrRES().equals("display:none;"))){
                     			mnuInactivo="display:none;";
                     		}
                     			%>
                        <li class="treeview active" style="<%=mnuInactivo%>">
                        	<a href="RES.jsp">
                        		<i class="fa fa-bar-chart-o"></i>
                        		<span>RES</span>
                        		<i class="fa fa-angle-left pull-right"></i>
                        	</a>
                        	<ul class="treeview-menu">
                                <li style="<%=mnu.getgRES()%>"><a href="generarRES.jsp"><i class="fa fa-angle-double-right"></i>Generar Resolucion administrativa de LES</a></li>
                                <li style="<%=mnu.getlRES()%>"><a href="consutaRes.jsp"><i class="fa fa-angle-double-right"></i>Consultar Solicitud RES</a></li>
                                <li style="<%=mnu.geteRES()%>"><a href="evaluarRES.jsp"><i class="fa fa-angle-double-right"></i>Evaluar RES</a></li>
                                <li class="active" style="<%=mnu.getVsrRES()%>"><a href="GestionarRES?operacion=listaVisarRES"><i class="fa fa-angle-double-right"></i>Visar RES</a></li>
                           
                           </ul>							
                        </li>
                        
                       <li class="treeview" style="<%=mnu.getRprt()%>">
                            <a href="LES.jsp">
                                <i class="fa fa-bar-chart-o"></i>
                                <span>REPORTE</span>
                                <i class="fa fa-angle-left pull-right"></i>
                            </a>
                            <ul class="treeview-menu">
                                 <li ><a href="reporte.jsp"><i class="fa fa-angle-double-right"></i>Reporte LES</a></li>
								<li ><a href="reporte2.jsp"><i class="fa fa-angle-double-right"></i>Reporte Empleado</a></li>
								<li><a href="reporte3.jsp"><i class="fa fa-angle-double-right"></i>Reporte Unidad Organica</a></li>
								
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
				<h1>
					Evaluacion de Solicitudes LES<small>Aprobacion, conforme o
						desaprobación de solicitudes</small>
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
		 <!--	<form name="form01">   
			 <input type="hidden" value="actualizarEstadoVisado" name="operacion">   -->
				<div class="row">
				<div class="col-md-12">
                        <div class="box box-success">
                        <div class="box-body">
                        <div class="form-group" align="center">
                        				<h4>Para la Evaluacion, primero consulte una Solicitud de Licencia Por Enfermedad Subsidiada</h4> 
                                       <br>                                       
                             			<button class="btn btn-success btn-lg" data-toggle="modal"  href="#lstRES" style="display:inline;">Buscar Resoluciones de LES <i class="fa fa-arrow-circle-right"></i></button> 
                                        
                                    </div>
                        
                        </div>
                        </div>
                        </div>
                        
                        
                        
                        <div class="col-md-8">

                            <div class="box box-success">
                                <div class="box-header">
                                    <h3 class="box-title">Vista de Solicitud LES </h3>
                                </div>
                                <div class="box-body">
                                 
                                  <div class="form-group">
                                            <label>Vista de Solicitud</label>
                                             
                                            <% if(res!=null){%>	
                                            	<iframe src="<%=res.getPdf()%>" frameborder="0" width="700" height="900"></iframe>
                                            <%} else {%>
                                            	<iframe frameborder="0" width="700" height="900"></iframe>
                                            <%}%>  
                                     </div>
                                </div><!-- /.box-body -->
                            </div><!-- /.box -->

                         
                        </div><!-- /.col (left) -->
                        <div class="col-xs-4">
                            <div class="box box-danger">
                                <div class="box-header">
                                    <h3 class="box-title">Puntos a Corregir</h3>
                                </div>
                                <div class="box-body">
                                    <!-- Date range -->
                                    <div class="form-group">
                                            <label>Comentarios</label>
                                            <textarea id="error" class="form-control" rows="20" placeholder="Escribe los puntos errados de esta solicitud ..."></textarea>
                                     </div>

                                    
							 <div class="input-group input-group-sm">
                                        <div class="input-group-btn">
                                            <button type="button" class="btn btn-warning dropdown-toggle" data-toggle="dropdown">Action <span class="fa fa-caret-down"></span></button>
                                            <ul class="dropdown-menu">
                                                <li><a href="#">Action</a></li>
                                                <li><a href="#">Another action</a></li>
                                                <li><a href="#">Something else here</a></li>
                                                <li class="divider"></li>
                                                <li><a href="#">Separated link</a></li>
                                            </ul>
                                        </div><!-- /btn-group -->
                                        <input class="form-control" type="text">
                            </div>


                                </div><!-- /.box-body -->
                            </div><!-- /.box -->
                          
                        </div><!-- /.col (right) -->
                        
                        <div class="col-md-12">
                        <div class="box box-success">
                        <div class="box-body">
                        
                       <form name="form01" onsubmit="return grabarEstado(this)"> 
                        <div class="form-group" align="center">
                        
                        				<div class="input-group">
											<span class="input-group-addon"> <input
												type="radio" value="9" name="rdEstado" id="rbVisado">
											</span> <input type="text" class="form-control" value="Visado"
												readonly="readonly">
										</div>
										<div class="input-group">
											<span class="input-group-addon"> <input
												type="radio" value="7" name="rdEstado" id="rbRechazado">
											</span> <input type="text" class="form-control" value="Rechazado ó Desaprobado"
												readonly="readonly">
										</div>
										
                                        <br>
                                        
                                        
                                        <%
                                        
                                        if(res!=null){
                                        %>
                                        <input type="hidden" value="<%=empleado.getIdEmpleado()%>" name="txtIdEmpleado" id="txtIdEmpleado">
                                        <input type="hidden" value="<%=res.getIdRes()%>" name="txtIdRES" id="txtIdRES">
                                        
                                        <%
                                        }else {%>
                                        	<input type="hidden"  name="txtIdEmpleado" id="txtIdEmpleado">
                                        	<input type="hidden"  name="txtIdRES" id="txtIdRES">
                                        <%}
                                        %>
                                        
                                        <button   class="btn btn-success btn-lg" >Grabar Revisión</button>
                              </div>
                 </form>        
                        </div>
                        </div>
                        </div>
                    </div><!-- /.row -->         
				<div id="lstRES" class="modal fade" tabindex="-1" data-width="780" style="display: none;">
			  <div class="modal-header">
			    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			    <h4 class="modal-title">Resoluciones de LES a visar</h4>
			  </div>
			  <div class="modal-body">
			    	<div class="box-body table-responsive" >
                                
                                <display:table name="listaVisarRES" id="aux"  class="table table-bordered table-striped">
                                	<display:column property="idRes" title="ID RES"></display:column> 
                                	<display:column property="nombreAprobador" title="Aprobado por"></display:column>      
                                	<display:column property="fechaAprobada" title="Fecha Aprobada"></display:column>
                                	
                                  	<display:column title="Estado">
                                			<c:choose>
                                						<c:when test="${aux.getIdEstado().equals('Aprobado')}">
                                						<span class="label label-primary">${aux.getIdEstado()}</span>
                                						</c:when>                                						
                                						<c:when test="${aux.getIdEstado().equals('Generado')}">
                                						<span class="label label-info">${aux.getIdEstado()}</span>
                                						</c:when>
                                						<c:when test="${aux.getIdEstado().equals('Visado')}">
                                						<span class="label label-success">${aux.getIdEstado()}</span>
                                						</c:when>                               						
                                						
                                			</c:choose> 
                                	</display:column>  
                                	<display:column title="Operacion">            
                                			<span class="btn btn-default btn-flat"> <a href="GestionarRES?operacion=visarRES&id=${aux.getIdRes()}">   <i class="fa fa-circle-o"></i>Evaluar</a></span>            
                                            
                                	</display:column>                                   	    
                                </display:table>
                                </div>
                     </div>
			    
		</div>
		   <!-- </form>  -->
			</section>
			<!-- /.content -->


			<!-- ############################################################################################################################################ -->
		</aside>
		<!-- /.right-side -->
	</div>
	<!-- ./wrapper -->


	<!-- jQuery 2.0.2 -->
	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="js/bootstrap.min.js" type="text/javascript"></script>
	<!-- AdminLTE App -->
	<script src="js/AdminLTE/app.js" type="text/javascript"></script>
	<script src="js/plugins/bootstrap-modal/bootstrap-modalmanager.js"></script>
   		<script src="js/plugins/bootstrap-modal/bootstrap-modal.js"></script>
	<!-- DATA TABES SCRIPT -->
	<script src="js/plugins/datatables/jquery.dataTables.js"
		type="text/javascript"></script>
	<script src="js/plugins/datatables/dataTables.bootstrap.js"
		type="text/javascript"></script>
	<script type="text/javascript" src="js/VisarRES/visarRES.js"></script>
	<script type="text/javascript" src="js/VisarRES/actualizarEstado.js"></script>

	<script type="text/javascript">
	// Example:
	$(document).ready(function(){
	    $('textarea').autosize();   
	});
	
	
	$(document).ready(function() {
		
	    $('input[type=checkbox]').live('click', function(){
	        var parent = $(this).parent().attr('id');
	        $('#'+parent+' input[type=checkbox]').removeAttr('checked');
	        $(this).attr('checked', 'checked');
	        
	       
	    });
	});
	
	
	

	function habilita(form)
	{ 
	form.intereses[0].disabled = false;
	form.intereses[1].disabled = false;
	form.intereses[2].disabled = false;
	}

	function deshabilita(form)
	{ 
	form.intereses[0].disabled = true;
	form.intereses[1].disabled = true;
	form.intereses[2].disabled = true;
	}
	
	function visado(){
		var idRES=''+document.getElementById('txtIdRES').value;
		var tipo=typeof(idRES);
		
		
		
		if(tipo=="string"){
			alert(idRES);
		}else{
			alert('no hay codigo');
			
		}
		
	}

	
	
	

	
	</script>
	<%}%>
	
	
	</body>
</html>
	