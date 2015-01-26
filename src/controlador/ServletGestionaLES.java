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

		if(operacion.equals("cargarLes")){
			this.cargarLes(request, response);
		}
		if(operacion.equals("cargarLes2")){
			this.cargarLes2(request, response);
		}
		if(operacion.equals("actualizarEstado")){
			this.actualizarEstadoLes(request, response);
		}
		if (operacion.equals("EvaluarLes")) {
			this.EvaluarLes(request, response);
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
		request.getRequestDispatcher("/listarLES.jsp").forward(request, response);
	}

	protected void cargarLes(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cod= request.getParameter("id");
		Les obj=null;
		try {
			dao=fabrica.getLes();
			obj= dao.LesxCodigo(cod);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("Diagnostico : "+obj.getDiagnostico());
		request.setAttribute("daoLes", obj);
		request.getRequestDispatcher("/generarRES.jsp").forward(request, response);
	}
	private void EvaluarLes(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String cod = request.getParameter("id");
		Les obj = null;
		try {
			dao = fabrica.getLes();
			obj = dao.LesxCodigo(cod);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (obj != null) {
			request.setAttribute("daoLes", obj);
			request.getRequestDispatcher("/evaluarunaSolicitudLES.jsp").forward(request, response);
		}

	}
	protected void cargarLes2(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cod= request.getParameter("id");
		Les obj=null;
		try {
			dao=fabrica.getLes();
			obj= dao.LesxCodigo(cod);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("Diagnostico : "+obj.getDiagnostico());
		request.setAttribute("daoLes", obj);
		request.getRequestDispatcher("/consultarDM.jsp").forward(request, response);
	}
	protected void actualizarEstadoLes(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String idLes =request.getParameter("txtIdLes");
		String idEstado =request.getParameter("rdEstado");
		
			dao=fabrica.getLes();
			Les l = new Les();
			
			l.setIdLes(idLes);
			l.setIdEstado(idEstado);
			
			try {
				dao.ActualizaEstado(l);
				System.out.println("Codigo" + l.getIdLes());
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}		
		
			listarLes(request, response);
	}

}
