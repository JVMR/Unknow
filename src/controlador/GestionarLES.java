package controlador;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import patronDAO.CargoDao;
import patronDAO.Factory;
import entidad.Cargo;

/**
 * Servlet implementation class GestionarCargo
 */

@WebServlet("/GestionarLES")
@MultipartConfig(maxFileSize = 16177215)

public class GestionarLES extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	Factory fabrica= Factory.getTipo(Factory.TIPO_MYSQL);
	CargoDao dao= null;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String operacion= request.getParameter("operacion");
		
		if(operacion.equals("generarLES")){
			this.generarLES(request, response);
		}
		if(operacion.equals("modificarLES")){
			this.modificarLES(request, response);
		}
		if(operacion.equals("listarCargoxNombre")){
			this.listarCargoxNombre(request, response);
		}
		
	}
	protected void generarLES(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
						
	}
	protected void listarCargoxNombre(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nombre=request.getParameter("nom");
		dao=fabrica.getCargo();
		Cargo obj=null;
		
		obj=dao.listaCargoxNombre(nombre);
		
		request.setAttribute("daoCargo", obj);
		request.getRequestDispatcher("/generarLES.jsp").forward(request, response);
	}
	protected void modificarLES(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	
		
	}

}
