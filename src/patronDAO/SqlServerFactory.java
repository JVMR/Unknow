package patronDAO;

public class SqlServerFactory extends Factory{

	@Override
	public EmpleadoDao getEmpleado() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public UnidadOrganicaDao getUnidadOrganica() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ComboDao getCombo() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override

	public PersonaDao getPersona() {
		// TODO Auto-generated method stub
		return new SqlServerPersonaDao();
	}

	@Override
	public CargoDao getCargo() {
		return null;
	}

	public EquipoDao getEquipo() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public LesDao getLes() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ResDao getRes() {

		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public UtilitarioDao getUtilitario() {
		// TODO Auto-generated method stub
		return null;
	}


}
