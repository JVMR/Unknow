package patronDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.ConexionDB;
import entidad.Menu;
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

	@Override
	public Menu listaMenu(String cargo) {
		Connection conn= null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		Menu obj = null;
		try {
			conn = new ConexionDB().getConexion();
			String sql ="call SP_LISTAROL(?)";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, cargo);
			rs = pstm.executeQuery();
			while(rs.next()){
				obj = new Menu();
				obj.setgLES(rs.getString(1));
				obj.setgRES(rs.getString(2));
				obj.seteLES(rs.getString(3));
				obj.seteRES(rs.getString(4));
				obj.setVsrRES(rs.getString(5));
				obj.setlLES(rs.getString(6));
				obj.setlRES(rs.getString(7));
				obj.setMant(rs.getString(8));
				obj.setRprt(rs.getString(9));
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
