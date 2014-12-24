package patronDAO;

import java.sql.SQLException;

import entidad.Usuario;

public interface UsuarioDao {

	public Usuario validaUsuario(String usu, String pas) throws SQLException;
	
}
