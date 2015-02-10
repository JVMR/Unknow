package patronDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.ConexionDB;
import entidad.Cargo;

public class MySqlCargoDao implements CargoDao{

	@Override
	public Cargo listaCargoxNombre(String nombre) {
		Connection conn= null;
		PreparedStatement pstm = null;
		ResultSet rs = null;	
		Cargo obj =  null;
		try {
			conn = new ConexionDB().getConexion();
			String sql ="CALL SP_LISTACARGOXNOMBRE(?)";
			pstm = conn.prepareStatement(sql);	
			pstm.setString(1, nombre);	
			rs = pstm.executeQuery();
			while(rs.next()){
				obj = new Cargo();
				obj.setIdCargo(rs.getString(1));
				obj.setSueldo(rs.getDouble(2));
				obj.setNombreCargo(rs.getString(3));
				obj.setIdRol(rs.getString(4));
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
