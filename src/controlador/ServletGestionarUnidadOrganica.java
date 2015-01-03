package controlador;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidad.Cargo;
import entidad.Empleado;
import entidad.ListadoUnidad;
import entidad.Rol;
import entidad.UnidadOrganica;
import patronDAO.Factory;
import patronDAO.UnidadOrganicaDao;

/**
 * Servlet implementation class ServletGestionarUnidadOrganica
 */
@WebServlet("/gestionarUnidadOrganica")
public class ServletGestionarUnidadOrganica extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */

	Factory factory=Factory.getTipo(Factory.TIPO_MYSQL);
	UnidadOrganicaDao unidadOrganicaDao=null;
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String operacion= request.getParameter("operacion");
				
				if(operacion.equals("registrarUnidad")){
					this.registraUnidad(request, response);
				}
				if(operacion.equals("modificarUnidad")){
					this.modificaUnidad(request, response);
				}
				if(operacion.equals("eliminarUnidad")){
					this.eliminaUnidad(request, response);
				}
				if(operacion.equals("listarUnidad")){
					this.listarUnidad(request, response);
				}
				if(operacion.equals("cargarUnidad")){
					this.cargarUnidad(request,response);
				}
	}
	

	protected void registraUnidad(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int salida=-1;
		
		int gestionarLES=0;
		int gestionarRES=0;
		int verificarLES=0;
		int verificarRES=0;
		int mantenimiento=0;
		int reporte=0;

		String nombreUnidad=request.getParameter("txtNombreUnidad");
		String decripcionUnidad=request.getParameter("txtDescripcionUnidad");
		String nombreCargo=request.getParameter("txtNombreCargo");
		String sueldo=request.getParameter("txtSueldo");
		
		String chkGestionarLES=request.getParameter("chkGestionarLES");
		String chkGestionarRES=request.getParameter("chkGestionarRES");
		String chkVerificarLES=request.getParameter("chkVerificarLES");
		String chkVerificarRES=request.getParameter("chkVerificarRES");
		String chkMantenimiento=request.getParameter("chkMantenimiento");
		String chkReportes=request.getParameter("chkReportes");
		
		System.out.println(chkGestionarLES);
		System.out.println(chkGestionarRES);
		System.out.println(chkVerificarLES);
		System.out.println(chkVerificarRES);
		System.out.println(chkMantenimiento);
		System.out.println(chkReportes);
		
		System.out.println();
		
		if(chkGestionarLES != null){
			gestionarLES=1;
		} 
		if(chkGestionarRES != null){
			gestionarRES=1;
		}
		if(chkVerificarLES != null){
			verificarLES=1;
		}
		if(chkVerificarRES != null){
			verificarRES=1;
		}
		if(chkMantenimiento != null){
			mantenimiento=1;
		}
		if(chkReportes != null){
			reporte=1;
		}
		

		System.out.println(gestionarLES);
		System.out.println(gestionarRES);
		System.out.println(verificarLES);
		System.out.println(verificarRES);
		System.out.println(mantenimiento);
		System.out.println(reporte);
		System.out.println();
		System.out.println("============================================");
		System.out.println();
		
		
		
		UnidadOrganica unidadOrganica= new UnidadOrganica();
		unidadOrganica.setNombreUnidad(nombreUnidad);
		unidadOrganica.setDescripcionUnidad(decripcionUnidad);
		
		Cargo cargo=new Cargo();
		cargo.setNombreCargo(nombreCargo);
		cargo.setSueldo(Double.parseDouble(sueldo));
		
		Rol rol= new Rol();
		rol.setGestionarLES(gestionarLES);
		rol.setGestionarRES(gestionarRES);
		rol.setVerficarLES(verificarLES);
		rol.setVerificarRES(verificarRES);
		rol.setMantenimiento(mantenimiento);
		rol.setReporte(reporte);
		
		unidadOrganicaDao=factory.getUnidadOrganica();
		try {
			salida= unidadOrganicaDao.registrarUnidadOrganica(unidadOrganica, cargo,rol);
		} catch (SQLException e) {
			System.out.println(e);
			e.printStackTrace();
		}
		
		gestionarLES=0;
		gestionarRES=0;
		verificarLES=0;
		verificarRES=0;
		mantenimiento=0;
		reporte=0;
	/*
		request.setAttribute("UnidadOrganica", salida);
		request.getRequestDispatcher("/registraUnidadOrganica.jsp").forward(request, response);*/
	
		listarUnidad(request, response);
	}
	
	protected void modificaUnidad(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int salida=-1;
		
		int gestionarLES=0;
		int gestionarRES=0;
		int verificarLES=0;
		int verificarRES=0;
		int mantenimiento=0;
		int reporte=0;

		String idUnidadOrganica=request.getParameter("txtIdUnidadOrganica");
		String nombreUnidad=request.getParameter("txtNombreUnidad");
		String decripcionUnidad=request.getParameter("txtDescripcionUnidad");
		String idCargo=request.getParameter("idCargo");
		String nombreCargo=request.getParameter("txtNombreCargo");
		String sueldo=request.getParameter("txtSueldo");
		
		System.out.println(idCargo);
		
		String chkGestionarLES=request.getParameter("chkGestionarLES");
		String chkGestionarRES=request.getParameter("chkGestionarRES");
		String chkVerificarLES=request.getParameter("chkVerificarLES");
		String chkVerificarRES=request.getParameter("chkVerificarRES");
		String chkMantenimiento=request.getParameter("chkMantenimiento");
		String chkReportes=request.getParameter("chkReportes");
		
		System.out.println(chkGestionarLES);
		System.out.println(chkGestionarRES);
		System.out.println(chkVerificarLES);
		System.out.println(chkVerificarRES);
		System.out.println(chkMantenimiento);
		System.out.println(chkReportes);
		
		System.out.println();
		
		if(chkGestionarLES != null){
			gestionarLES=1;
		} 
		if(chkGestionarRES != null){
			gestionarRES=1;
		}
		if(chkVerificarLES != null){
			verificarLES=1;
		}
		if(chkVerificarRES != null){
			verificarRES=1;
		}
		if(chkMantenimiento != null){
			mantenimiento=1;
		}
		if(chkReportes != null){
			reporte=1;
		}
		

		System.out.println(gestionarLES);
		System.out.println(gestionarRES);
		System.out.println(verificarLES);
		System.out.println(verificarRES);
		System.out.println(mantenimiento);
		System.out.println(reporte);
		System.out.println();
		System.out.println("============================================");
		System.out.println();
		
		
		
		UnidadOrganica unidadOrganica= new UnidadOrganica();
		unidadOrganica.setIdUnidadOrganica(idUnidadOrganica);
		unidadOrganica.setNombreUnidad(nombreUnidad);
		unidadOrganica.setDescripcionUnidad(decripcionUnidad);
		
		Cargo cargo=new Cargo();
		cargo.setIdCargo(idCargo);
		cargo.setNombreCargo(nombreCargo);
		cargo.setSueldo(Double.parseDouble(sueldo));
		
		Rol rol= new Rol();
		rol.setGestionarLES(gestionarLES);
		rol.setGestionarRES(gestionarRES);
		rol.setVerficarLES(verificarLES);
		rol.setVerificarRES(verificarRES);
		rol.setMantenimiento(mantenimiento);
		rol.setReporte(reporte);
		
		System.out.println(unidadOrganica.toString());
		System.out.println(cargo.toString());
		System.out.println(rol.toString());
		
		unidadOrganicaDao=factory.getUnidadOrganica();
		try {
			salida= unidadOrganicaDao.modificarUnidadOrganica(unidadOrganica, cargo,rol);
			System.out.println("servlet: "+salida);
		} catch (SQLException e) {
			System.out.println(e);
			e.printStackTrace();
		}
		
		gestionarLES=0;
		gestionarRES=0;
		verificarLES=0;
		verificarRES=0;
		mantenimiento=0;
		reporte=0;
	/*
		request.setAttribute("UnidadOrganicaModificado", salida);
		request.getRequestDispatcher("/listadoUnidadOrganica.jsp").forward(request, response);*/
		listarUnidad(request, response);
	}
	
	protected void eliminaUnidad(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idUnidad=request.getParameter("idUnidad");
		String idCargo=request.getParameter("idCargo");
		String mensaje="";
		
		unidadOrganicaDao=factory.getUnidadOrganica();
		try {
			mensaje= unidadOrganicaDao.eliminarUnidadOrganica(idUnidad, idCargo);
		} catch (SQLException e) {
			System.out.println(e);
			e.printStackTrace();
		}
		System.out.println(mensaje);
		listarUnidad(request, response);
		
		
	}
	
	private void listarUnidad(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		unidadOrganicaDao = factory.getUnidadOrganica();
		List<ListadoUnidad> listaUnidad=null;
		
		try {
			listaUnidad=unidadOrganicaDao.listarUnidadOrganica();
		} catch (SQLException e) {
			System.out.println(e);
			e.printStackTrace();
		}
		
		request.setAttribute("tbUnidadOrganica", listaUnidad);
		request.getRequestDispatcher("/listadoUnidadOrganica.jsp").forward(request, response);

	}

	private void cargarUnidad(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		String cod= request.getParameter("id");
		ListadoUnidad obj=null;
		try {
			unidadOrganicaDao=factory.getUnidadOrganica();
			obj= unidadOrganicaDao.listarUnidadOrganicaXcodigo(cod);
		} catch (SQLException e) {
			System.out.println(e);
			e.printStackTrace();
		}
		//System.out.println("dni : "+obj.getnDNI());
		request.setAttribute("CargaUnidad", obj);
		request.getRequestDispatcher("/modificaUnidadOrganica.jsp").forward(request, response);
		
		
	}

}