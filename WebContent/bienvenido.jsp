<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="entidad.Usuario"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Bienvenido</title>
<link href="css/login.css" rel="stylesheet" type="text/css">
</head>

<body>
	<div id="container">
		<div class="welcome">
		<%
			  			Usuario usu = (Usuario) session.getAttribute("USUARIO_LOGEADO");   
			  		%>

			<div class="welcome-user">Bienvenido Sr(a) <%= usu.getNombre()  %></div>
			
			<div class="welcome-text" >Lapsvs Crema 
			<img width="20px" src="http://imageshack.us/download/146/correlon.png"> 
			</div>
			
			<div class="home"><a href="login.jsp">Inicio</a></div>
		</div>
	</div>
</body>

</html>