package controlador;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import patronDAO.Factory;
import patronDAO.EmpleadoDao;
import entidad.Empleado;

/**
 * Servlet implementation class ServletLogin
 */
@WebServlet("/login")
public class ServletLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String  usu = request.getParameter("txtUsuario");
		String  pas = request.getParameter("txtPassword");
		
		String mensaje="";
		
		Factory fabrica = Factory.getTipo(Factory.TIPO_MYSQL);
		EmpleadoDao usuarioDao = fabrica.getEmpleado();
		Empleado usuario = null;
		
		try {
			usuario = usuarioDao.validaEmpleado(usu, pas);
			
		} catch (SQLException e) {
			System.out.println(e);
			e.printStackTrace();
		}
			
		if(usuario == null){
			mensaje="Datos incorrectos o no existen";
			request.setAttribute("MENSAJE", mensaje);
			request.getRequestDispatcher("/index.jsp").forward(request, response);
		}else{
			
			//Se obtiene la session
			HttpSession session = request.getSession();
			
			//se guarda en sesion el objeto que contiene los datos del usuario
			session.setAttribute("USUARIO_LOGEADO", usuario);
			
			
			//se ingresa a la intranet
			request.getRequestDispatcher("/bienvenido.jsp").forward(request, response);  
		}
		
	}

}
