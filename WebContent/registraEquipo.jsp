<%@page import="entidad.Menu"%>
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
<title>INR | Equipo</title>
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
	<!-- Recupero datos de empleado que ingreso -->
	<%
	
	Empleado empleado= (Empleado) session.getAttribute("USUARIO_LOGEADO");    
		if(empleado==null){
			response.sendRedirect("index.jsp");
		}else{ 
			ArrayList<ListaCargoEquipo> tabla= new ArrayList<ListaCargoEquipo>();
			Menu mnu= (Menu) session.getAttribute("MenuDinamico");
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
                        <li class="treeview active" style="<%=mnu.getMant()%>">
                            <a href="equipo.jsp">
                                <i class="fa fa-bar-chart-o"></i>
                                <span>Equipo</span>
                                <i class="fa fa-angle-left pull-right"></i>
                            </a>
                            <ul class="treeview-menu">
                                <li class="active"><a href="registraEquipo.jsp"><i class="fa fa-angle-double-right"></i> Registrar Equipo</a></li>
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
                                 <li style="<%=mnu.getlLES()%>"><a href="GestionarLES?operacion=listarLes"><i class="fa fa-angle-double-right"></i>Consultar Solicitud LESs</a></li>
								<li style="<%=mnu.geteLES()%>"><a href="evaluarSolicitudLES.jsp"><i class="fa fa-angle-double-right"></i>Evaluar Solicitud LES</a></li>

                           </ul>
                        </li> 
                     	<%
                     	String mnuInactivo="display:block;";
                     		if((mnu.getgRES().equals("display:none;")) && (mnu.getlRES().equals("display:none;")) && (mnu.geteRES().equals("display:none;")) && (mnu.getVsrRES().equals("display:none;"))){
                     			mnuInactivo="display:none;";
                     		}
                     			%>
                        <li class="treeview" style="<%=mnuInactivo%>">
                        	<a href="RES.jsp">
                        		<i class="fa fa-bar-chart-o"></i>
                        		<span>RES</span>
                        		<i class="fa fa-angle-left pull-right"></i>
                        	</a>
                        	<ul class="treeview-menu">
                                <li style="<%=mnu.getgRES()%>"><a href="generarRES.jsp"><i class="fa fa-angle-double-right"></i>Generar Resolucion administrativa de LES</a></li>
                                <li style="<%=mnu.getlRES()%>"><a href="consutaRes.jsp"><i class="fa fa-angle-double-right"></i>Consultar Solicitud RES</a></li>
                                <li style="<%=mnu.geteRES()%>"><a href="evaluarRES.jsp"><i class="fa fa-angle-double-right"></i>Evaluar RES</a></li>
                                <li style="<%=mnu.getVsrRES()%>"><a href="visarRES.jsp"><i class="fa fa-angle-double-right"></i>Visar RES</a></li>
                           
                           </ul>							
                        </li>
                        
                      <!--  <li class="treeview" >
                        	<a href="#">
                        		<i class="fa fa-bar-chart-o"></i>
                        		<span>Descanso Médico</span>
                        		<i class="fa fa-angle-left pull-right"></i>
                        	</a>
                        	<ul class="treeview-menu">
                                <li><a href="consultarDM.jsp"><i class="fa fa-angle-double-right"></i>Evaluar Descanso Médico</a></li>
                           </ul>
                        </li>       -->       
					</ul>

                       
                </section>
                <!-- /.sidebar -->
            </aside><!-- Fin del Menu -->

		<!-- Right side column. Contains the navbar and content of the page -->
		<aside class="right-side">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					Registrar Equipos de Unidades Orgánicas<small>Agregue
						equipos a las oficinas del INR Dra. Adriana Rebaza Flores</small>
				</h1>
				<!-- Modificar al crear nuevos -->
				<ol class="breadcrumb">
					<li><a href="bienvenido.jsp"><i class="fa fa-dashboard"></i>
							Home</a></li>
					<li><a href="equipo.jsp">Equipo</a></li>
					<li class="active">Registrar Equipo</li>
				</ol>
			</section>

			<!-- Main content -->
		<!-- ############################################################################################################################################ -->
			<section class="content">
				<div class="box box-primary">
					<div class="row">
					
					<input type="hidden" value="registrar">
						<!-- left column -->
						<div class="col-md-11">
						
					<form role="form" name="equipo" action="gestionarEquipo">
							<!-- /.box-header -->
							<!-- form start -->
							
							<input type="hidden" name="operacion" value="registrarEquipo">
								
								<div class="box-header">
									<h3 class="box-title">Datos de Equipos</h3>
								</div>
								<div class="box-body">
									<div class="form-group">
										<h4>Elija la Unidad Orgánica a agregar equipos</h4>
										<label>Unidad Orgánica :</label>
										<cbo:cboDinamico sql="SQL_UNIDA_ORGANICA" nombre="cboUnidad" id="cboUnidad" />
									</div>
									
									<div class="form-group">
										<label for="txtNombreEquipo">Nombre de Equipo</label> <input
											type="text" class="form-control" id="txtNombreEquipo"
											name="txtNombreEquipo" placeholder="Ingrese Nombre de Equipo">
									</div>
									<div class="form-group">
										<label for="txtDescripcion">Descripción</label> <input
											type="text" class="form-control" id="txtDescripcion"
											name="txtDescripcion" placeholder="Ingrese una descripción">
									</div>
									<br>
									<div >
											<iframe src="tablaListaCargoXEquipo.jsp" style=" width: 1000px; height: 600px; " >
						
											</iframe>
									</div>
								</div>
								<div class="box-footer" align="center">
									<button  type="submit" class="btn btn-primary">Grabar
									 	Nuevo Equipo</button>
								</div>
						</form>

					
						</div>
						
						
						 
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
	<!-- funciones propias -->
	<script src="js/romario.js" type="text/javascript"></script>

	<script type="text/javascript">
	
	 function addRow(tableID) {
		
		var nombreCargo=document.equipo.txtNombreCargo.value
		var sueldoCargo=document.equipo.txtSueldo.value	
		var gestionarLES=0;
		var gestionarRES=0;
		var verificarLES=0;
		var verificarRES=0;
		var mantenimiento=0;
		var reportes=0;
		
		if(document.getElementById('chkGestionarLES').checked){
			gestionarLES=1;
		}
		if(document.getElementById('chkGestionarRES').checked){
			gestionarRES=1;
		}
		if(document.getElementById('chkVerificarLES').checked){
			verificarLES=1;
		}
		if(document.getElementById('chkVerificarRES').checked){
			verificarRES=1;
		}
		if(document.getElementById('chkMantenimiento').checked){
			mantenimiento=1;
		}
		if(document.getElementById('chkReportes').checked){
			reportes=1;
		}
		
		//var chkReporte=document.equipo.chkReportes.value

       var table = document.getElementById(tableID);

       var rowCount = table.rows.length;

       var row = table.insertRow(rowCount);
   
       var cell1 = row.insertCell(0);
       var element1 = document.createElement("input");
       element1.type = "checkbox";
       cell1.appendChild(element1);

       var cell2 = row.insertCell(1);
       var element2 = document.createElement("td");
       cell2.appendChild(document.createTextNode(nombreCargo));
       
       
       
       var cell3 = row.insertCell(2);
       var element3 = document.createElement("td");
	   cell3.appendChild(document.createTextNode(sueldoCargo));
		
	   var cell4 = row.insertCell(3);
       var element4 = document.createElement("td");
       cell4.appendChild(document.createTextNode(gestionarLES));
       
       var cell5 = row.insertCell(4);
       var element5 = document.createElement("td");
       cell5.appendChild(document.createTextNode(gestionarRES));
       
       var cell6 = row.insertCell(5);
       var element6 = document.createElement("td");
       cell6.appendChild(document.createTextNode(verificarLES));
       
       var cell7 = row.insertCell(6);
       var element7 = document.createElement("td");
       cell7.appendChild(document.createTextNode(verificarRES));
       
       var cell8 = row.insertCell(7);
       var element8 = document.createElement("td");
       cell8.appendChild(document.createTextNode(mantenimiento));
       
       var cell9 = row.insertCell(8);
       var element9 = document.createElement("td");
       cell9.appendChild(document.createTextNode(reportes));
      
       
    
  }



  function deleteRow(tableID) {

       try {

       var table = document.getElementById(tableID);

       var rowCount = table.rows.length;



       for(var i=0; i<rowCount; i++) {

            var row = table.rows[i];

            var chkbox = row.cells[0].childNodes[0];

            if(null != chkbox && true == chkbox.checked) {

                 table.deleteRow(i);

                 rowCount--;

                 i--;

            }

       }

       }catch(e) {

            alert(e);

       }
  }
</script> 
	<%}%>	
	
	
	
</body>
</html>
