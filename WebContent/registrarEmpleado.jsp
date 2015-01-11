<%@page import="entidad.Menu"%>
<%@ taglib uri="misLibrerias" prefix="cbo" %>
<%@page import="entidad.Empleado"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>INR | Empleado</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- bootstrap 3.0.2 -->
         <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- font Awesome -->
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <!-- Ionicons -->
        <link href="css/ionicons.min.css" rel="stylesheet" type="text/css" />
        <!-- Theme style -->
        <link href="css/AdminLTE.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="js/plugins/bootstrap-fileupload/bootstrap-fileupload.min.css">
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
                                <span><%=empleado.getNombresEmpleado() %>&nbsp;<%=empleado.getApellidoPaterno() %><i class="caret"></i></span>
                            </a>
                            <ul class="dropdown-menu">
                                <!-- User image -->
                                <li class="user-header bg-light-blue">
                                    <img src="GestionarEmpleado?operacion=fotoEmpleado&id=<%=empleado.getIdEmpleado() %>" class="img-circle" alt="User Image" />
                                    <p><%=empleado.getNombresEmpleado() %>&nbsp;<%=empleado.getApellidoPaterno() %><br/>
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
                              
                        <li class="treeview active" style="<%=mnu.getMant()%>">
                            <a href="empleado.jsp">
                                <i class="fa fa-bar-chart-o"></i>
                                <span>Empleado</span>
                                <i class="fa fa-angle-left pull-right"></i>
                            </a>
                            <ul class="treeview-menu">
                                <li class="active"><a href="registrarEmpleado.jsp"><i class="fa fa-angle-double-right"></i> Registrar Empleado</a></li>
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
                        Mantenimiento Empleado
                        <small>Permite registra, modificar y eliminar datos de Empleado.</small>
                    </h1>
                    <!-- Modificar al crear nuevos -->
                    <ol class="breadcrumb">
                        <li><a href="bienvenido.jsp"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li><a href="empleado.jsp">Empleado</a></li>
                        <li class="active">Registrar Empleado</li>
                    </ol>
                </section>

                <!-- Main content -->
                <!-- ---------------------------------------------------------------------------------------------------------------- -->
                <section class="content">               	               
					
                            <div class="box box-primary">
                                <div class="box-header">
                                  <h3 class="box-title" align="center">Datos del Empleado</h3> 
                                </div><!-- /.box-header -->
                                <!-- Inicio de Formulario -->
                               <form action="GestionarEmpleado" method="post" enctype="multipart/form-data" id="ingresaEmpleado" role="ingresaEmpleado" >
                               		<div class="box-body">
                               		<input type="hidden" name="operacion" value="registraEmpleado">
                                     <!-- Empleado -->     
                                       <div class="row">       
                                       		<div class="col-md-12">
												<div class="errorHandler alert alert-danger no-display" style="display: none;">
													<i class="fa fa-times-circle-o"></i> Ud. tiene algunos errores en el formulario. Por favor revisar los campos.
												</div>
												<div class="successHandler alert alert-success no-display" style="display: none;">
													<i class="fa fa-check"></i> La validacion de campos es correcta!
												</div>
											</div>                                                             
                                      	<div class="col-md-6">
                                      		<div class="form-group">
                                      			<label>DNI :</label>
                                      			<input type="text" class="form-control" placeholder="Ingrese tu numero de DNI" name="txtDNI" id="txtDNI">
                                            </div>
                                      	    <div class="form-group">
                                      			<label>Nombre :</label>
                                      			<input type="text" class="form-control" placeholder="Ingrese nombre completo" id="Nombre" name="txtNombre" id="txtNombre">
                                            </div>
                                            <div class="form-group">
                                      			<label>Apellido Paterno :</label>
                                      			<input type="text" class="form-control" placeholder="Ingrese apellido Paterno" id="ApellidoP" name="txtApellidoP" id="txtApellidoP">
                                            </div>
                                            <div class="form-group">
                                      			<label>Apellido Materno :</label>
                                      			<input type="text" class="form-control" placeholder="Ingrese apellido Materno" name="txtApellidoM" id="txtApellidoM">
                                            </div>
                                            <div class="form-group">
                                      			<label>Fecha Nacimiento :</label>
                                      			  <div class="input-group">
                                            		<div class="input-group-addon">
                                                		<i class="fa fa-calendar"></i>
                                            		</div>                                            		
                                            		<input type="text" class="form-control"  name="txtFechaN" id="txtFechaN" data-inputmask="'alias': 'yyyy/mm/dd'" data-mask/>
                                            		
                                       			  </div><!-- /.input group -->
                                            </div>
                                            <div class="form-group">
                                      			<label>Celular :</label>
                                      			<div class="input-group">
                                           			 <div class="input-group-addon">
                                               			<i class="fa fa-phone"></i>
                                           			 </div>
                                           			 <input type="text" class="form-control" name="txtFono" id="txtFono" data-inputmask='"mask": "999-999-999"' data-mask/>
                                        		</div><!-- /.input group -->
                                            </div>
                                            <div class="form-group">
                                      			<label>Seguro Social :</label>
                                      			<div class="input-group">
                                           			 <div class="input-group-addon">
                                               			<i class="fa fa-info"></i>
                                           			 </div>
                                           			 <input type="text" class="form-control" name="txtSeguroSocial" id="txtSeguroSocial" data-inputmask='"mask": "99999999999"' data-mask/>
                                        		</div><!-- /.input group -->                                      			
                                            </div>
                                            <div class="form-group">
                                      			<label>Cargo :</label>
                                      			<cbo:cboDinamico sql="SQL_CARGO" nombre="cboCargo" id="cboCargo"/>
                                            </div>
                                            <div class="form-group">
                                      			<label>Estado :</label>
                                      			<cbo:cboDinamico sql="SQL_ESTADO" nombre="cboEstado" id="cboEstado"/>
                                            </div>
                                            <div class="form-group">
                                      			<label>Fecha Ingreso :</label>
                                      			<div class="input-group">
                                            		<div class="input-group-addon">
                                                		<i class="fa fa-calendar"></i>
                                            		</div>                                             		
                                            		<input type="text" class="form-control" value="" name="txtFechaI" id="txtFechaI" data-inputmask="'alias': 'yyyy/mm/dd'" data-mask/>
                                            		
                                       			  </div><!-- /.input group -->
                                            </div>                                            
                                          </div> 
                                          <div class="col-md-5">
	                                      		<label>Foto del Empleado :</label>
                                      			<div class="fileupload fileupload-new" data-provides="fileupload">
																	<div class="fileupload-new thumbnail" style="width: 200px; height: 150px;"><img src="http://www.placehold.it/200x150/EFEFEF/AAAAAA?text=no+image" alt="">
																	</div>
																	<div class="fileupload-preview fileupload-exists thumbnail" style="max-width: 200px; max-height: 150px; line-height: 20px;"></div>
																	<div>
																		<span class="btn btn-info btn-file ">
																			 <span class="fileupload-new">
																			 <i class="fa fa-fw fa-camera"></i>
																				 Seleccione
																			</span> 
																			<span class="fileupload-exists"><i class="fa fa-fw fa-camera"></i> Cambiar</span>
																			<input type="file" name="txtFoto">
																		</span>
																		<a href="#" class="btn fileupload-exists btn-info" data-dismiss="fileupload">
																			<i class="fa fa-fw fa-times"></i> Remover
																		</a>
																	</div>
																</div>
												<div class="form-group">
													<label>Usuario :</label>
													<div class="input-group">													
		                                      			<span class="input-group-addon"><i class="fa fa-fw fa-user"></i></span>
	                                       				 <input class="form-control"  type="text" id="Usuario1" disabled> 
	                                       				 <input type="hidden" id="Usuario"  name="txtUsuario" >
                                   					</div>
                                   				</div>
                                   				<div class="form-group">	
	                                      			<label>Password :</label>
	                                      			<div class="input-group">													
	                                      				 <span class="input-group-addon"><i class="fa fa-fw fa-key"></i></span>
	                                       				 <input class="form-control" placeholder="Password" type="password" name="txtPssword1" id="txtPssword1">
	                                   				</div>
	                                   			</div>
	                                   			<div class="form-group">
	                                   				<label>Confirmar Password :</label>
	                                      			<div class="input-group">													
	                                      				 <span class="input-group-addon"><i class="fa fa-fw fa-key"></i></span>
	                                       				 <input class="form-control" placeholder="Confirmar Password" type="password" name="txtPssword" id="txtPssword">
	                                   				</div>
	                                   			</div>
                                            </div>
                                      	
                                      		</div>  
                                      
	                                      	
                                      </div><!-- Fin Box-Body -->                                                                        	
                                      <div class="box-footer">
                                        <button class="btn btn-primary" type="submit">Registrar Empleado <i class="fa fa-arrow-circle-right"></i></button>  
                                      </div><!-- Fin Box-Footer -->                                       
                               </form> <!-- Fin  de Formulario -->
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
        <script src="js/plugins/input-mask/jquery.inputmask.js" type="text/javascript"></script>
        <script src="js/plugins/input-mask/jquery.inputmask.date.extensions.js" type="text/javascript"></script>
        <script src="js/plugins/input-mask/jquery.inputmask.extensions.js" type="text/javascript"></script>
       	<script src="js/jquery_validacion/jquery.validate.min.js"></script>
		<script src="js/jquery_validacion/form-validation.js"></script>
      	<script type="text/javascript">
            $(function() {        
            	var cadena;
            	var txt;
            	var txt2;
            	 	$('#Nombre').blur(function(){	          
            		cadena =document.getElementById("Nombre").value;
            	         txt=cadena.substr(0,1).toLowerCase();
            	         txt2=document.getElementById("ApellidoP").value.toLowerCase();
            	                 
            		 $("#Usuario").attr('value',txt.concat(txt2));
            		 $("#Usuario1").attr('value',txt.concat(txt2));
            	      });
            	    $('#ApellidoP').blur(function(){
            	        var msn;	
            		cadena=document.getElementById("ApellidoP").value.toLowerCase();
            	         msn=txt.concat(cadena)    
            	      
            		 $("#Usuario").attr('value',msn);
            	     $("#Usuario1").attr('value',msn);
            		});	
            	   
            	 
                //Datemask2 yyyy/mm/dd
                $("#datemask2").inputmask("yyyy/mm/dd", {"placeholder": "yyyy/mm/dd"});
               
                $("[data-mask]").inputmask();
                FormValidator.init();
                
            });
        </script>
	<script src="js/plugins/bootstrap-fileupload/bootstrap-fileupload.min.js"></script> 
	<%}%>
    </body>
</html>