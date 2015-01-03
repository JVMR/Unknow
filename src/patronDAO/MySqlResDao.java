package patronDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;

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
			String sql ="CALL SP_REGISTRARES(?,?,?,?,?,?,?,?)";
			pstm = conn.prepareStatement(sql);	
			pstm.setString(1, r.getReferencia());
			pstm.setString(2, r.getDescriptor());
			pstm.setString(3, r.getObjetoConsulta());
			pstm.setString(4, r.getAnalisis());
			pstm.setString(5, r.getFechaGenerado());
			pstm.setString(6, r.getIdLes());
			pstm.setString(7, r.getIdEstado());
			pstm.setString(8, r.getIdAsalariado());
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

	
	
}
