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
import patronDAO.UsuarioDao;
import entidad.Usuario;

/**
 * Servlet implementation class ServletLogin
 */
@WebServlet("/login")
public class ServletLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String  usu = request.getParameter("txtLogin");
		String  pas = request.getParameter("txtPassword");
		
		Factory fabrica = Factory.getTipo(Factory.TIPO_MYSQL);
		UsuarioDao dao = fabrica.getUsuario();
		
		Usuario usuario = null;
		
		try {
			usuario = dao.valida(usu, pas);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
		if(usuario == null){
			request.setAttribute("MENSAJE", "Contraseña incorrecta/Usuario no existe");
			request.getRequestDispatcher("/portallogin.jsp").forward(request, response);
		}else{
			
			//Se obtiene la session
			HttpSession session = request.getSession();
			
			//se guarda en sesion el objeto que contiene los datos del usuario
			session.setAttribute("USUARIO_LOGEADO", usuario);
			
			//se ingresa a la intranet
			request.getRequestDispatcher("/menuPrincipal.jsp").forward(request, response);  
		}
		
	}

}
