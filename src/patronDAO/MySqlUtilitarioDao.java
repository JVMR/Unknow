package patronDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.ConexionDB;
import entidad.Utilitario;

public class MySqlUtilitarioDao implements UtilitarioDao{

	@Override
	public Utilitario listaUtil(String codigo) {
		Connection conn= null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		Utilitario obj = null;
		try {
			conn = new ConexionDB().getConexion();
			String sql ="call SP_EXISTE_LES(?)";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, codigo);
			rs = pstm.executeQuery();
			while(rs.next()){
				obj = new Utilitario();
				obj.setClase(rs.getString(1));
				obj.setIcono(rs.getString(2));
				obj.setContenido(rs.getString(3));
				obj.setEstado(rs.getString(4));
				obj.setFlag(rs.getString(5));
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

}
