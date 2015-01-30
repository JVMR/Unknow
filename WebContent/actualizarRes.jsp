<%@page import="entidad.Menu"%>
<%@page import="entidad.Res"%>
<%@page import="entidad.Empleado"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.text.DateFormat"%>
<%@ page import="java.util.Date"%>

<!DOCTYPE html>
<html lang="en">
	<head>
		<!-- GENERAR RESOLUCIï¿½N ADMINISTRATIVA -->
		<meta charset="utf-8">
		<title>INR | RES</title>
		<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- bootstrap 3.0.2 -->
         <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- font Awesome -->
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <!-- Ionicons -->
        <link href="css/ionicons.min.css" rel="stylesheet" type="text/css" />
        <!-- Theme style -->
        <link href="css/AdminLTE.css" rel="stylesheet" type="text/css" />
        <!-- bootstrap wysihtml5 - text editor -->
        <link href="../../css/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css" rel="stylesheet" type="text/css" />
        
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
    		Menu mnu= (Menu) session.getAttribute("MenuDinamico");
    		Res objRes= (Res) request.getAttribute("daoRes");
    		 DateFormat fecha = new SimpleDateFormat("yyyy-MM-dd"); %>
        <!-- header logo: style can be found in header.less -->
       <header class="header"><!-- Inicio del encabezado  -->
            <a href="bienvenido.jsp" class="logo">
                <!-- Add the class icon to your logo image or logo icon to add the margining -->
                INR
            </a>
            <!-- Header Navbar: style can be found in header.less -->
            <nav class="navbar navbar-static-top" role="navigation">
                <!-- Sidebar toggle button-->
                <a href="#" class="navbar-btn sidebar-toggle" data-toggle="offcanvas" role="button">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </a>
                <div class="navbar-right">
                    <ul class="nav navbar-nav">                               
                        <!-- User Account: style can be found in dropdown.less -->
                        <li class="dropdown user user-menu">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="glyphicon glyphicon-user"></i>
                                <span><%=empleado.getNombresEmpleado() %>&nbsp;<%=empleado.getApellidoPaterno() %><i class="caret"></i></span>
                            </a>
                            <ul class="dropdown-menu">
                                <!-- User image -->
                                <li class="user-header bg-light-blue">
                                    <img src="GestionarEmpleado?operacion=fotoEmpleado&id=<%=empleado.getIdEmpleado() %>" class="img-circle" alt="User Image" />

                                    <p><%=empleado.getNombresEmpleado() %>&nbsp;<%=empleado.getApellidoPaterno() %> <br/>

                                        <%=empleado.getIdCargo() %>
                                        <small>Asalariado desde <%=empleado.getFechaIngreso() %></small>
                                    </p>
                                </li>                                
                                <li class="user-footer">
                                    <div class="pull-left">
                                        <a href="perfil.jsp" class="btn btn-default btn-flat">Profile</a>
                                    </div>
                                    <div class="pull-right">
                                        <a href="logout" class="btn btn-default btn-flat">Salir</a>
                                    </div>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </nav>
        </header><!-- Fin del encabezado  -->
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
								<li style="<%=mnu.geteLES()%>"><a href="GestionarLES?operacion=evLes"><i class="fa fa-angle-double-right"></i>Evaluar Solicitud LES</a></li>

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
                                <li class="active" style="<%=mnu.getgRES()%>"><a href="generarRES.jsp"><i class="fa fa-angle-double-right"></i>Generar Resolucion administrativa de LES</a></li>
                                <li style="<%=mnu.getlRES()%>"><a href="consutaRes.jsp"><i class="fa fa-angle-double-right"></i>Consultar Solicitud RES</a></li>
                                <li style="<%=mnu.geteRES()%>"><a href="evaluarRES.jsp"><i class="fa fa-angle-double-right"></i>Evaluar RES</a></li>
                                <li style="<%=mnu.getVsrRES()%>"><a href="visarRES.jsp"><i class="fa fa-angle-double-right"></i>Visar RES</a></li>
                           
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
                        RES
                        <small>Todas las oficinas del INR Dra. Adriana Rebaza Flores</small>
                    </h1>
                    <!-- Modificar al crear nuevos -->
                    <ol class="breadcrumb">
                        <li><a href="bienvenido.jsp"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li><a href="#">RES</a></li>
                        <li class="active">Generar Resolucion administrativa de LES</li>
                    </ol>
                </section>

                <!-- Main content -->
                <!-- ---------------------------------------------------------------------------------------------------------------- -->
                <section class="content">
                
                
					<!-- general form elements -->
				 <!-- 	<div id="centro">
					este es el centro
					</div>  -->
					
                            <div class="box box-primary">
                                <div class="box-header">
                                  <!-- <h3 class="box-title" align="center">Unidad Or</h3> -->  
                                </div><!-- /.box-header -->
                                <!-- form start -->
                              
                                        <!-- text input -->
                                      <!-- <div class="form-group"> -->  
                                     
       										
       	<form action="gestionarRES" style="border :1px;border-style: solid;padding-left:50px;">
       	<input type="hidden" value="actualizarRes" name="operacion" >
       			<input type="hidden" value="<%=objRes.getIdRes()%>" name="txtIdRes" > 
          		<div class="form-group">
                 	<label>A  :</label>   
                       	<input type="text" class="form-control" placeholder="Escriba ..."  value="Miguel Llamoca Llamoca" >
                </div>
               <div class="form-group">
               		<label>De  :</label>               	
               		<input type="text" class="form-control" placeholder="Escriba ..."   value="<%=empleado.getNombresEmpleado()%>">
                </div>
               <div class="form-group">
               		<label>Referencia :</label>               	
               		<input type="text" class="form-control"  placeholder="Escriba ..."  name="txtReferencia" value="<%=objRes.getReferencia()%>">
                </div>
               <div class="form-group">
               		<label>Descriptor :</label>           	
               		<input type="text" class="form-control" value="<%=objRes.getDescriptor()%>" placeholder="Escriba ..."  name="txtDescriptor">
                </div>
               <div class="form-group">
               		<label>Fecha :</label>         	
               		<div class="input-group">
                                            		<div class="input-group-addon">
                                                		<i class="fa fa-calendar"></i>
                                            		</div>                                            		
                                            		<input type="text" class="form-control"  name="txtFechaG" value="<%=objRes.getFechaGenerado()%>" data-inputmask="'alias': 'yyyy/mm/dd'" data-mask/>
                                            		
                                       			  </div><!-- /.input group -->
                </div>
               <div class="form-group">
               		<label>I. Objeto de consulta :</label>   	
                </div>
               <div class="form-group">
               		<input type="text" class="form-control"   name="txtObjetoConsulta" value="<%=objRes.getObjetoConsulta() %>" style="width: 200px;height: 80px;" />  	
                </div>
               <div class="form-group">
               		<label>II. Análisis :</label>
                </div>
               <div class="form-group">
               		<input type="text" class="form-control"  name="txtAnalisis" value="<%=objRes.getAnalisis() %>" style="width: 200px;height: 80px;" />   	
                </div>       	
         	<label>Se resuelve que la licencia por enfermedad subsidiada con codigo <input type="text" name="txtIdLes" value="<%=objRes.getIdLes()%>" />  del asalariado <input type="text" name="txtidAsalariado" value="<%=objRes.getIdAsalariado()%>" /><br /> 
         	es previamente aprobado por el análisis mencionado.</label><br /><br />
         	<button class="btn btn-primary" type="submit" >Enviar</button>
           <button class="btn btn-primary btn-sm">Vista Previa</button> &nbsp;
         </form>
									
										    
										    <!-- /.box-body -->
									    

                            </div><!-- /.box -->
               
         
         
         
         
                 
         
                         </section><!-- /.content -->
                <!-- ---------------------------------------------------------------------------------------------------------------- -->
            </aside><!-- /.right-side -->
        </div><!-- ./wrapper -->
		
        <!-- jQuery 2.0.2 -->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
        <!-- Bootstrap -->
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <!-- AdminLTE App -->
        <script src="js/AdminLTE/app.js" type="text/javascript"></script>
         <%   		
    		
    	}
    		
    	%>
	</body>
</html>