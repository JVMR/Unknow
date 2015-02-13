package controlador;

import java.io.IOException;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import patronDAO.Factory;
import patronDAO.ResDao;
import entidad.Asalariado_RES;
import entidad.Res;

/**
 * Servlet implementation class ServletGestionarRES
 */
@WebServlet("/GestionarRES")
public class GestionarRES extends HttpServlet {
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
		//Romario
		if(operacion.equals("listaVisarRES")){
			this.listaVisarRES(request,response);
		}
		if(operacion.equals("visarRES")){
			this.visarRES(request,response);
		}
		if(operacion.equals("actualizarEstado")){
			this.actualizarEstado(request,response);
		}
	}

	private void actualizarEstado(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		String idRES = request.getParameter("txtIdRES");
		String idEstado = request.getParameter("rdEstado");
		String idAsalariadoAprobador=request.getParameter("txtIdEmpleado");
		
		dao = fabrica.getRes();
		
		Res res = new Res();
		res.setIdRes(idRES);
		res.setIdEstado(idEstado);
		
		//fecha  de la operación
		DateFormat fechaOperacion = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		Asalariado_RES asalariado_RES = new Asalariado_RES();
		asalariado_RES.setFechaAprob(fechaOperacion.format(new Date()));
		asalariado_RES.setIdAsalariado(idAsalariadoAprobador);
		asalariado_RES.setIdRES(Integer.parseInt(idRES));
		
		
		try {
			dao.actualizaEstado(res,asalariado_RES);
			System.out.println("Código de RES actualizado: "+res.getIdRes()+"y codigo de estado"+res.getIdEstado());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		listaVisarRES(request, response);
		//request.getRequestDispatcher("/visarRES.jsp").forward(request, response);
	}

	private void visarRES(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		
		String cod=request.getParameter("id");
		Res res= null;
		
		try {
			dao = fabrica.getRes();
			res = dao.ResxCodigo(cod);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		request.setAttribute("ResaEvaluar", res);
		request.getRequestDispatcher("/visarRES.jsp").forward(request, response);
	}

	private void listaVisarRES(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		
		dao= fabrica.getRes();
		ArrayList<Res> data=null;
		try {
			data=dao.listarVisaRES();
			System.out.println("en servlet: "+ data);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		request.setAttribute("listaVisarRES", data);
		request.getRequestDispatcher("/visarRES.jsp").forward(request, response);
		
	}

	protected void registraRES(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String referencia=request.getParameter("txtReferencia");
		String descriptor=request.getParameter("txtDescriptor");
		String objetoConsulta=request.getParameter("txtObj");
		String analisis=request.getParameter("txtAnalisis");
		String fechaGenerado=request.getParameter("txtFechaG");
		String idLes=request.getParameter("txtIdLes");
		String idEstado=request.getParameter("txtIdEstado");
		String idAsalariado=request.getParameter("txtInAsalariado");
		
			dao=fabrica.getRes();
			Res r = new Res();
			
			r.setReferencia(referencia);
			r.setDescriptor(descriptor);
			r.setObjetoConsulta(objetoConsulta);
			r.setAnalisis(analisis);
			r.setFechaGenerado(fechaGenerado);
			r.setIdLes(idLes);
			r.setIdEstado(idEstado);
			r.setIdAsalariado(idAsalariado);
			dao.registraRes(r);		
		
}
	
}
