package patronDAO;

public class MySqlFactory extends Factory{

	@Override
	public EmpleadoDao getEmpleado() {
		// TODO Auto-generated method stub
		return new MySqlEmpleadoDao();
	}

	@Override
	public UnidadOrganicaDao getUnidadOrganica() {
		// TODO Auto-generated method stub
		return new MySqlUnidadOrganicaDao();
	}

	@Override
	public ComboDao getCombo() {
		// TODO Auto-generated method stub
		return new MySqlComboDao();
	}

	@Override

	public PersonaDao getPersona() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public CargoDao getCargo() {
		// TODO Auto-generated method stub
		return new MySqlCargoDao();
	}

	public EquipoDao getEquipo() {
		// TODO Auto-generated method stub
		return new MySqlEquipoDao();
	}


	@Override
	public LesDao getLes() {
		// TODO Auto-generated method stub
		return new MySqlLesDao();
	}

	@Override
	public ResDao getRes() {
		// TODO Auto-generated method stub
		return new MySqlResDao();

	}


	
	
}
