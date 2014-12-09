package patronDAO;

import java.sql.SQLException;

import entidad.Usuario;

public interface UsuarioDao {

	public Usuario valida(String usu, String pas) throws SQLException;
	
}
