<%@page import="entidad.Utilitario"%>
<%@page import="entidad.Cargo"%>
<%@page import="entidad.Empleado"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>INR | Inicio</title>
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
                        <li class="treeview">
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
                 
                       <li class="treeview active">
                            <a href="LES.jsp">
                                <i class="fa fa-bar-chart-o"></i>
                                <span>LES</span>
                                <i class="fa fa-angle-left pull-right"></i>
                            </a>
                            <ul class="treeview-menu">

                                <li class="active"><a href="GestionarLES?operacion=listarCargoxNombre&nom=<%=empleado.getIdCargo() %>&id=<%=empleado.getIdEmpleado()%>"><i class="fa fa-angle-double-right"></i>Gestionar LES</a></li>
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
                    		<input type="hidden" name="operacion" value="generarLES" >
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
			                                    				<input type="hidden" name="id" value="<%=empleado.getIdEmpleado()%>">
				                                      			<label>DNI :</label>
				                                      			<input type="text" class="form-control" placeholder="Ingrese tu numero de DNI" name="txtDNI" value="<%=empleado.getnDNI()%>" disabled>
				                                            </div>
				                                      	    <div class="form-group">
				                                      			<label>Nombre y Apellido:</label>
				                                      			<input type="text" class="form-control" placeholder="Ingrese nombre completo" name="txtNombre" value="<%=empleado.getNombresEmpleado()%>&nbsp;<%=empleado.getApellidoPaterno() %>" disabled>
				                                            </div>
				                                            <div class="form-group">
				                                      			<label>Fecha Nacimiento :</label>
				                                      			  <div class="input-group">
				                                            		<div class="input-group-addon">
				                                                		<i class="fa fa-calendar"></i>
				                                            		</div>                                            		
				                                            		<input type="text" class="form-control"  name="txtFechaN" data-inputmask="'alias': 'yyyy/mm/dd'" data-mask value="<%=empleado.getFechaNacimiento()%>" disabled/>
				                                            		
				                                       			  </div><!-- /.input group -->
				                                            </div>
				                                            <div class="form-group">
				                                      			<label>Celular :</label>
				                                      			<div class="input-group">
				                                           			 <div class="input-group-addon">
				                                               			<i class="fa fa-phone"></i>
				                                           			 </div>
				                                           			 <input type="text" class="form-control" name="txtFono" data-inputmask='"mask": "999-999-999"' data-mask value="<%=empleado.getTelefono()%>" disabled/>
				                                        		</div><!-- /.input group -->
				                                            </div>
				                                            <div class="form-group">
				                                      			<label>Seguro Social :</label>
				                                      			<div class="input-group">
				                                           			 <div class="input-group-addon">
				                                               			<i class="fa fa-info"></i>
				                                           			 </div>
				                                           			 <input type="text" class="form-control" name="txtSeguroSocial" data-inputmask='"mask": "99999999999"' data-mask value="<%=empleado.getNumeroSeguroSocial()%>" disabled/>
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
                                      						<input type="text" class="form-control" placeholder="Ingrese tu numero de DNI" name="txtDNI" value="<%=objCar.getNombreCargo()%>" disabled> 
                                            			</div>
                                            			<div class="form-group">
                                      						<label>Equipo :</label>
                                      						<input type="text" class="form-control" placeholder="Ingrese tu numero de DNI" name="txtDNI" value="<%=objCar.getIdRol()%>" disabled>
                                            			</div>
                                            			<div class="form-group">
                                      						<label>Nombre del Cargo :</label>
                                      						<input type="text" class="form-control" placeholder="Ingrese tu numero de DNI" name="txtDNI" value="<%=objCar.getIdCargo()%>" disabled>
                                            			</div>
                                            			<div class="form-group">
                                      						<label>Sueldo :</label>
                                      						<input type="text" class="form-control" placeholder="Ingrese tu numero de DNI" name="txtDNI" value="<%=objCar.getSueldo()%>" disabled>
                                            			</div>
                                    					<div class="form-group">
                                      						<label>Fecha de Ingreso:</label>
                                      						 <div class="input-group">
				                                            		<div class="input-group-addon">
				                                                		<i class="fa fa-calendar"></i>
				                                            		</div>                                            		
				                                            		<input type="text" class="form-control"  name="txtFechaN" data-inputmask="'alias': 'yyyy/mm/dd'" data-mask value="<%=empleado.getFechaIngreso()%>" disabled/>
				                                            		
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
			                                    		<div class="form-group">
                                      						<label>Diagnostico Medico :</label>
                                      						<input type="text" class="form-control" placeholder="Ingrese el diagnostico" id="Diagnostico" name="txtDiagnostico">
                                            			</div>
                                            			<div class="form-group">
					                                        <label>Rango de Fechas de Descanso:</label>
					                                        <div class="input-group">
					                                            <div class="input-group-addon">
					                                                <i class="fa fa-calendar"></i>
					                                            </div>
					                                            <input type="text" class="form-control pull-right" id="reservation" name="rngFecha"/>
					                                        </div><!-- /.input group -->
					                                    </div><!-- /.form group -->
                                            			<div class="form-group">
                                      						<label>Dias Subsidiados :</label>
                                      						<input type="text" class="form-control" id="cantidad1" disabled>
                                      						<input type="hidden" class="form-control" id="cantidad" name="txtDias">
                                            			</div>
                                            			<div class="form-group">
                                            			 	<div class="form-group">
					                                            <label for="exampleInputFile">Adjuntar Documento</label>
					                                            <input type="file" id="exampleInputFile" name="txtDocumento">
					                                        </div>
					                                        <input type="hidden" class="form-control" id="fecha1" name="txtFecha1">
					                                        <input type="hidden" class="form-control" id="fecha2" name="txtFecha2">
                                      						
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
			                                    		<div class="form-group">
                                      						<label>Motivo de Licencia :</label>
                                      						<select class="form-control" name="cboLicencia">
				                                                <option value="-1">[Seleccione]</option>
				                                                <option value="Enfermedad Común">Enfermedad Común</option>
				                                                <option value="Neoplásica">Neoplásica</option>
				                                                <option value="T.B.C">T.B.C</option>
				                                            </select>
                                            			</div>
                                            			<div class="form-group">
                                      						<label>Descripcion :</label>
                                      						<textarea class="form-control" rows="7" placeholder="Descripcion ..." name="txtDescripcionLicencia"></textarea>
                                            			</div>
                                            			
			                                    	</div>
			                                    </div>
			                                </div><!-- /.box-body -->
			                            </div><!-- /.box -->
			                        </div>
                    			</div>
                    		</div>
                    		<div class="box-footer">
                             	<button class="btn btn-primary" type="submit" >Enviar <i class="fa fa-arrow-circle-right"></i></button>  
                           		<button class="btn btn-primary" type="button" >Cancelar <i class="fa fa-arrow-circle-right"></i></button>  
                            	<button class="btn btn-primary" type="button" >Vista Previa<i class="fa fa-arrow-circle-right"></i></button>  
                             </div><!-- Fin Box-Footer -->
                    	</form>                    
                    </div> 
                </section><!-- /.content -->                    
            </aside><!-- /.right-side -->
        </div><!-- ./wrapper -->


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
       
		<script type="text/javascript">
		$(function() {	
			
			$('#reservation').daterangepicker({format: 'DD/MM/YYYY'});				
			$('.applyBtn').click(function(){	
				var f1 =document.getElementsByName("daterangepicker_start")[0].value;
				var f2=document.getElementsByName("daterangepicker_end")[0].value;
				var sFecha1=f1.split("/");
				var sFecha2=f2.split("/");
				var dtFecha1=new Date(sFecha1[2]+"/"+sFecha1[1]+"/"+sFecha1[0]);
				var dtFecha2=new Date(sFecha2[2]+"/"+sFecha2[1]+"/"+sFecha2[0]);
				var dif = dtFecha2 - dtFecha1;
				var dias = Math.floor(dif / (1000 * 60 * 60 * 24)); 
			    $("#fecha1").attr('value',sFecha1[2]+"/"+sFecha1[1]+"/"+sFecha1[0]);	
			    $("#fecha2").attr('value',sFecha2[2]+"/"+sFecha2[1]+"/"+sFecha2[0]);
			    $("#cantidad").attr('value',dias);
			    $("#cantidad1").attr('value',dias);
			});
			
                        
			 $("#datemask2").inputmask("yyyy/mm/dd", {"placeholder": "yyyy/mm/dd"});
             
             $("[data-mask]").inputmask();
			 $('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
                 checkboxClass: 'icheckbox_minimal',
                 radioClass: 'iradio_minimal'
             });
             //Red color scheme for iCheck
             $('input[type="checkbox"].minimal-blue, input[type="radio"].minimal-blue').iCheck({
                 checkboxClass: 'icheckbox_minimal-blue',
                 radioClass: 'iradio_minimal-blue'
             });
             //Flat red color scheme for iCheck
             $('input[type="checkbox"].flat-blue, input[type="radio"].flat-blue').iCheck({
                 checkboxClass: 'icheckbox_flat-blue',
                 radioClass: 'iradio_flat-blue'
             });
		});
		
		</script>
		<%}%>
    </body>
</html>