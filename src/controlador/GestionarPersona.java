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

import patronDAO.Factory;
import patronDAO.PersonaDao;
import util.ConexionSQL;
import entidad.Persona;

/**
 * Servlet implementation class GestionarPersona
 */

@WebServlet("/GestionarPersona")
@MultipartConfig(maxFileSize = 16177215)

public class GestionarPersona extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	Factory fabrica= Factory.getTipo(Factory.TIPO_SQL_SERVER);
	PersonaDao dao= null;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String operacion= request.getParameter("operacion");
		
		if(operacion.equals("registraPersona")){
			this.registraPersona(request, response);
		}
		if(operacion.equals("listarPersona")){
			this.listarPersona(request, response);
		}
		if(operacion.equals("fotoPersona")){
			this.fotoPersona(request, response);
		}
		if(operacion.equals("firmaPersona")){
			this.firmaPersona(request, response);
		}
		/*if(operacion.equals("huellaPersona")){
			this.huellaPersona(request, response);
		}*/
		if(operacion.equals("cargarPersona")){
			this.cargarPersona(request, response);
		}
		if(operacion.equals("actualizarPersona")){
			this.actualizarPersona(request, response);
		}
		if(operacion.equals("eliminarPersona")){
			this.eliminarPersona(request, response);
		}		
		
	}
	protected void registraPersona(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			String nDNI=request.getParameter("txtDNI");
			String nombre=request.getParameter("txtNombre");
			String apellidoP=request.getParameter("txtApellidoP");
			String apellidoM=request.getParameter("txtApellidoM");
			String sexo=request.getParameter("cboSexo");
			String fechaN=request.getParameter("txtFechaN");
			String fono=request.getParameter("txtFono");
			String direccion=request.getParameter("txtDireccion");
			String email=request.getParameter("txtEmail");
			String distrito=request.getParameter("cboDistrito");
			
			
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
	        InputStream inputStream1 = null; // input stream of the upload file
	        byte[] firma = null;
	        
	        Part filePart1 = request.getPart("txtFirma");
	        
	        System.out.println("Archivo File :"+filePart1);	        
	        if (filePart1 != null) {
	            //prints out some information for debugging
	          // System.out.println(filePart.getName());
	           //System.out.println(filePart.getSize());
	            //System.out.println(filePart.getContentType());
	             
	            // obtains input stream of the upload file
	            inputStream1 = filePart1.getInputStream();
	            System.out.println("Salio esto : "+inputStream1);
	            //CONVIERTE INPUTSTREAM EN BYTES[]
	            ByteArrayOutputStream bos = new ByteArrayOutputStream();
	            byte[] tmp = new byte[4096];
	            int ret = 0;

	            while((ret = inputStream1.read(tmp)) > 0)
	            {
	                bos.write(tmp, 0, ret);
	            }

	             firma = bos.toByteArray();
	            //./CONVIERTE INPUTSTREAM EN BYTES[]
	        }	
	        //InputStream inputStream2 = null; // input stream of the upload file
	        byte[] huella = null;
	        
	        Part filePart2 = request.getPart("txtHuella");
	        
	        System.out.println("Archivo File :"+filePart2);	        
	        /*if (filePart2 != null) {
	            //prints out some information for debugging
	          // System.out.println(filePart.getName());
	           //System.out.println(filePart.getSize());
	            //System.out.println(filePart.getContentType());
	             
	            // obtains input stream of the upload file
	            inputStream2 = filePart2.getInputStream();
	            System.out.println("Salio esto : "+inputStream2);
	            //CONVIERTE INPUTSTREAM EN BYTES[]
	            ByteArrayOutputStream bos = new ByteArrayOutputStream();
	            byte[] tmp = new byte[4096];
	            int ret = 0;

	            while((ret = inputStream2.read(tmp)) > 0)
	            {
	                bos.write(tmp, 0, ret);
	            }

	             huella = bos.toByteArray();
	            //./CONVIERTE INPUTSTREAM EN BYTES[]
	        }	*/
	           System.out.println("DNI : "+nDNI);
	           System.out.println("DNI : "+nombre);
	           System.out.println("DNI : "+apellidoP);
	           System.out.println("DNI : "+apellidoM);
	           System.out.println("DNI : "+sexo);
	           System.out.println("DNI : "+fechaN);
	           System.out.println("DNI : "+fono);
	           System.out.println("DNI : "+direccion);
	           System.out.println("DNI : "+email);
	           System.out.println("DNI : "+distrito);
				System.out.println("en bytes creo :"+foto);
				System.out.println("en bytes creo :"+firma);
				System.out.println("en bytes creo :"+huella);
				
				dao=fabrica.getPersona();
				Persona emp = new Persona();
				
				emp.setnDNI(nDNI);
				emp.setNombre(nombre);
				emp.setApeP(apellidoP);
				emp.setApeM(apellidoM);
				emp.setSexo(sexo);
				emp.setFechaNac(fechaN);
				emp.setTelefono(fono);
				emp.setDireccion(direccion);
				emp.setEmail(email);
				emp.setFoto(foto);
				emp.setFirma(firma);
				emp.setHuella(huella);
				emp.setIdDistrito(distrito);
				dao.registraPersona(emp);		
			
				listarPersona(request, response);
	}
	protected void listarPersona(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		dao=fabrica.getPersona();
		List<Persona> data=null;
		try {
			data=dao.listaPersona();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		request.setAttribute("Personas", data);
		request.getRequestDispatcher("/listarPersona.jsp").forward(request, response);
	}
	protected void firmaPersona(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String codEmp = request.getParameter("id");
	        InputStream sImage;
	        try{
	        	Connection cn = new ConexionSQL().getConexion(); 
	        	PreparedStatement pst = cn.prepareStatement("SELECT firma FROM Persona where nDNI=?") ;
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
		                    System.out.println(""+sImage);
		                }
	                }         
	            }
	        } catch (Exception e){
	            e.printStackTrace();
	        }
		
		
	}	
	protected void huellaPersona(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String codEmp = request.getParameter("id");
	        InputStream sImage;
	        try{
	        	Connection cn = new ConexionSQL().getConexion(); 
	        	PreparedStatement pst = cn.prepareStatement("SELECT huella FROM Persona where nDNI=?") ;
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
		                    System.out.println(""+sImage);
		                }
	                }         
	            }
	        } catch (Exception e){
	            e.printStackTrace();
	        }
		
		
	}	
	protected void fotoPersona(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String codEmp = request.getParameter("id");
	        InputStream sImage;
	        try{
	        	Connection cn = new ConexionSQL().getConexion(); 
	        	PreparedStatement pst = cn.prepareStatement("SELECT foto FROM Persona where nDNI=?") ;
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
		                    System.out.println(""+sImage);
		                }
	                }         
	            }
	        } catch (Exception e){
	            e.printStackTrace();
	        }
		
		
	}	
	protected void cargarPersona(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cod= request.getParameter("id");
		Persona emp=null;
		try {
			dao=fabrica.getPersona();
			emp= dao.PersonaxCodigo(cod);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("dni : "+emp.getnDNI());
		request.setAttribute("daoPersona", emp);
		request.getRequestDispatcher("/modificarPersona.jsp").forward(request, response);
		
	}
	protected void actualizarPersona(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String nDNI=request.getParameter("txtDNI");
		String nombre=request.getParameter("txtNombre");
		String apellidoP=request.getParameter("txtApellidoP");
		String apellidoM=request.getParameter("txtApellidoM");
		String sexo=request.getParameter("cboSexo");
		String fechaN=request.getParameter("txtFechaN");
		String fono=request.getParameter("txtFono");
		String direccion=request.getParameter("txtDireccion");
		String email=request.getParameter("txtEmail");
		String distrito=request.getParameter("cboDistrito");
		
		
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
        InputStream inputStream1 = null; // input stream of the upload file
        byte[] firma = null;
        
        Part filePart1 = request.getPart("txtFirma");
        
        System.out.println("Archivo File :"+filePart1);	        
        if (filePart1 != null) {
            //prints out some information for debugging
          // System.out.println(filePart.getName());
           //System.out.println(filePart.getSize());
            //System.out.println(filePart.getContentType());
             
            // obtains input stream of the upload file
            inputStream1 = filePart1.getInputStream();
            System.out.println("Salio esto : "+inputStream1);
            //CONVIERTE INPUTSTREAM EN BYTES[]
            ByteArrayOutputStream bos = new ByteArrayOutputStream();
            byte[] tmp = new byte[4096];
            int ret = 0;

            while((ret = inputStream1.read(tmp)) > 0)
            {
                bos.write(tmp, 0, ret);
            }

             firma = bos.toByteArray();
            //./CONVIERTE INPUTSTREAM EN BYTES[]
        }	
        //InputStream inputStream2 = null; // input stream of the upload file
        byte[] huella = null;
        
        Part filePart2 = request.getPart("txtHuella");
        
        System.out.println("Archivo File :"+filePart2);	        
       /* if (filePart2 != null) {
            //prints out some information for debugging
          // System.out.println(filePart.getName());
           //System.out.println(filePart.getSize());
            //System.out.println(filePart.getContentType());
             
            // obtains input stream of the upload file
            inputStream2 = filePart2.getInputStream();
            System.out.println("Salio esto : "+inputStream2);
            //CONVIERTE INPUTSTREAM EN BYTES[]
            ByteArrayOutputStream bos = new ByteArrayOutputStream();
            byte[] tmp = new byte[4096];
            int ret = 0;

            while((ret = inputStream2.read(tmp)) > 0)
            {
                bos.write(tmp, 0, ret);
            }

             huella = bos.toByteArray();
            //./CONVIERTE INPUTSTREAM EN BYTES[]
        }	*/
        
			System.out.println("en bytes creo :"+foto);
			dao=fabrica.getPersona();
			Persona emp = new Persona();
			System.out.println(" Sexo : " + sexo);
			emp.setnDNI(nDNI);
			emp.setNombre(nombre);
			emp.setApeP(apellidoP);
			emp.setApeM(apellidoM);
			emp.setSexo(sexo);
			emp.setFechaNac(fechaN);
			emp.setTelefono(fono);
			emp.setDireccion(direccion);
			emp.setEmail(email);
			emp.setFoto(foto);
			emp.setFirma(firma);
			emp.setHuella(huella);
			emp.setIdDistrito(distrito);
			try {
				dao.modificaPersona(emp);
				System.out.println("Codigo" + emp.getnDNI());
			} catch (Exception e) {
				e.printStackTrace();
			}		
		
			listarPersona(request, response);
	}
	protected void eliminarPersona(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cod= request.getParameter("id");
		System.out.println(cod);
		try {
			dao=fabrica.getPersona();
			dao.eliminaPersona(cod);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		listarPersona(request, response);
	}

}
