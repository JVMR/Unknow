package controlador;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import patronDAO.EquipoDao;
import patronDAO.Factory;
import entidad.Equipo;
import entidad.ListaCargoEquipo;
import entidad.ListadoEquipo;

/**
 * Servlet implementation class ServletGestionarEquipo
 */
@WebServlet("/gestionarEquipo")
public class ServletGestionarEquipo extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private static final String CONTENT_TYPE = "text/xml";

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	
	ArrayList<ListaCargoEquipo> arrayList=new ArrayList<ListaCargoEquipo>();
	int item=0;
	
	Factory factory= Factory.getTipo(Factory.TIPO_MYSQL);
	EquipoDao equipoDao=null;
	String 	idE="";
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String operacion= request.getParameter("operacion");
		
		if(operacion.equals("registrarEquipo")){
			this.registrarEquipo(request, response);
		}
		if(operacion.equals("modificarEquipo")){
			this.modificarEquipo(request, response);
		}
		if(operacion.equals("eliminarEquipo")){
			this.eliminarEquipo(request, response);
		}
		if(operacion.equals("listarEquipos")){
			this.listarEquipos(request, response);
		}
		if(operacion.equals("cargarEquipo")){
			this.cargarEquipo(request,response);
			//this.listarCargoxModificar(request, response);
		}
		if(operacion.equals("agregarCargo")){
			this.agregarCargo(request,response);
		}
		if(operacion.equals("agregarCargoModifica")){
			this.agregarCargoModifica(request,response);
			
		}
		if(operacion.equals("quitarCargo")){
			this.quitarCargo(request,response);
		}
		if(operacion.equals("quitarCargoModificacion")){
			this.quitarCargoModificacion(request,response);
		}
		if(operacion.equals("listarCargo")){
			this.listarCargo(request,response);
		}
		if(operacion.equals("listarCargoxModificar")){
			this.listarCargoxModificar(request,response);
		}
	}




	private void quitarCargoModificacion(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		String idItem=request.getParameter("idItem");
		String idCargo=request.getParameter("idCargo");
		
		int salida=-1;
		
		if(Integer.parseInt(idItem)!=0){
			for (int i = 0; i < arrayList.size(); i++) {
				if(arrayList.get(i).getItemCargo()==Integer.parseInt(idItem)){
					arrayList.remove(i);  
				}
			}
			
			request.setAttribute("CargoxEquipo_Modifica", arrayList);
			request.getRequestDispatcher("/tablaListaCargoXEquipo_modifica.jsp").forward(request, response);
			
		}else {
			
			equipoDao=factory.getEquipo();
			
			try {
				salida=equipoDao.eliminaCargo(idCargo);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			for (int i = 0; i < arrayList.size(); i++) {
				if(arrayList.get(i).getIdCargo().equals(idCargo)){
					arrayList.remove(i);  
				}
			}
			
			request.setAttribute("CargoxEquipo_Modifica", arrayList);
			request.getRequestDispatcher("/tablaListaCargoXEquipo_modifica.jsp").forward(request, response);
			
			
		}
		
		
		
		
	}




	private void listarCargo(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("CargoxEquipo", arrayList);
		request.getRequestDispatcher("/tablaListaCargoXEquipo.jsp").forward(request, response);
		
	}

	private void quitarCargo(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String id=request.getParameter("idItem");
		
		for (int i = 0; i < arrayList.size(); i++) {
			if(arrayList.get(i).getItemCargo()==Integer.parseInt(id)){
				arrayList.remove(i);  
			}
		}
		
		listarCargo(request, response);
		
	}

	private void agregarCargo(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		item=item+1;

		int gestionarLES=0;
		int gestionarRES=0;
		int verificarLES=0;
		int verificarRES=0;
		int visarRES=0;
		int listarLES=0;
		int listarRES=0;
		int mantenimiento=0;
		int reporte=0;

		
		String nombrecargo=request.getParameter("txtNombreCargo");
		String sueldo=request.getParameter("txtSueldo");
	
		String chkGestionarLES=request.getParameter("chkGestionarLES");
		String chkGestionarRES=request.getParameter("chkGestionarRES");
		String chkVerificarLES=request.getParameter("chkVerificarLES");
		String chkVerificarRES=request.getParameter("chkVerificarRES");
		String chkVisarRES = request.getParameter("chkVisarRES");
		String chkListarLES = request.getParameter("chkListarLES");
		String chkListarRES = request.getParameter("chkListarRES");
		String chkMantenimiento=request.getParameter("chkMantenimiento");
		String chkReportes=request.getParameter("chkReportes");
		
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
		if (chkVisarRES != null) {
			visarRES=1;
		}
		if (chkListarLES != null) {
			listarLES=1;
		}
		if (chkListarRES != null) {
			listarRES=1;
		}
		if(chkMantenimiento != null){
			mantenimiento=1;
		}
		if(chkReportes != null){
			reporte=1;
		}
		
		ListaCargoEquipo cargoEquipo= new ListaCargoEquipo();
		cargoEquipo.setItemCargo(item);
		cargoEquipo.setNombreCargo(nombrecargo);
		cargoEquipo.setSueldo(Double.parseDouble(sueldo));
		cargoEquipo.setGestionarLES(gestionarLES);
		cargoEquipo.setGestionarRES(gestionarRES);
		cargoEquipo.setVerificarLES(verificarLES);
		cargoEquipo.setVerificarRES(verificarRES);
		cargoEquipo.setVisarRES(visarRES);
		cargoEquipo.setListarLES(listarLES);
		cargoEquipo.setListarRES(listarRES);
		cargoEquipo.setMantenimiento(mantenimiento);
		cargoEquipo.setReporte(reporte);
		
		arrayList.add(cargoEquipo);
		
		listarCargo(request, response);
		
	}

	private void registrarEquipo(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException{

		int salida=-1;
		
		String idUnidad=request.getParameter("cboUnidad");
		String nombreEquipo=request.getParameter("txtNombreEquipo");
		String descripcionEquipo=request.getParameter("txtDescripcion");
		
		Equipo equipo= new Equipo();
		equipo.setIdUnidadOrganica(idUnidad);
		equipo.setNombreEquipo(nombreEquipo);
		equipo.setDescripcionEquipo(descripcionEquipo);
		
		equipoDao=factory.getEquipo();
		try {
			 equipoDao.registrarEquipo(equipo, arrayList);
		} catch (SQLException e) {
			System.out.println(e);
			e.printStackTrace();
		}
		
		arrayList.clear();
		item=0;
		//request.setAttribute("Equipos", salida);
		request.getRequestDispatcher("/registraEquipo.jsp").forward(request, response);
		
	}

	private void modificarEquipo(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException{
		int salida=-1;
		
		//String idUnidad=request.getParameter("cboUnidad");
		String nombreEquipo=request.getParameter("txtNombreEquipo");
		String descripcionEquipo=request.getParameter("txtDescripcion");
		
		Equipo equipo= new Equipo();
		equipo.setIdEquipo(idE);
		equipo.setNombreEquipo(nombreEquipo);
		equipo.setDescripcionEquipo(descripcionEquipo);
		
		equipoDao=factory.getEquipo();
		try {
			 equipoDao.modificarEquipo(equipo, arrayList);
		} catch (SQLException e) {
			System.out.println("error en servelet"+e);
			e.printStackTrace();
		}
		
		arrayList.clear();
		item=0;
		idE=null;
		
		listarEquipos(request, response);
		
	}

	private void eliminarEquipo(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException{
	
		String idEquipo=request.getParameter("id");
		String mensaje="";
		
		equipoDao=factory.getEquipo();
		try {
			mensaje= equipoDao.eliminarEquipo(idEquipo);
		} catch (SQLException e) {
			System.out.println(e);
			e.printStackTrace();
		}
		System.out.println(mensaje);
		listarEquipos(request, response);
		
		
		
	}

	private void listarEquipos(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException{
		equipoDao = factory.getEquipo();
		ArrayList<ListadoEquipo> listadoEquipo=null;
		
		try {
			listadoEquipo= equipoDao.listarEquipo();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("tbEquipos", listadoEquipo);
		request.getRequestDispatcher("/listadoEquipo.jsp").forward(request, response);
		
	}

	private void cargarEquipo(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException{
		 	idE=request.getParameter("id");
		ListadoEquipo listadoEquipo =null;
		
		equipoDao=factory.getEquipo();
		try {
			listadoEquipo=equipoDao.listarEquipoXcodigo(idE);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("CargaEquipo", listadoEquipo);
		request.getRequestDispatcher("/modificaEquipo.jsp").forward(request, response);
		
		//listarCargoxModificar(request, response);
	}
	

	private void listarCargoxModificar(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType(CONTENT_TYPE);
		
	//	String id=request.getParameter("idE");
		
		equipoDao=factory.getEquipo();
		
		try {
			arrayList=equipoDao.listarCargoxEquipo(idE);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		request.setAttribute("CargoxEquipo_Modifica", arrayList);
		request.getRequestDispatcher("/tablaListaCargoXEquipo_modifica.jsp").forward(request, response);
		
	}
	

	private void agregarCargoModifica(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		item=item+1;

		int gestionarLES=0;
		int gestionarRES=0;
		int verificarLES=0;
		int verificarRES=0;
		int visarRES=0;
		int listarLES=0;
		int listarRES=0;
		int mantenimiento=0;
		int reporte=0;
		
		String nombrecargo=request.getParameter("txtNombreCargo");
		String sueldo=request.getParameter("txtSueldo");
	
		String chkGestionarLES=request.getParameter("chkGestionarLES");
		String chkGestionarRES=request.getParameter("chkGestionarRES");
		String chkVerificarLES=request.getParameter("chkVerificarLES");
		String chkVerificarRES=request.getParameter("chkVerificarRES");
		String chkVisarRES = request.getParameter("chkVisarRES");
		String chkListarLES = request.getParameter("chkListarLES");
		String chkListarRES = request.getParameter("chkListarRES");
		String chkMantenimiento=request.getParameter("chkMantenimiento");
		String chkReportes=request.getParameter("chkReportes");
		
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
		if (chkVisarRES != null) {
			visarRES=1;
		}
		if (chkListarLES != null) {
			listarLES=1;
		}
		if (chkListarRES != null) {
			listarRES=1;
		}
		if(chkMantenimiento != null){
			mantenimiento=1;
		}
		if(chkReportes != null){
			reporte=1;
		}
		
		ListaCargoEquipo cargoEquipo= new ListaCargoEquipo();
		cargoEquipo.setItemCargo(item);
		cargoEquipo.setNombreCargo(nombrecargo);
		cargoEquipo.setSueldo(Double.parseDouble(sueldo));
		cargoEquipo.setGestionarLES(gestionarLES);
		cargoEquipo.setGestionarRES(gestionarRES);
		cargoEquipo.setVerificarLES(verificarLES);
		cargoEquipo.setListarLES(listarLES);
		cargoEquipo.setListarRES(listarRES);
		cargoEquipo.setVerificarRES(verificarRES);
		cargoEquipo.setMantenimiento(mantenimiento);
		cargoEquipo.setReporte(reporte);
		
		arrayList.add(cargoEquipo);
		
		request.setAttribute("CargoxEquipo_Modifica", arrayList);
		request.getRequestDispatcher("/tablaListaCargoXEquipo_modifica.jsp").forward(request, response);
		
		//listarCargoxModificar(request, response);
		
	}
	
	

}