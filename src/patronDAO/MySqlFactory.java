package patronDAO;

public class MySqlFactory extends Factory{

	@Override
	public UsuarioDao getUsuario() {
		// TODO Auto-generated method stub
		return new MySqlUsuarioDao();
	}

	
	
}
