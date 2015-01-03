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

}
