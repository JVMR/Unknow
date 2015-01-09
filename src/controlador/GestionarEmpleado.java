package controlador;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import patronDAO.EmpleadoDao;
import patronDAO.Factory;
import util.ConexionDB;
import entidad.Empleado;

/**
 * Servlet implementation class GestionarEmpleado
 */

@WebServlet("/GestionarEmpleado")
@MultipartConfig(maxFileSize = 16177215)

public class GestionarEmpleado extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	Factory fabrica= Factory.getTipo(Factory.TIPO_MYSQL);
	EmpleadoDao dao= null;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String operacion= request.getParameter("operacion");
		
		if(operacion.equals("registraEmpleado")){
			this.registraEmpleado(request, response);
		}
		if(operacion.equals("listarEmpleado")){
			this.listarEmpleado(request, response);
		}
		if(operacion.equals("fotoEmpleado")){
			this.fotoEmpleado(request, response);
		}
		if(operacion.equals("cargarEmpleado")){
			this.cargarEmpleado(request, response);
		}
		if(operacion.equals("actualizarEmpleado")){
			this.actualizarEmpleado(request, response);
		}
		if(operacion.equals("eliminarEmpleado")){
			this.eliminarEmpleado(request, response);
		}		
		
	}
	protected void registraEmpleado(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			String nDNI=request.getParameter("txtDNI");
			String nombre=request.getParameter("txtNombre");
			String apellidoP=request.getParameter("txtApellidoP");
			String apellidoM=request.getParameter("txtApellidoM");
			String fechaN=request.getParameter("txtFechaN");
			String fono=request.getParameter("txtFono");
			String seguro=request.getParameter("txtSeguroSocial");
			String cargo=request.getParameter("cboCargo");
			String estado=request.getParameter("cboEstado");
			String fechaI=request.getParameter("txtFechaI");
			String usuario=request.getParameter("txtUsuario");
			String psw=request.getParameter("txtPssword");
			
			
			//FileInputStream MyStream= new FileInputStream(fotox); -IOUtils.toByteArray(MyStream)
			InputStream inputStream = null; // input stream of the upload file
	        byte[] foto = null;
	        
	        Part filePart = request.getPart("txtFoto");      
	        if (filePart != null) {
	            //prints out some information for debugging
	          // System.out.println(filePart.getName());
	           //System.out.println(filePart.getSize());
	            //System.out.println(filePart.getContentType());
	             
	            // obtains input stream of the upload file
	            inputStream = filePart.getInputStream();
	            //CONVIERTE INPUTSTREAM EN BYTES[]
	            ByteArrayOutputStream bos = new ByteArrayOutputStream();
	            byte[] tmp = new byte[4096];
	            int ret = 0;

	            while((ret = inputStream.read(tmp)) > 0)
	            {
	                bos.write(tmp, 0, ret);
	            }

	             foto = bos.toByteArray();
	            //./CONVIERTE INPUTSTREAM EN BYTES[]
	        }	
				dao=fabrica.getEmpleado();
				Empleado emp = new Empleado();
				
				emp.setnDNI(nDNI);
				emp.setNombresEmpleado(nombre);
				emp.setApellidoPaterno(apellidoP);
				emp.setApellidoMaterno(apellidoM);
				emp.setFechaNacimiento(fechaN);
				emp.setTelefono(fono);
				emp.setNumeroSeguroSocial(seguro);
				emp.setIdCargo(cargo);
				emp.setIdEstado(estado);
				emp.setFoto(foto);
				emp.setFechaIngreso(fechaI);
				emp.setUsuario(usuario);
				emp.setPsswrd(psw);
				dao.registraEmpleado(emp);		
			
				listarEmpleado(request, response);
	}
	protected void listarEmpleado(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		dao=fabrica.getEmpleado();
		List<Empleado> data=null;
		try {
			data=dao.listaEmpleado();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("Empleados", data);
		request.getRequestDispatcher("/listarEmpleado.jsp").forward(request, response);
	}
	protected void fotoEmpleado(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String codEmp = request.getParameter("id");
	        InputStream sImage;
	        try{
	        	Connection cn = new ConexionDB().getConexion(); 
	        	PreparedStatement pst = cn.prepareStatement("SELECT foto FROM proyectolpii.empleado where idEmpleado=?") ;
	        	pst.setString(1, codEmp); 
	        	ResultSet rs = pst.executeQuery(); 
	            if(rs.next()){
	                byte[] bytearray = new byte[1048576];
	                int size=0;
	                sImage = rs.getBinaryStream(1);	
	                if(sImage!=null){
	                	response.reset();
		                response.setContentType("image/jpeg");
		                while((size = sImage.read(bytearray)) != -1 ){
		                    response.getOutputStream().
		                    write(bytearray,0,size);
		                }
	                }         
	            }
	        } catch (Exception e){
	            e.printStackTrace();
	        }
		
		
	}	
	protected void cargarEmpleado(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cod= request.getParameter("id");
		Empleado obj=null;
		try {
			dao=fabrica.getEmpleado();
			obj= dao.EmpleadoxCodigo(cod);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("dni : "+obj.getnDNI());
		request.setAttribute("daoEmpleado", obj);
		request.getRequestDispatcher("/modificarEmpleado.jsp").forward(request, response);
		
	}
	protected void actualizarEmpleado(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String cod=request.getParameter("id");
		String nDNI=request.getParameter("txtDNI");
		String nombre=request.getParameter("txtNombre");
		String apellidoP=request.getParameter("txtApellidoP");
		String apellidoM=request.getParameter("txtApellidoM");
		String fechaN=request.getParameter("txtFechaN");
		String fono=request.getParameter("txtFono");
		String seguro=request.getParameter("txtSeguroSocial");
		String cargo=request.getParameter("cboCargo");
		String estado=request.getParameter("cboEstado");
		String fechaI=request.getParameter("txtFechaI");
		String usuario=request.getParameter("txtUsuario");
		String psw=request.getParameter("txtPssword");
		
		
		//FileInputStream MyStream= new FileInputStream(fotox); -IOUtils.toByteArray(MyStream)
		InputStream inputStream = null; // input stream of the upload file
        byte[] foto = null;
        
        Part filePart = request.getPart("txtFoto");
        
        System.out.println("Archivo File :"+filePart);	        
        if (filePart != null) {
            //prints out some information for debugging
          // System.out.println(filePart.getName());
           //System.out.println(filePart.getSize());
            //System.out.println(filePart.getContentType());
             
            // obtains input stream of the upload file
            inputStream = filePart.getInputStream();
            System.out.println("Salio esto : "+inputStream);
            //CONVIERTE INPUTSTREAM EN BYTES[]
            ByteArrayOutputStream bos = new ByteArrayOutputStream();
            byte[] tmp = new byte[4096];
            int ret = 0;

            while((ret = inputStream.read(tmp)) > 0)
            {
                bos.write(tmp, 0, ret);
            }

             foto = bos.toByteArray();
            //./CONVIERTE INPUTSTREAM EN BYTES[]
        }	
		
			dao=fabrica.getEmpleado();
			Empleado emp = new Empleado();
			
			emp.setIdEmpleado(cod);
			emp.setnDNI(nDNI);
			emp.setNombresEmpleado(nombre);
			emp.setApellidoPaterno(apellidoP);
			emp.setApellidoMaterno(apellidoM);
			emp.setFechaNacimiento(fechaN);
			emp.setTelefono(fono);
			emp.setNumeroSeguroSocial(seguro);
			emp.setIdCargo(cargo);
			emp.setIdEstado(estado);
			emp.setFoto(foto);
			emp.setFechaIngreso(fechaI);
			emp.setUsuario(usuario);
			emp.setPsswrd(psw);
			try {
				dao.modificaEmpleado(emp);
				System.out.println("Codigo" + emp.getIdEmpleado());
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}		
		
			listarEmpleado(request, response);
	}
	protected void eliminarEmpleado(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cod= request.getParameter("id");
		System.out.println(cod);
		try {
			dao=fabrica.getEmpleado();
			dao.eliminaEmpleado(cod);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		listarEmpleado(request, response);
	}

}
