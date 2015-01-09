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
			String sql ="CALL SP_GENERAR_LES(?,?,?,?,?,?,?,?,?)";
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
}
