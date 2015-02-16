package patronDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.ConexionDB;
import entidad.Les;

public class MySqlLesDao implements LesDao {

	@Override
	public List<Les> listaLes() throws SQLException {
		Connection conn= null;
		PreparedStatement pstm = null;
		ResultSet rs = null;	
		List<Les> data= new ArrayList<Les>();
		Les obj =  null;
		try {
			conn = new ConexionDB().getConexion();
			String sql ="CALL SP_LISTALES()";
			pstm = conn.prepareStatement(sql);					
			rs = pstm.executeQuery();
			while(rs.next()){
				obj = new Les();
				obj.setIdLes(rs.getString(1));
				obj.setDiagnostico(rs.getString(2));
				obj.setFechaInicioDes(rs.getString(3));
				obj.setFechaFinDes(rs.getString(4));
				obj.setMotivoLicencia(rs.getString(5));
				obj.setDescripcionMotivo(rs.getString(6));
				obj.setFechaHora(rs.getString(7));
				obj.setIdEmpleado(rs.getString(8));
				obj.setIdEstado(rs.getString(9));				
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
	public int ingresaLes(Les e) {
		Connection conn= null;
		PreparedStatement pstm = null;	
		
		int salida=-1;
		try {
			conn = new ConexionDB().getConexion();
			String sql ="CALL SP_GENERAR_LES(?,?,?,?,?,?,?,?,?,?)";
			pstm = conn.prepareStatement(sql);	
			pstm.setString(1, e.getDiagnostico());
			pstm.setString(2, e.getFechaInicioDes());
			pstm.setString(3, e.getFechaFinDes());
			pstm.setInt(4, e.getCantidad());
			pstm.setBytes(5, e.getDocumento());
			pstm.setString(6, e.getMotivoLicencia());
			pstm.setString(7, e.getDescripcionMotivo());
			pstm.setString(8, e.getFechaHora());
			pstm.setString(9, e.getIdEmpleado());
			pstm.setString(10, e.getPdf());
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
	public Les LesxCodigo(String codigo) throws SQLException {
		Connection conn= null;
		PreparedStatement pstm = null;
		ResultSet rs = null;	
		Les obj =  null;
		try {
			conn = new ConexionDB().getConexion();
			String sql ="CALL SP_LESxCODIGO(?)";
			pstm = conn.prepareStatement(sql);	
			pstm.setString(1, codigo);	
			rs = pstm.executeQuery();
			while(rs.next()){
				obj = new Les();
				obj.setIdLes(rs.getString(1));
				obj.setDiagnostico(rs.getString(2));
				obj.setFechaInicioDes(rs.getString(3));
				obj.setFechaFinDes(rs.getString(4));
				obj.setMotivoLicencia(rs.getString(5));
				obj.setDescripcionMotivo(rs.getString(6));
				obj.setFechaHora(rs.getString(7));
				obj.setIdEmpleado(rs.getString(8));
				obj.setNomEmpleado(rs.getString(9));
				obj.setPdf(rs.getString(10));
				obj.setCantidad(rs.getInt(11));
				obj.setError(rs.getString(12));
				System.out.println("Autores : Jvan, Romario, Javier, Miguel");
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

	@Override
	public int ActualizaEstado(Les l) throws SQLException {
		Connection conn= null;
		PreparedStatement pstm = null;
		ResultSet rs = null;		
		int salida=-1;
		try {
			conn = new ConexionDB().getConexion();
			String sql ="CALL SP_ACTUALIZARLES(?,?)";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, l.getIdLes());
			pstm.setString(2, l.getIdEstado());
			salida=pstm.executeUpdate();
			System.out.println("Autores : Jvan, Romario, Javier, Miguel");
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
	public List<Les> listaLesxCodigo(String codigo) throws SQLException {
		Connection conn= null;
		PreparedStatement pstm = null;
		ResultSet rs = null;	
		List<Les> data= new ArrayList<Les>();
		Les obj =  null;
		try {
			conn = new ConexionDB().getConexion();
			String sql ="CALL SP_LISTALESXCODIGO(?)";
			pstm = conn.prepareStatement(sql);		
			pstm.setString(1, codigo);
			rs = pstm.executeQuery();
			while(rs.next()){
				obj = new Les();
				obj.setIdLes(rs.getString(1));
				obj.setDiagnostico(rs.getString(2));
				obj.setFechaInicioDes(rs.getString(3));
				obj.setFechaFinDes(rs.getString(4));
				obj.setMotivoLicencia(rs.getString(5));
				obj.setDescripcionMotivo(rs.getString(6));
				obj.setFechaHora(rs.getString(7));
				obj.setIdEmpleado(rs.getString(8));
				obj.setIdEstado(rs.getString(9));				
				data.add(obj);
				System.out.println("Autores : Jvan, Romario, Javier, Miguel");
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
	public Les listaLesxEstado(String estado) {
		Connection conn= null;
		PreparedStatement pstm = null;
		ResultSet rs = null;	
		Les obj =  null;
		try {
			conn = new ConexionDB().getConexion();
			String sql ="CALL SP_LISTAR_LESXESTADO(?)";
			pstm = conn.prepareStatement(sql);		
			pstm.setString(1, estado);
			rs = pstm.executeQuery();
			while(rs.next()){
				obj = new Les();
				obj.setIdLes(rs.getString(1));
				obj.setDiagnostico(rs.getString(2));
				obj.setFechaInicioDes(rs.getString(3));
				obj.setFechaFinDes(rs.getString(4));
				obj.setCantidad(rs.getInt(5));
				obj.setMotivoLicencia(rs.getString(6));
				obj.setDescripcionMotivo(rs.getString(7));
				obj.setError(rs.getString(8));
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

	@Override
	public int modificarLes(Les e) {
		Connection conn= null;
		PreparedStatement pstm = null;			
		int salida=-1;
		try {
			conn = new ConexionDB().getConexion();
			String sql ="CALL SP_MODIFICAR_LES(?,?,?,?,?,?,?,?)";
			pstm = conn.prepareStatement(sql);	
			pstm.setString(1, e.getIdLes());
			pstm.setString(2, e.getDiagnostico());
			pstm.setString(3, e.getFechaInicioDes());
			pstm.setString(4, e.getFechaFinDes());
			pstm.setInt(5, e.getCantidad());
			pstm.setString(6, e.getMotivoLicencia());
			pstm.setString(7, e.getDescripcionMotivo());
			pstm.setString(8, e.getFechaHora());	
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
	public List<Les> evLes() throws SQLException {
		Connection conn= null;
		PreparedStatement pstm = null;
		ResultSet rs = null;	
		List<Les> data= new ArrayList<Les>();
		Les obj =  null;
		try {
			conn = new ConexionDB().getConexion();
			String sql ="CALL SP_LISTAR_LESX2ESTADOS ()";
			pstm = conn.prepareStatement(sql);					
			rs = pstm.executeQuery();
			while(rs.next()){
				obj = new Les();
				obj.setIdLes(rs.getString(1));
				obj.setDiagnostico(rs.getString(2));
				obj.setFechaInicioDes(rs.getString(3));
				obj.setFechaFinDes(rs.getString(4));
				obj.setMotivoLicencia(rs.getString(5));
				obj.setDescripcionMotivo(rs.getString(6));
				obj.setFechaHora(rs.getString(7));
				obj.setIdEmpleado(rs.getString(8));
				obj.setIdEstado(rs.getString(9));				
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
	public void modificaErrorLes(Les obj) throws SQLException {
		Connection conn= null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		try {
			conn = new ConexionDB().getConexion();
			String sql ="CALL SP_ERRORLES(?,?)";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, obj.getIdLes());
			pstm.setString(2, obj.getError());
			pstm.executeUpdate();
			System.out.println("Se lleno este dato : "+obj.getError());
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
		
		
	}
}
