package controlador;

import java.io.IOException;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import patronDAO.EmailDAO;
import patronDAO.Factory;
import patronDAO.LesDao;
import entidad.Les;



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
	EmailDAO edao=null;
	DateFormat fecha1= new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss");
	
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
		if(operacion.equals("essalud")){
			this.ESSALUD(request, response);
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
			e.printStackTrace();
		}
		System.out.println("Diagnostico : "+obj.getDiagnostico());
		request.setAttribute("daoLes", obj);
		request.getRequestDispatcher("/consultarDM.jsp").forward(request, response);
	}
	protected void actualizarEstadoLes(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String idLes =request.getParameter("txtIdLes");
		String idEstado =request.getParameter("rdEstado");
		String emp =request.getParameter("txtEmpleado");
		String nFec=fecha1.format(new Date());		
		
		
			dao=fabrica.getLes();
			Les l = new Les();
			l.setIdLes(idLes);
			if(idEstado.equals("4") ){
				Les objLes=null;
				try {
					objLes = dao.LesxCodigo(idLes);
				} catch (SQLException e) {
					e.printStackTrace();
				}
				String to = "essalud.2014@gmail.com";
				
				String msg= "<html><body>"
						+ "<div>"
						+ "<span>PARA : ESSALUD</span><br>"
						+ "<span>DE : "+ emp +" del Instituto Nacional de Rehabilitacion </span><br>"
						+ "<span>ASUNTO   :   SOLICITUD DE LICENCIA POR ENFERMEDAD SUBSIDIADA</span><br><br>"
						+ "<p>El asalariado en cumplimiento con las normas legales establecida por el Congreso de la República del Perú, la Ley"+
					"29344 – El Marco de Aseguramiento Universal en Salud, la Ley 29761 – Ley de Financiamiento Público de los Regímenes"+
					"Subsidiado y Semicontributivo del Aseguramiento Universal en Salud, el Decreto Legislativo 276 aprobado con el decreto supremo 005-90-PCM.</p>"
						+ "<p>Por motivo de "+objLes.getMotivoLicencia()+" por "+ objLes.getCantidad()+" dias de descanso medico, "+
					 "que rige a partir del "+objLes.getFechaInicioDes()+" hasta el "+objLes.getFechaFinDes()+" ,se solicita a ESSALUD por medio de "+
					 "la presente la regularización de las inasistencias por parte del asalariado en mención por motivos , declaro encontrarme "+
					 "dentro de las normas legales, de lo contrario la solicitud tendrá invalidez inmediata.</p><br><br>"
					 	+ "<span>Para terminar el proceso es necesario que llevar el codigo de la licencia :"+ idLes +"</span><br>"
						+ "<a href = 'http://localhost:8080/Proyect/ESSALUD_LES.jsp'>Terminar el proceso</a>"
						+ "<p>Lima-Chorrillos "+nFec+"</p>"
						+ "</div>"
						+ "</body></html>";
				edao =fabrica.getEmail();
				edao.enviarcorreo(to, msg);
				
			}
			if(idEstado.equals("5")){
				String chkDiagnostico =request.getParameter("chkDiagnostico");
				String chkFecha =request.getParameter("chkFecha");
				String chkMotivo =request.getParameter("chkMotivo");
				String chkDescripcion =request.getParameter("chkDescripcion");	
				if(chkDiagnostico==null){
					chkDiagnostico="has-success";
				}
				if(chkFecha==null){
					chkFecha="has-success";
				}
				if(chkMotivo==null){
					chkMotivo="has-success";
				}
				if(chkDescripcion==null){
					chkDescripcion="has-success";
				}
				String miarray[]= {chkDiagnostico,chkFecha,chkMotivo,chkDescripcion,"for='inputWarning'"};
				
				StringBuffer cadena = new StringBuffer();
				
				for (String x: miarray){
					cadena =cadena.append(x+",");
				}
				System.out.println(cadena);		
				String errores = cadena.toString();
				/*String[] arrayColores = colores.split(",");
				 
				// En este momento tenemos un array en el que cada elemento es un color.
				for (int i = 0; i < arrayColores.length; i++) {
					System.out.println(arrayColores[i]);
				}*/
				l.setError(errores);
				try {
					dao.modificaErrorLes(l);
					System.out.println(l.getError());
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}				
			}			
			l.setIdEstado(idEstado);		
			try {
				dao.ActualizaEstado(l);
				System.out.println("Codigo " + l.getIdLes());
				
			} catch (SQLException e) {				
				e.printStackTrace();
			}		
		
			listarLes(request, response);
	}
protected void ESSALUD(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
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
				e.printStackTrace();
			}		
	}

}
