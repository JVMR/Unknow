<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@page import="entidad.Usuario"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Menu Principal</title>
<!-- BOOTSTRAP STYLES-->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
     <!-- FONTAWESOME STYLES-->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
      <!-- CUSTOM STYLES-->
    <link href="assets/css/custom.css" rel="stylesheet" />
     <!-- GOOGLE FONTS-->
   <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
</head>
<body>
<%
			  			Usuario usu = (Usuario) session.getAttribute("USUARIO_LOGEADO");   
			  		%>
<div id="wrapper">
        <nav class="navbar navbar-default navbar-cls-top "role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle"data-toggle="collapse"data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"> </span>
                    <span class="icon-bar"> </span>
                    <span class="icon-bar"> </span>
                </button>
                <a class="navbar-brand" href="menuPrincipal.html">Inicio</a> 
            </div>
 			 <div style="color: white;padding: 15px 50px 5px 50px;float: right;font-size: 16px;"> Ultimo Acceso : 30 May 2014 &nbsp;
 			 <a href="index.html" class="btn btn-danger square-btn-adjust">Logout</a></div>
						        </nav>   
           <!-- /. NAV TOP  -->
             <nav class="navbar-default navbar-side"role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
				<li class="text-center">
                    <img src="assets/img/find_user.png" class="user-image img-responsive"/>
					</li>
				
					
                    <li>
                        <a  href="index.html"><i class="fa fa-dashboard fa-3x"> </i>Bienvenido Sr(a) <%= usu.getNombre()  %></a>
                    </li>                     
                    <li>
                        <a href="#"><i class="fa fa-sitemap fa-3x"> </i> Mantenimiento<span class="fa arrow"> </span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="MenuAsalariado.html">Mantenimiento Asalariado</a>
                            </li>
                            <li>
                                <a href="MenuTrabajo.html">Mantenimiento Trabajo</a>
                            </li>
                            <li>
                                <a href="#">CUN06</a>                            
                            </li>
                            <li>
                                <a href="#">CUN10</a>
                            </li>                            
                        </ul>
                      </li> 
                    <li>
                        <a href="#"><i class="fa fa-sitemap fa-3x"> </i> Licencia por Enfermedad Subsidiada<span class="fa arrow"> </span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="menuCUN1.html">CUN01</a>
                            </li>
                            <li>
                                <a href="menuCUN5.html">CUN05</a>
                            </li>
                            <li>
                                <a href="menuCUN6.html">CUN06</a>                            
                            </li>
                            <li>
                                <a href="menuCUN10.html">CUN10</a>
                            </li>
                            <li>
                                <a href="menuCUN11.html">CUN11</a>                            
                            </li>
                            <li>
                                <a href="menuCUN7.html">CUN07</a>
                            </li>
                            <li>
                                <a href="menuCUNEDM.html">Evaluar Descanso Medico</a>                            
                            </li>
                        </ul>
                      </li> 
						   <li  >
                        <a  href="chart.html"><i class="fa fa-bar-chart-o fa-3x"> </i> Reportes</a>
                    </li>	
                    
                </ul>
               
            </div>
            
        </nav>  
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper" >
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                     <h2>Blank Page</h2>   
                        <h5>Welcome Jhon Deo , Love to see you back. </h5>
                       
                    </div>
                </div>
                 <!-- /. ROW  -->
                 <hr />
               
    	</div>
             <!-- /. PAGE INNER  -->
            </div>
         <!-- /. PAGE WRAPPER  -->
        </div>
     <!-- /. WRAPPER  -->
    <!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
    <!-- JQUERY SCRIPTS -->
    <script src="assets/js/jquery-1.10.2.js"></script>
      <!-- BOOTSTRAP SCRIPTS -->
    <script src="assets/js/bootstrap.min.js"></script>
    <!-- METISMENU SCRIPTS -->
    <script src="assets/js/jquery.metisMenu.js"></script>
      <!-- CUSTOM SCRIPTS -->
    <script src="assets/js/custom.js"></script>
    
</body>
</html>