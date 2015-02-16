<%@page import="entidad.Les"%>
<%@page import="entidad.Menu"%>
<%@page import="entidad.Utilitario"%>
<%@page import="entidad.Cargo"%>
<%@page import="entidad.Empleado"%>
<%@ taglib uri="http://displaytag.sf.net/el" prefix="display"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>INR | LES</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- bootstrap 3.0.2 -->
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- font Awesome -->
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <!-- Ionicons -->
        <link href="css/ionicons.min.css" rel="stylesheet" type="text/css" />
        <!-- daterange picker -->
        <link href="css/daterangepicker/daterangepicker-bs3.css" rel="stylesheet" type="text/css" />
        <!-- Theme style -->
        <link href="css/AdminLTE.css" rel="stylesheet" type="text/css" />
        <!-- iCheck for checkboxes and radio inputs -->
        <link href="css/iCheck/all.css" rel="stylesheet" type="text/css" />
        <!-- Icono -->
        <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
		<link rel="icon" href="favicon.ico" type="image/x-icon">
		<link href="css/bootstrap-modal/bootstrap-modal-bs3patch.css" rel="stylesheet" />
  		<link href="css/bootstrap-modal/bootstrap-modal.css" rel="stylesheet" />
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
    		
    	%>
    
        <!-- header logo: style can be found in header.less -->
        <header class="header">
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
                                <span><%=empleado.getNombresEmpleado() %>&nbsp;<%=empleado.getApellidoPaterno() %> <i class="caret"></i></span>
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
                 
                       <li class="treeview active" style="<%=mnu.getgLES()%>">
                            <a href="LES.jsp">
                                <i class="fa fa-bar-chart-o"></i>
                                <span>LES</span>
                                <i class="fa fa-angle-left pull-right"></i>
                            </a>
                            <ul class="treeview-menu">

                                <li class="active"><a href="GestionarLES?operacion=listarCargoxNombre&nom=<%=empleado.getIdCargo() %>&id=<%=empleado.getIdEmpleado()%>"><i class="fa fa-angle-double-right"></i>Gestionar LES</a></li>
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
                        Licencia por Enfermedad Subsidiada
                        <small>---------------</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="bienvenido.jsp"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li><a href="LES.jsp">LES</a></li>    
                        <li class="active">Generar LES</li>                
                    </ol>
                </section>
				<%
    			Cargo objCar= (Cargo) request.getAttribute("daoCargo");
				Utilitario objUtil= (Utilitario) request.getAttribute("daoUtil");
				Les ls=(Les) request.getAttribute("lesEstado");
				String diagnostico="",dmot="",les="",mtv="",fechaI="",fechaF="",opr="generarLES";
				String ad="",adm="",afecha="",amot="",lad="",ladm="",lafecha="",lamot="",iad="",iadm="",iafecha="",iamot="";
				int cant=0;
					if(ls!=null){
						diagnostico=ls.getDiagnostico();
						dmot=ls.getDescripcionMotivo();
						fechaI=ls.getFechaInicioDes();
						fechaF=ls.getFechaFinDes();
						les=ls.getIdLes();
						mtv=ls.getMotivoLicencia();
						cant=ls.getCantidad();
						opr="modificarLES";
								
						String errores = ls.getError();
						String[] arrayErrores = errores.split(",");
						ad=arrayErrores[0];
						if(ad.equals("has-success")){
							lad="for='inputSuccess'";
							iad="fa fa-check"; 
						}
						else{
							lad="for='inputWarning'";
							iad="fa fa-warning"; 
						}
						adm=arrayErrores[1];
						if(adm.equals("has-success")){
							ladm="for='inputSuccess'";
							iadm="fa fa-check"; 
						}
						else{
							ladm="for='inputWarning'";
							iadm="fa fa-warning"; 
						}
						afecha=arrayErrores[2];
						if(afecha.equals("has-success")){
							lafecha="for='inputSuccess'";
							iafecha="fa fa-check"; 
						}
						else{
							lafecha="for='inputWarning'";
							iafecha="fa fa-warning"; 
						}
						amot= arrayErrores[3];
						if(amot.equals("has-success")){
							lamot="for='inputSuccess'";
							iamot="fa fa-check"; 
						}
						else{
							lamot="for='inputWarning'";
							iamot="fa fa-warning"; 
						}
					}
							
    			%>
                <!-- Main content -->
                <section class="content">              
					<h4 class="page-header">
                        Generar Licencia por Enfermedad Subsidiada   
                                                  
                    </h4>
                    <!-- Div principal -->
                    <div class="box box-primary">
                    	<div class="box-header">
                    		<h3 class="box-title" align="center">
                    			Ingrese datos para la Licencia 
                         	</h3>                    		 
                    		</div>
                    	<form action=" GestionarLES" method="post" enctype="multipart/form-data">
                    		<div class="box-body">
                    		<input type="hidden" name="operacion" value="<%=opr%>" >
                    		  <div class="row">
                    		  <div class="col-md-9">
												<div class="<%=objUtil.getClase()%>">
													<i class="<%=objUtil.getIcono()%>"></i><%=objUtil.getContenido()%>&nbsp;<%=objUtil.getEstado()%>
												</div>												
								</div>
                    			<div class="col-md-6">
			                            <div class="box box-info" style="<%=objUtil.getFlag()%>">
			                                <div class="box-header">
			                                    <i class="fa fa-group"></i>
			                                    <h3 class="box-title">Datos del Empleado</h3>
			                                </div><!-- /.box-header -->
			                                <div class="box-body">
			                                    <div class="row"> 
			                                    	<div class="col-md-8">
			                                    			<div class="form-group">			                                    			
			                                    				<input type="hidden" name="idLES" value="<%=les%>">
			                                    				<input type="hidden" name="id" value="<%=empleado.getIdEmpleado()%>">			                                    				
			                                    				<input type="hidden" name="txtNombre" value="<%=empleado.getNombresEmpleado()%> <%=empleado.getApellidoPaterno() %>">
				                                      			<label>DNI :</label>
				                                      			<input type="text" class="form-control" placeholder="Ingrese tu numero de DNI" name="txtDNI" id="txtDNI" value="<%=empleado.getnDNI()%>" disabled>
				                                            </div>
				                                      	    <div class="form-group">
				                                      			<label>Nombre y Apellido:</label>
				                                      			<input type="text" class="form-control" placeholder="Ingrese nombre completo" name="txt" id="txtNombre" value="<%=empleado.getNombresEmpleado()%> <%=empleado.getApellidoPaterno() %>" disabled>
				                                            </div>
				                                            <div class="form-group">
				                                      			<label>Fecha Nacimiento :</label>
				                                      			  <div class="input-group">
				                                            		<div class="input-group-addon">
				                                                		<i class="fa fa-calendar"></i>
				                                            		</div>                                            		
				                                            		<input type="text" class="form-control"  name="txtFechaN" id="txtFechaN" data-inputmask="'alias': 'yyyy/mm/dd'" data-mask value="<%=empleado.getFechaNacimiento()%>" disabled/>
				                                            		
				                                       			  </div><!-- /.input group -->
				                                            </div>
				                                            <div class="form-group">
				                                      			<label>Celular :</label>
				                                      			<div class="input-group">
				                                           			 <div class="input-group-addon">
				                                               			<i class="fa fa-phone"></i>
				                                           			 </div>
				                                           			 <input type="text" class="form-control" name="txtFono" id="txtFono" data-inputmask='"mask": "999-999-999"' data-mask value="<%=empleado.getTelefono()%>" disabled/>
				                                        		</div><!-- /.input group -->
				                                            </div>
				                                            <div class="form-group">
				                                      			<label>Seguro Social :</label>
				                                      			<div class="input-group">
				                                           			 <div class="input-group-addon">
				                                               			<i class="fa fa-info"></i>
				                                           			 </div>
				                                           			 <input type="text" class="form-control" name="txtSeguroSocial" id="txtSeguroSocial" data-inputmask='"mask": "99999999999"' data-mask value="<%=empleado.getNumeroSeguroSocial()%>" disabled/>
				                                        		</div><!-- /.input group -->                                      			
				                                            </div>
			                                    	</div>
			                                    </div>
			                                </div><!-- /.box-body -->
			                            </div><!-- /.box -->
			                        </div>
			                       
			                        <div class="col-md-6">
			                            <div class="box box-success" style="<%=objUtil.getFlag()%>">
			                                <div class="box-header">
			                                    <i class="fa fa-briefcase"></i>
			                                    <h3 class="box-title">Datos del Trabajo</h3>
			                                </div><!-- /.box-header -->
			                                <div class="box-body">
			                                    <div class="row"> 
			                                    	<div class="col-md-8">
			                                    		<div class="form-group">
                                      						<label>Unidad Organica :</label>
                                      						<input type="text" class="form-control" placeholder="Ingrese tu numero de DNI" id="txtUnidad" value="<%=objCar.getNombreCargo()%>" disabled> 
                                            			</div>
                                            			<div class="form-group">
                                      						<label>Equipo :</label>
                                      						<input type="text" class="form-control" placeholder="Ingrese tu numero de DNI" id="txtEquipo"  value="<%=objCar.getIdRol()%>" disabled>
                                            			</div>
                                            			<div class="form-group">
                                      						<label>Nombre del Cargo :</label>
                                      						<input type="text" class="form-control" placeholder="Ingrese tu numero de DNI" id="txtCargo" value="<%=objCar.getIdCargo()%>" disabled>
                                            			</div>
                                            			<div class="form-group">
                                      						<label>Sueldo :</label>
                                      						<input type="text" class="form-control" placeholder="Ingrese tu numero de DNI" id="txtSueldo" value="<%=objCar.getSueldo()%>" disabled>
                                            			</div>
                                    					<div class="form-group">
                                      						<label>Fecha de Ingreso:</label>
                                      						 <div class="input-group">
				                                            		<div class="input-group-addon">
				                                                		<i class="fa fa-calendar"></i>
				                                            		</div>                                            		
				                                            		<input type="text" class="form-control"  id="txtFechaI" data-inputmask="'alias': 'yyyy/mm/dd'" data-mask value="<%=empleado.getFechaIngreso()%>" disabled/>
				                                            		
				                                       			  </div><!-- /.input group -->                                      						
                                            			</div>
			                                    	</div>
			                                    </div>
			                                </div><!-- /.box-body -->
			                            </div><!-- /.box -->
			                        </div>
			                         
			                             <div class="col-md-6">
			                            <div class="box box" style="<%=objUtil.getFlag()%>">
			                            			                            
			                                <div class="box-header">
			                                    <i class="fa fa-book"></i>
			                                    <h3 class="box-title">Descanso Medico</h3>
			                                </div><!-- /.box-header -->
			                                <div class="box-body">
			                                    <div class="row"> 
			                                    	<div class="col-md-10">
			                                    		<div class="form-group <%=ad%>">
                                      						<label <%=lad %>> <i class="<%=iad%>"></i> Diagnostico Medico :</label>
                                      						<input type="text" class="form-control" id="Diagnostico" name="txtDiagnostico" value="<%=diagnostico%>">
                                            			</div>
                                            			<div class="form-group <%=afecha%>">
					                                        <label <%=lafecha %>> <i class="<%=iafecha%>"></i> Rango de Fechas de Descanso:</label>
					                                        <div class="input-group">
					                                            <div class="input-group-addon">
					                                                <i class="fa fa-calendar"></i>
					                                            </div>
					                                            <input type="text" class="form-control pull-right" id="reservation" name="rngFecha" value="<%=fechaI%>-<%=fechaF%>" />
					                                        </div><!-- /.input group -->
					                                    </div><!-- /.form group -->
                                            			<div class="form-group <%=afecha%>">
                                      						<label <%=lafecha %>><i class="<%=iafecha%>"></i> Dias Subsidiados :</label>
                                      						<input type="text" class="form-control" id="cantidad1" value="<%=cant %>" disabled>
                                      						<input type="hidden" class="form-control" id="cantidad" value="<%=cant %>" name="txtDias">
                                            			</div>
                                            			<div class="form-group">
                                            			 	<div class="form-group">
					                                            <label for="exampleInputFile">Adjuntar Documento</label>
					                                            <input type="file" id="exampleInputFile" name="txtDocumento">
					                                        </div>
					                                        <input type="hidden" class="form-control" id="fecha1" name="txtFecha1" value="<%=fechaI%>">
					                                        <input type="hidden" class="form-control" id="fecha2" name="txtFecha2" value="<%=fechaF%>">
                                      						
                                            			</div>
                                    					
			                                    	</div>
			                                    </div>
			                                </div><!-- /.box-body -->
			                            </div><!-- /.box -->
			                        </div>
			                             <div class="col-md-6">
			                            <div class="box box-danger" style="<%=objUtil.getFlag()%>">
			                                <div class="box-header">
			                                    <i class="fa fa-comments-o"></i>
			                                    <h3 class="box-title">Descripcion Solicitud</h3>
			                                </div><!-- /.box-header -->
			                                <div class="box-body">
			                                    <div class="row"> 
			                                    	<div class="col-md-11">
			                                    		<div class="form-group <%=amot%>">
			                                    		<% 
			                                    			String sef="",sn="",sTBC="";
					                                           if(mtv.equals("Enfermedad Común")){
					                                        	   sef="selected";
					                                           }else if(mtv.equals("Neoplásica")){
					                                        	   sn="selected";
					                                           }else if(mtv.equals("T.B.C")) {
					                                        	   sTBC="selected";
					                                           }else{
					                                        	   sef="";
					                                        	   sn="";
					                                        	   sTBC="";
					                                           }
			                                    			%>			                                    		
                                      						<label <%=lamot %>><i class="<%=iamot%>"></i>Motivo de Licencia :</label>
                                      						<select class="form-control" name="cboLicencia" id="cboLicencia">
				                                                <option value="-1">[Seleccione]</option>
				                                                <option value="Enfermedad Común" <%=sef %>>Enfermedad Común</option>
				                                                <option value="Neoplásica" <%=sn %>>Neoplásica</option>
				                                                <option value="T.B.C" <%=sTBC %>>T.B.C</option>
				                                            </select>
                                            			</div>
                                            			<div class="form-group <%=adm%>">
                                      						<label <%=ladm %>> <i class="<%=iadm%>"></i> Descripcion :</label>
                                      						<textarea class="form-control" cols="2"rows="7" name="txtDescripcionLicencia" id="txtLicencia">
                                      						<%=dmot %>						
                                      						</textarea>
                                            			</div>
                                            			
			                                    	</div>
			                                    </div>
			                                </div><!-- /.box-body -->
			                            </div><!-- /.box -->
			                        </div>
                    			</div>
                    		</div>
                    		<% 
									        
                    			String estado="display:inline;";
                    		if (objUtil.getFlag().equals("display:none;")){
                    			estado="display:none;";
                    		}
                    		%>
                    		<div class="box-footer">
                             	<button class="btn btn-primary" type="submit" style="<%=estado%>" >Enviar <i class="fa fa-arrow-circle-right"></i></button>
                             	<button class="btn btn-primary" data-toggle="modal"  href="#lstLES" style="display:inline;">Ver Historial <i class="fa fa-arrow-circle-right"></i></button> 
                             	<button class="btn btn-primary" data-toggle="modal" id="mVista"  href="#VistaPrev" style="<%=estado%>">VISTA PREVIAAAA <i class="fa fa-arrow-circle-right"></i></button>  
                            	<button class="btn btn-primary" type="button" id="Vista" style="<%=estado%>">Vista Previa<i class="fa fa-arrow-circle-right"></i></button>  
                             </div><!-- Fin Box-Footer -->
                    	</form>                    
                    </div> 
                </section><!-- /.content -->                    
            </aside><!-- /.right-side -->
        </div><!-- ./wrapper -->
		<div id="lstLES" class="modal fade" tabindex="-1" data-width="760" style="display: none;">
			  <div class="modal-header">
			    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			    <h4 class="modal-title">Historial de LES generados</h4>
			  </div>
			  <div class="modal-body">
			    <div class="box-body table-responsive" >
                                
                                <display:table name="lesCodigo" id="aux"  class="table table-bordered table-striped">
                                	<display:column property="idLes" title="ID"></display:column> 
                                	<display:column property="diagnostico" title="Diagnostico"></display:column>      
                                	<display:column property="fechaInicioDes" title="F. Inicio"></display:column>
                                	<display:column property="fechaFinDes" title="F. Fin"></display:column>  
                                	<display:column property="motivoLicencia" title="Motivo"></display:column>  
                                	<display:column property="descripcionMotivo" title="Descripcion"></display:column>  
                                	<display:column property="fechaHora" title="F. Hora"></display:column> 
                                	<display:column property="idEmpleado" title="Empleado"></display:column> 
                                	<display:column title="Estado">
                                			<c:choose>
                                						<c:when test="${aux.getIdEstado().equals('Generado')}">
                                						<span class="label label-primary">${aux.getIdEstado()}</span>
                                						</c:when>
                                						<c:when test="${aux.getIdEstado().equals('Conforme')}">
                                						<span class="label label-default">${aux.getIdEstado()}</span>
                                						</c:when>
                                						<c:when test="${aux.getIdEstado().equals('Disconforme')}">
                                						<span class="label label-warning">${aux.getIdEstado()}</span>
                                						</c:when>
                                						<c:when test="${aux.getIdEstado().equals('Actualizado')}">
                                						<span class="label label-info">${aux.getIdEstado()}</span>
                                						</c:when>
                                						<c:when test="${aux.getIdEstado().equals('Desaprobado')}">
                                						<span class="label label-danger">${aux.getIdEstado()}</span>
                                						</c:when>
                                						<c:when test="${aux.getIdEstado().equals('Aprobado')}">
                                						<span class="label label-success">${aux.getIdEstado()}</span>
                                						</c:when>
                                			</c:choose> 
                                	</display:column>                                    	    
                                </display:table>
                                </div>
                     </div>
			    
		</div>
		<div id="VistaPrev" class="modal fade" tabindex="-1" data-width="900" style="display: none;">
			 <div class="modal-header">
			    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			    <h4 class="modal-title">Vista Previa : </h4>
			  </div>
			   <div class="modal-body">
			   <iframe class="preview-pane" type="application/pdf" id="VisorPDF" width="100%" height="650"  style="position:relative;z-index:999"></iframe>
			   </div> 
		</div>
        <!-- jQuery 2.0.2 -->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
        <!-- Bootstrap -->
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <!-- AdminLTE App -->
        <script src="js/AdminLTE/app.js" type="text/javascript"></script>
        <script src="js/plugins/input-mask/jquery.inputmask.js" type="text/javascript"></script>
        <script src="js/plugins/input-mask/jquery.inputmask.date.extensions.js" type="text/javascript"></script>
        <script src="js/plugins/input-mask/jquery.inputmask.extensions.js" type="text/javascript"></script>
        <!-- date-range-picker -->
        <script src="js/plugins/daterangepicker/daterangepicker.js" type="text/javascript"></script>
        <script src="js/plugins/bootstrap-modal/bootstrap-modalmanager.js"></script>
   		<script src="js/plugins/bootstrap-modal/bootstrap-modal.js"></script>
   		<script type="text/javascript" src="js/plugins/jsPDF/base64.js"></script>
		<script type="text/javascript" src="js/plugins/jsPDF/sprintf.js"></script>
		<script type="text/javascript" src="js/plugins/jspdf.js"></script>
		<script type="text/javascript" src="js/javier.js"></script>
		<%}%>
    </body>
</html>