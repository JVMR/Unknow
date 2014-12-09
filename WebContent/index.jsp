<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<link href="css/login.css" rel="stylesheet" type="text/css">
</head>

<body>

	<div id="container">
		<form method="post" action="login">
			<div class="login">LOGIN</div>
			<div class="username-text">Username:</div>
			<div class="password-text">Password:</div>
			<div class="username-field">
				<input type="text" name="txtLogin" />
			</div>
			<div class="password-field">
				<input type="password" name="txtPassword" />
			</div>
			
			<div class="welcome-text">
			<%
						String mensaje = (String) request.getAttribute("MENSAJE");
						if(mensaje!= null){
			%>	
			<font ><%= mensaje %></font>
			<%} %>
			</div>
	
			<div >
				<input type="submit" name="btnLogin" value="Ingresar" />
			</div>
			
		</form>
	</div>
	
</body>
</html>