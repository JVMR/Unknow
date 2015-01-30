package controlador;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import patronDAO.CargoDao;
import patronDAO.Factory;
import patronDAO.LesDao;
import patronDAO.UtilitarioDao;
import util.MostrarPDF;
import entidad.Cargo;
import entidad.Les;
import entidad.Utilitario;

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
	DateFormat fecha= new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
	DateFormat fecha1= new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss");
	Factory fabrica= Factory.getTipo(Factory.TIPO_MYSQL);
	CargoDao dao= null;
	LesDao les= null;
	UtilitarioDao utl=null;
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
		}if(operacion.equals("listarLes")){
			this.listarLes(request, response);
		}if(operacion.equals("evLes")){
			this.evLes(request, response);
		}
		
	}
	protected void generarLES(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String diagnostico=request.getParameter("txtDiagnostico");
		String nombre=request.getParameter("txtNombre");
		String FechaInicio=request.getParameter("txtFecha1");
		String FechaFin=request.getParameter("txtFecha2");
		String cantidad=request.getParameter("txtDias");		
		String motivoLicencia=request.getParameter("cboLicencia");
		String desc_motivoLicencia=request.getParameter("txtDescripcionLicencia");		
		String fechaGen=fecha.format(new Date());
		String idEmp=request.getParameter("id");
		String nFec=fecha1.format(new Date());
		
		
		System.out.println("Diagnostico "+diagnostico);
		System.out.println("Fecha I "+FechaInicio);
		System.out.println("Fecha F "+FechaFin);
		System.out.println("Cantidad "+cantidad);
		System.out.println("Nombre Empleado " + nombre);
		System.out.println("Licencia "+motivoLicencia);
		System.out.println("Descripcion "+desc_motivoLicencia);
		System.out.println("Fecha Hoy "+fechaGen);
		System.out.println("Empleado  "+idEmp);
		InputStream inputStream = null; // input stream of the upload file
        byte[] documento = null;
        
        Part dmento=request.getPart("txtDocumento");
        System.out.println("Documento "+dmento);
		if (dmento != null) {
            //prints out some information for debugging
          // System.out.println(filePart.getName());
           //System.out.println(filePart.getSize());
            //System.out.println(filePart.getContentType());
             
            // obtains input stream of the upload file
            inputStream = dmento.getInputStream();
            //CONVIERTE INPUTSTREAM EN BYTES[]
            ByteArrayOutputStream bos = new ByteArrayOutputStream();
            byte[] tmp = new byte[4096];
            int ret = 0;

            while((ret = inputStream.read(tmp)) > 0)
            {
                bos.write(tmp, 0, ret);
            }

            documento = bos.toByteArray();
            //./CONVIERTE INPUTSTREAM EN BYTES[]
        }
		les=fabrica.getLes();
		Les objLes = new Les();
		objLes.setDiagnostico(diagnostico);
		objLes.setFechaInicioDes(FechaInicio);
		objLes.setFechaFinDes(FechaFin);
		objLes.setCantidad(Integer.parseInt(cantidad));
		objLes.setMotivoLicencia(motivoLicencia);
		objLes.setDescripcionMotivo(desc_motivoLicencia);
		objLes.setFechaHora(fechaGen);
		objLes.setIdEmpleado(idEmp);
		objLes.setDocumento(documento);
		
		
		
		objLes.setPdf(new MostrarPDF().createPdf(objLes, nombre,idEmp+"-"+nFec));
		
		System.out.println("archivito :"+new MostrarPDF().createPdf(objLes, nombre,idEmp+"-"+nFec) );
		les.ingresaLes(objLes);
		
		
		
		request.getRequestDispatcher("/perfil.jsp").forward(request, response);
		
		
	}
	protected void listarCargoxNombre(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nombre=request.getParameter("nom");
		String codigo=request.getParameter("id");
		dao=fabrica.getCargo();
		utl=fabrica.getUtilitario();
		Utilitario ul= null;				
		Cargo obj=dao.listaCargoxNombre(nombre);
		les=fabrica.getLes();
		Les ls=null;
		List<Les> data=null ; 
		try {
			data=les.listaLesxCodigo(codigo);
			 ul= utl.listaUtil(codigo);
			if(ul.getEstado().equals("Disconforme")){
				ls= les.listaLesxEstado(ul.getEstado());
				if(les!=null){
					request.setAttribute("lesEstado", ls);
				}				
			}else{
				System.out.println("Estado : "+ ul.getEstado());
			}
			request.setAttribute("lesCodigo", data);
		} catch (SQLException e) {
			e.printStackTrace();
		}		
					
		
		request.setAttribute("daoCargo", obj);
		request.setAttribute("daoUtil", ul);
		request.getRequestDispatcher("/generarLES.jsp").forward(request, response);
	}
	protected void modificarLES(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idLes=request.getParameter("idLES");
		String diagnostico=request.getParameter("txtDiagnostico");
		String FechaInicio=request.getParameter("txtFecha1");
		String FechaFin=request.getParameter("txtFecha2");
		String cantidad=request.getParameter("txtDias");		
		String motivoLicencia=request.getParameter("cboLicencia");
		String desc_motivoLicencia=request.getParameter("txtDescripcionLicencia");		
		String fechaGen=fecha.format(new Date());
		
		System.out.println("Diagnostico "+diagnostico);
		System.out.println("Fecha I "+FechaInicio);
		System.out.println("Fecha F "+FechaFin);
		System.out.println("Cantidad "+cantidad);
		System.out.println("LES : "+idLes);
		
		System.out.println("Licencia "+motivoLicencia);
		System.out.println("Descripcion "+desc_motivoLicencia);
		System.out.println("Fecha Hoy "+fechaGen);
		
		les=fabrica.getLes();
		Les objLes = new Les();
		objLes.setIdLes(idLes);
		objLes.setDiagnostico(diagnostico);
		objLes.setFechaInicioDes(FechaInicio);
		objLes.setFechaFinDes(FechaFin);
		objLes.setCantidad(Integer.parseInt(cantidad));
		objLes.setMotivoLicencia(motivoLicencia);
		objLes.setDescripcionMotivo(desc_motivoLicencia);
		objLes.setFechaHora(fechaGen);
		les.modificarLes(objLes);
		request.getRequestDispatcher("/perfil.jsp").forward(request, response);
	
		
	}
	protected void listarLes(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		les=fabrica.getLes();
		List<Les> data=null;
		try {
			data=les.listaLes();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("Les", data);
		request.getRequestDispatcher("/listarLES.jsp").forward(request, response);
	}
	protected void evLes(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		les=fabrica.getLes();
		List<Les> data=null;
		try {
			data=les.evLes();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("lesEstados", data);
		request.getRequestDispatcher("/evaluarSolicitudLES.jsp").forward(request, response);
	}

}
