package controlador;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ServletLogout
 */
@WebServlet("/logout")
public class ServletLogout extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//1 se obtiene la session
		HttpSession session = request.getSession();
		
		//2 se destruye la session
		session.invalidate();
		
		//3 se vuelbve al login
		request.setAttribute("MENSAJE", "usuario salió de la intranet");
		request.getRequestDispatcher("/index.jsp").forward(request, response);

		
	}

}
