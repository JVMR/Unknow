package controlador;

import java.awt.dnd.DnDConstants;
import java.io.IOException;
import java.io.PrintWriter;
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
import entidad.Empleado;
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
	Factory factorySQL=Factory.getTipo(Factory.TIPO_SQL_SERVER);
	Factory fabrica= Factory.getTipo(Factory.TIPO_MYSQL);
	ResDao dao= null, dao02=null;
	
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
		if(operacion.equals("actualizarEstadoVisado")){
			this.actualizarEstadoVisado(request,response);
		}
		if (operacion.equals("validarFirma")) {
			this.validarFirma(request,response);
		}
		
	}

	private void validarFirma(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		String idUsuario=request.getParameter("txtIdUsuario");
		String dni=request.getParameter("txtDNI");
		String contraseña = request.getParameter("txtContrasena");
		
		System.out.println("==========servlet============");
		
		System.out.println(idUsuario);
		System.out.println(dni);
		System.out.println(contraseña);
		
		String respuesta01="";
		PrintWriter out=response.getWriter();
		
		dao=fabrica.getRes();
		try {
			respuesta01=dao.verificaPersonaMYSQL(idUsuario, dni);
			
			if(respuesta01.equalsIgnoreCase("SI")){
				dao02=factorySQL.getRes();
				respuesta01=dao02.verificarFirma(dni, contraseña);
				if(respuesta01.equalsIgnoreCase("NO")){
					respuesta01="Los datos ingresados son incorrectos, en SQL SERVER";
				}
							
			}else{
				respuesta01="Los datos ingresados son incorrectos";
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		out.write(respuesta01.toString());

	}

	private void actualizarEstadoVisado(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {

		
		String idRES = request.getParameter("txtIdRES");
		String idEstado = request.getParameter("rdEstado");
		String idAsalariadoAprobador=request.getParameter("txtIdEmpleado");
		String pdf=request.getParameter("rutaPDF");
		String respuesta="";
	
		//fecha  de la operación
		DateFormat fecha = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String fechaOperacion=fecha.format(new Date());
		
		dao = fabrica.getRes();
		int salida=0;
		
		System.out.println(idRES);
		System.out.println(idEstado);
		System.out.println(idAsalariadoAprobador);
		System.out.println(pdf);
		System.out.println();
		/*
		try {
			salida=dao.actualizaEstado(idRES, idAsalariadoAprobador, Integer.parseInt(idEstado), pdf, fechaOperacion);
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("esta es la salida: "+salida);
		*/
		PrintWriter out=response.getWriter();
		respuesta="esta es la salida";
		out.write(respuesta);
		
		
		//listaVisarRES(request, response);
		//request.getRequestDispatcher("/visarRES.jsp").forward(request, response);
	}

	private void visarRES(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException   {
		
		String cod=request.getParameter("id");
		String tipo=request.getParameter("tipo");
		PrintWriter out01= response.getWriter();
		StringBuilder respuesta= new StringBuilder("");
		
		Empleado empleado=null;
		String nombreEmpleado="";
		String apePaterno="";
		String apeMaterno="";

		String firma01="";
		
		Res res=null;
		try {
			dao = fabrica.getRes();
			res = dao.ResxCodigo(cod);
			
			//para obtener firma y datos de res ; tipos 2 y 3
			empleado=dao.buscaDNI(res.getIdRes());
			dao02=factorySQL.getRes();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(tipo.equals("1")){  
			request.setAttribute("ResaEvaluar", res);
			listaVisarRES(request, response);
		}else if(tipo.equals("2"))   {

			respuesta.append(res.getFechaGenerado()+"{");
			respuesta.append(res.getReferencia()+"{");
			respuesta.append(res.getDescriptor()+"{");
			respuesta.append(res.getObjetoConsulta()+"{");
			respuesta.append(res.getAnalisis()+"{");
			respuesta.append(res.getIdLes()+"{");
			respuesta.append(res.getIdAsalariado()+"{");
			
			respuesta.append(empleado.getNombresEmpleado()+" "+empleado.getApellidoPaterno()+" "+empleado.getApellidoMaterno()+"{");
			respuesta.append(empleado.getnDNI()+"{");

			out01.write(respuesta.toString());
		}else if(tipo.equals("3")){
			try {

				firma01=dao02.obtengoFirma02(empleado.getnDNI());
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			out01.write(firma01);
		}
		
		
		
	}

	private void listaVisarRES(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		
		dao= fabrica.getRes();
		ArrayList<Res> data=null;

		try {
			data=dao.listarVisaRES();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("en servlet: "+ data);
		
		
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
