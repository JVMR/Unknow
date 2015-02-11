package patronDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.ConexionDB;
import entidad.Res;

public class MySqlResDao implements ResDao{

	@Override
	public int registraRes(Res r) {
		Connection conn= null;
		PreparedStatement pstm = null;		
		
		int salida=-1;
		try {
			conn = new ConexionDB().getConexion();
			String sql ="CALL SP_REGISTRARES(?,?,?,?,?,?,?)";
			pstm = conn.prepareStatement(sql);	
			pstm.setString(1, r.getReferencia());
			pstm.setString(2, r.getDescriptor());
			pstm.setString(3, r.getObjetoConsulta());
			pstm.setString(4, r.getAnalisis());
			pstm.setString(5, r.getFechaGenerado());
			pstm.setString(6, r.getIdLes());
			pstm.setString(7, r.getIdAsalariado());
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
	public Res ResxCodigo(String codigo) throws SQLException {
		Connection conn= null;
		PreparedStatement pstm = null;
		ResultSet rs = null;	
		Res obj =  null;
		try {
			conn = new ConexionDB().getConexion();
			String sql ="CALL SP_LISTARESxCODIGO(?)";
			pstm = conn.prepareStatement(sql);	
			pstm.setString(1, codigo);	
			rs = pstm.executeQuery();
			while(rs.next()){
				obj = new Res();
				obj.setIdRes(rs.getString(1));
				obj.setReferencia(rs.getString(2));
				obj.setDescriptor(rs.getString(3));
				obj.setObjetoConsulta(rs.getString(4));
				obj.setAnalisis(rs.getString(5));
				obj.setFechaGenerado(rs.getString(6));
				obj.setIdLes(rs.getString(7));
				obj.setIdAsalariado(rs.getString(8));
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
	public List<Res> ResxRangoFecha(String fecha1, String fecha2, String idEstado)
			throws SQLException {
		Connection conn= null;
		PreparedStatement pstm = null;
		ResultSet rs = null;	
		List<Res> data= new ArrayList<Res>();
		Res obj =  null;
		try {
			conn = new ConexionDB().getConexion();
			String sql ="CALL SP_LISTARESxFECHAS(?,?,?)";
			pstm = conn.prepareStatement(sql);	
			pstm.setString(1, fecha1);
			pstm.setString(2, fecha2);
			pstm.setString(3, idEstado);
			rs = pstm.executeQuery();
			while(rs.next()){
				obj = new Res();
				obj.setIdRes(rs.getString(1));
				obj.setReferencia(rs.getString(2));
				obj.setDescriptor(rs.getString(3));
				obj.setObjetoConsulta(rs.getString(4));
				obj.setAnalisis(rs.getString(5));
				obj.setFechaGenerado(rs.getString(6));
				obj.setIdLes(rs.getString(7));
				obj.setIdEstado(rs.getString(8));
				obj.setIdAsalariado(rs.getString(9));
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
	public int modificaRes(Res r) throws SQLException {
		Connection conn= null;
		PreparedStatement pstm = null;
		ResultSet rs = null;		
		int salida=-1;
		try {
			conn = new ConexionDB().getConexion();
			String sql ="CALL SP_ACTUALIZARRES(?,?,?)";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, r.getIdRes());
			pstm.setString(2, r.getObjetoConsulta());
			pstm.setString(3, r.getAnalisis());
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
