package patronDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import util.ConexionDB;
import entidad.Usuario;

public class MySqlUsuarioDao implements UsuarioDao {

	@Override
	public Usuario validaUsuario(String usu, String pas) throws SQLException {
		Connection conn= null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		Usuario obj = null;
		try {
			conn = new ConexionDB().getConexion();
			String sql ="call SP_VALIDAUSUARIO(?,?)";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, usu);
			pstm.setString(2, pas);
			rs = pstm.executeQuery();
			while(rs.next()){
				obj = new Usuario();
				obj.setIdEmpleado(rs.getString("idEmpleado"));
				obj.setNombresEmpleado(rs.getString("nombresEmpleado"));
				obj.setApellidoPaterno(rs.getString("apellidoPaterno"));
				obj.setUsuario(rs.getString("usuario"));
				obj.setPsswrd(rs.getString("psswrd"));
				obj.setIdCargo(rs.getString("idCargo"));
				obj.setFoto(rs.getString("foto"));
				obj.setFechaIngresoEmpleo(rs.getString("fechaIngresoLaboral"));
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
