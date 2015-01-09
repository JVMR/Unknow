package patronDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.ConexionDB;
import entidad.Empleado;

public class MySqlEmpleadoDao implements EmpleadoDao {

	@Override
	public Empleado validaEmpleado(String usu, String pas) throws SQLException {
		Connection conn= null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		Empleado obj = null;
		try {
			conn = new ConexionDB().getConexion();
			String sql ="call SP_VALIDAUSUARIO(?,?)";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, usu);
			pstm.setString(2, pas);
			rs = pstm.executeQuery();
			while(rs.next()){
				obj = new Empleado();
				obj.setIdEmpleado(rs.getString(1));
				obj.setnDNI(rs.getString(2));
				obj.setNombresEmpleado(rs.getString(3));
				obj.setApellidoPaterno(rs.getString(4));
				obj.setFechaNacimiento(rs.getString(5));
				obj.setTelefono(rs.getString(6));
				obj.setNumeroSeguroSocial(rs.getString(7));
				obj.setIdCargo(rs.getString(8));
				obj.setFoto(rs.getBytes(9));
				obj.setFechaIngreso(rs.getString(10));
				obj.setUsuario(rs.getString(11));
				obj.setPsswrd(rs.getString(12));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			try {
				if(rs!= null) rs.close();
				if(pstm!= null) pstm.close();
				if(conn!= null) conn.close();
			} catch (Exception e2) {
			}
		}
		
		return obj;
	}

	@Override
	public int registraEmpleado(Empleado e){
		Connection conn= null;
		PreparedStatement pstm = null;		
		
		int salida=-1;
		try {
			conn = new ConexionDB().getConexion();
			String sql ="CALL SP_REGISTRAEMPLEADO(?,?,?,?,?,?,?,?,?,?,?,?,?)";
			pstm = conn.prepareStatement(sql);	
			pstm.setString(1, e.getnDNI());
			pstm.setString(2, e.getNombresEmpleado());
			pstm.setString(3, e.getApellidoPaterno());
			pstm.setString(4, e.getApellidoMaterno());
			pstm.setString(5, e.getFechaNacimiento());
			pstm.setString(6, e.getTelefono());
			pstm.setString(7, e.getNumeroSeguroSocial());
			pstm.setString(8, e.getIdCargo());
			pstm.setString(9, e.getIdEstado());			
			pstm.setBytes(10, e.getFoto());
			pstm.setString(11, e.getFechaIngreso());
			pstm.setString(12, e.getUsuario());
			pstm.setString(13, e.getPsswrd());
			salida=pstm.executeUpdate();
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally{
			try {
				if(pstm!= null) pstm.close();
				if(conn!= null) conn.close();
			} catch (Exception e2) {
			}
		}
		
		return salida;
	}

	@Override
	public int modificaEmpleado(Empleado e) throws SQLException {
		Connection conn= null;
		PreparedStatement pstm = null;
		ResultSet rs = null;		
		int salida=-1;
		try {
			conn = new ConexionDB().getConexion();
			String sql ="CALL SP_ACTUALIZAEMPLEADO(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, e.getIdEmpleado());
			pstm.setString(2, e.getnDNI());
			pstm.setString(3, e.getNombresEmpleado());
			pstm.setString(4, e.getApellidoPaterno());
			pstm.setString(5, e.getApellidoMaterno());
			pstm.setString(6, e.getFechaNacimiento());
			pstm.setString(7, e.getTelefono());
			pstm.setString(8, e.getNumeroSeguroSocial());
			pstm.setString(9, e.getIdCargo());
			pstm.setString(10, e.getIdEstado());
			pstm.setBytes(11, e.getFoto());
			pstm.setString(12, e.getFechaIngreso());
			pstm.setString(13, e.getUsuario());
			pstm.setString(14, e.getPsswrd());
			salida=pstm.executeUpdate();
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally{
			try {
				if(rs!= null) rs.close();
				if(pstm!= null) pstm.close();
				if(conn!= null) conn.close();
			} catch (Exception e2) {
			}
		}
		
		return salida;
	}

	@Override
	public int eliminaEmpleado(String codigo) throws SQLException {
		Connection conn= null;
		PreparedStatement pstm = null;
		ResultSet rs = null;		
		int salida=-1;
		try {
			conn = new ConexionDB().getConexion();
			String sql ="CALL SP_ELIMINAEMPLEADO(?)";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, codigo);			
			salida=pstm.executeUpdate();
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally{
			try {
				if(rs!= null) rs.close();
				if(pstm!= null) pstm.close();
				if(conn!= null) conn.close();
			} catch (Exception e2) {
			}
		}
		
		return salida;
	}

	@Override
	public List<Empleado> listaEmpleado() throws SQLException {
		Connection conn= null;
		PreparedStatement pstm = null;
		ResultSet rs = null;	
		List<Empleado> data= new ArrayList<Empleado>();
		Empleado obj =  null;
		try {
			conn = new ConexionDB().getConexion();
			String sql ="CALL SP_LISTAEMPLEADO()";
			pstm = conn.prepareStatement(sql);					
			rs = pstm.executeQuery();
			while(rs.next()){
				obj = new Empleado();
				obj.setIdEmpleado(rs.getString(1));
				obj.setnDNI(rs.getString(2));
				obj.setNombresEmpleado(rs.getString(3));
				obj.setFechaNacimiento(rs.getString(4));
				obj.setTelefono(rs.getString(5));
				obj.setNumeroSeguroSocial(rs.getString(6));
				obj.setIdCargo(rs.getString(7));
				obj.setIdEstado(rs.getString(8));
				obj.setFoto(rs.getBytes(9));
				obj.setFechaIngreso(rs.getString(10));
				obj.setUsuario(rs.getString(11));
				obj.setPsswrd(rs.getString(12));				
				data.add(obj);
			}	
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally{
			try {
				if(rs!= null) rs.close();
				if(pstm!= null) pstm.close();
				if(conn!= null) conn.close();
			} catch (Exception e2) {
			}
		}
		
		return data;
	}

	@Override
	public Empleado EmpleadoxCodigo(String codigo) throws SQLException {
		Connection conn= null;
		PreparedStatement pstm = null;
		ResultSet rs = null;	
		Empleado obj =  null;
		try {
			conn = new ConexionDB().getConexion();
			String sql ="CALL SP_LISTAEMPLEADOxCODIGO(?)";
			pstm = conn.prepareStatement(sql);	
			pstm.setString(1, codigo);	
			rs = pstm.executeQuery();
			while(rs.next()){
				obj = new Empleado();
				obj.setIdEmpleado(rs.getString(1));
				obj.setnDNI(rs.getString(2));
				obj.setNombresEmpleado(rs.getString(3));
				obj.setApellidoPaterno(rs.getString(4));
				obj.setApellidoMaterno(rs.getString(5));
				obj.setFechaNacimiento(rs.getString(6));
				obj.setTelefono(rs.getString(7));
				obj.setNumeroSeguroSocial(rs.getString(8));
				obj.setIdCargo(rs.getString(9));
				obj.setIdEstado(rs.getString(10));				
				obj.setFechaIngreso(rs.getString(11));
				obj.setUsuario(rs.getString(12));
				obj.setPsswrd(rs.getString(13));
				}	
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally{
			try {
				if(rs!= null) rs.close();
				if(pstm!= null) pstm.close();
				if(conn!= null) conn.close();
			} catch (Exception e2) {
			}
		}
		
		return obj;
	}
	


	
}
