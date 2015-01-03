package controlador;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidad.Les;
import patronDAO.Factory;
import patronDAO.LesDao;

/**
 * Servlet implementation class ServletGestionaLES
 */
@WebServlet("/gestionaLES")
public class ServletGestionaLES extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	Factory fabrica= Factory.getTipo(Factory.TIPO_MYSQL);
	LesDao dao= null;
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String operacion= request.getParameter("operacion");
		
		if(operacion.equals("listarLes")){
			this.listarLes(request, response);
		}
	}
	
	protected void listarLes(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		dao=fabrica.getLes();
		List<Les> data=null;
		try {
			data=dao.listaLes();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("Les", data);
		request.getRequestDispatcher("/cun4.jsp").forward(request, response);
	}

}
