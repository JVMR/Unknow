package controlador;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import patronDAO.Factory;
import patronDAO.ResDao;
import entidad.Res;

/**
 * Servlet implementation class ServletGestionarRES
 */
@WebServlet("/gestionarRES")
public class ServletGestionarRES extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	
	Factory fabrica= Factory.getTipo(Factory.TIPO_MYSQL);
	ResDao dao= null;
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String operacion= request.getParameter("operacion");
		
		if(operacion.equals("registraRES")){
			this.registraRES(request, response);
		}
		if(operacion.equals("cargarRes")){
			this.cargarRes(request, response);
		}
		if(operacion.equals("consultarResxRango")){
			this.consultaResxFechas(request, response);
		}
		if(operacion.equals("actualizarRes")){
			this.actualizarRes(request, response);
		}
	}

	protected void registraRES(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String referencia=request.getParameter("txtReferencia");
		String descriptor=request.getParameter("txtDescriptor");
		String objetoConsulta=request.getParameter("txtObjetoConsulta");
		String analisis=request.getParameter("txtAnalisis");
		String fechaGenerado=request.getParameter("txtFechaG");
		String idLes=request.getParameter("txtIdLes");
		String idAsalariado = request.getParameter("txtidAsalariado");
		
		System.out.println(referencia);
		System.out.println(descriptor);
		System.out.println(objetoConsulta);
		System.out.println(analisis);
		System.out.println(fechaGenerado);
		System.out.println(idLes);
		
			dao=fabrica.getRes();
			Res r = new Res();
			
			r.setReferencia(referencia);
			r.setDescriptor(descriptor);
			r.setObjetoConsulta(objetoConsulta);
			r.setAnalisis(analisis);
			r.setFechaGenerado(fechaGenerado);
			r.setIdLes(idLes);
			r.setIdAsalariado(idAsalariado);
			dao.registraRes(r);	
			// Cambiar a otro lado
			consultaResxFechas(request, response);
		
		}
	
	protected void cargarRes(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cod= request.getParameter("id");
		Res obj=null;
		try {
			dao=fabrica.getRes();
			obj= dao.ResxCodigo(cod);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("referencia : "+obj.getReferencia());
		request.setAttribute("daoRes", obj);
		request.getRequestDispatcher("/actualizarRes.jsp").forward(request, response);
		
	}
	
	protected void consultaResxFechas(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fecha1= request.getParameter("txtFecha1");
		String fecha2= request.getParameter("txtFecha2");
		String idEstado= request.getParameter("cboEstadoRes");
		dao=fabrica.getRes();
		List<Res> data=null;
		try {
			data = dao.ResxRangoFecha(fecha1, fecha2, idEstado);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("Res", data);
		request.getRequestDispatcher("/consutaRes.jsp").forward(request, response);
	}
protected void actualizarRes(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String idRes =request.getParameter("txtIdRes");
		String objetoConsulta =request.getParameter("txtObjetoConsulta");
		String analisis =request.getParameter("txtAnalisis");
		
		
			dao=fabrica.getRes();
			Res r = new Res();
			
			r.setIdRes(idRes);
			r.setObjetoConsulta(objetoConsulta);
			r.setAnalisis(analisis);
			
			try {
				dao.modificaRes(r);
				System.out.println("Codigo" + r.getIdRes());
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}		
		
			consultaResxFechas(request, response);
	}
	
}
