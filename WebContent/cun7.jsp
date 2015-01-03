<%@page import="entidad.Empleado"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

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
        
        <link href="css/nuestros/unidadorgï¿½nica.css" rel="stylesheet" type="text/css">
        
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
                                <span><%=empleado.getNombresEmpleado() %>&nbsp;<%=empleado.getApellidoPaterno() %>&nbsp;<%=empleado.getApellidoMaterno() %><i class="caret"></i></span>
                            </a>
                            <ul class="dropdown-menu">
                                <!-- User image -->
                                <li class="user-header bg-light-blue">
                                    <img src="img/avatar3.png" class="img-circle" alt="User Image" />
                                    <p><%=empleado.getNombresEmpleado() %>&nbsp;<%=empleado.getApellidoPaterno() %>&nbsp;<%=empleado.getApellidoMaterno() %><br/>
                                        <%=empleado.getIdCargo() %>
                                        <small>Asalariado desde <%=empleado.getFechaIngreso() %></small>
                                    </p>
                                </li>                                
                                <li class="user-footer">
                                    <div class="pull-left">
                                        <a href="paginas/perfil.jsp" class="btn btn-default btn-flat">Profile</a>
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
           <aside class="left-side sidebar-offcanvas">                
                <!-- sidebar: style can be found in sidebar.less -->
                <section class="sidebar">
                    <!-- Sidebar user panel -->
                    <div class="user-panel">
                        <div class="pull-left image">
                            <img src="img/avatar3.png" class="img-circle" alt="User Image" />
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
                            <a href="../widgets.html">
                                <i class="fa fa-th"></i> <span>Perfil</span>
                            </a>
                        </li>
                        <li class="treeview">
                        	<a href="#">
                        		<i class="fa fa-bar-chart-o"></i>
                        		<span>Unidad Orgï¿½nica</span>
                        		<i class="fa fa-angle-left pull-right"></i>
                        	</a>
                        	<ul class="treeview-menu">
                                <li><a href="crudUnidadOrganica.jsp"><i class="fa fa-angle-double-right"></i>Registrar Unidad Organica</a></li>
                                <li><a href="listadoUnidadOrganica.jsp"><i class="fa fa-angle-double-right"></i>Listar Unidad Organica</a></li>
                            </ul>
                        </li>
                        <li class="treeview">
                            <a href="#">
                                <i class="fa fa-bar-chart-o"></i>
                                <span>Empleado</span>
                                <i class="fa fa-angle-left pull-right"></i>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="registrarEmpleado.jsp"><i class="fa fa-angle-double-right"></i> Registrar Empleado</a></li>
                                <li><a href="GestionarEmpleado?operacion=listarEmpleado"><i class="fa fa-angle-double-right"></i> Listar Empleado</a></li>
                           </ul>
                        </li>                 
                        <li class="treeview active">
                        	<a href="#">
                        		<i class="fa fa-bar-chart-o"></i>
                        		<span>RES</span>
                        		<i class="fa fa-angle-left pull-right"></i>
                        	</a>
                        	<ul class="treeview-menu">
                                <li class="active"><a href="cun7.jsp"><i class="fa fa-angle-double-right"></i>Generar Resolucion administrativa de LES</a></li>
                           </ul>
                        </li>


                        
                    </ul>
                </section>
                <!-- /.sidebar -->
            </aside>
            
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
                               <form role="form">
                                        <!-- text input -->
                                      <!-- <div class="form-group"> -->  
                                     
       										
       	<form action="gestionarRES" style="border :1px;border-style: solid;padding-left:50px;">
       	<input type="hidden" value="registraRES" name="operacion" >
          		<div class="form-group">
                 	<td><label>A  :</label></td>   
                 	<input type="text" class="form-control" placeholder="Escriba ..." name="txtA">
                </div>
               <div class="form-group">
               		<td><label>De  :</label></td>               	
               		<td><input type="text" class="form-control" placeholder="Escriba ..." name="txt"  value="<%=empleado.getNombresEmpleado() %>&nbsp;<%=empleado.getApellidoPaterno() %>&nbsp;<%=empleado.getApellidoMaterno() %>"></td>
                </div>
               <div class="form-group">
               		<td><label>Referencia :</label></td>               	
               		<td><input type="text" class="form-control" placeholder="Escriba ..." name="txtReferencia"></td>
                </div>
               <div class="form-group">
               		<td><label>Descriptor :</label></td>               	
               		<td><input type="text" class="form-control" placeholder="Escriba ..." name="txtDescriptor"></td>
                </div>
               <div class="form-group">
               		<td><label>Fecha      : </label></td>               	
               		<div class="input-group">
                                            		<div class="input-group-addon">
                                                		<i class="fa fa-calendar"></i>
                                            		</div>                                            		
                                            		<input type="text" class="form-control"  name="txtFechaG" value="" data-inputmask="'alias': 'yyyy/mm/dd'" data-mask/>
                                            		
                                       			  </div><!-- /.input group -->
                </div>
               <div class="form-group">
               		<td><label>I. Objeto de consulta :</label></td>    	
                </div>
               <div class="form-group">
               		<td><input type="text" class="form-control"   name="txtObj" style="width: 200px;height: 80px;" /></td>    	
                </div>
               <div class="form-group">
               		<td><label>II. Análisis :</label></td>    	
                </div>
               <div class="form-group">
               		<td><input type="text" class="form-control"  name="txtAnalisis" style="width: 200px;height: 80px;" /></td>    	
                </div>       	
         	<label>Se resuelve que la licencia <input type="text" name="txtIdLes" /> por enfermedad subsidiada del asalariado <input type="text" name="txtAsalariado" /><br />
         	es previamente aprobado <input type="text" name="txtEstado" /> por el análisis mencionado.</label><br /><br />
         	<button class="btn btn-primary" type="submit" >Enviar<i class="fa fa-arrow-circle-right"></i></button>
           <button class="btn btn-primary btn-sm">Vista Previa</button> &nbsp;
         </form>
						
						<script type="text/javascript"  id="fechaHoy">
var d = new Date();
var m = d.getMonth()+1
document.write(d.getFullYear()+"-"+m+"-"+d.getDate());
</script>
						
										    
										    <!-- /.box-body -->
									    
                                        </div>

                                    </form>
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
         
	</body>
</html>
</html>