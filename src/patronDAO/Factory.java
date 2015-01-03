package patronDAO;

public abstract class Factory {

	public static final int TIPO_MYSQL =1;
	public static final int TIPO_SQL_SERVER =2;
	
	
	public abstract EmpleadoDao getEmpleado();
	public abstract UnidadOrganicaDao getUnidadOrganica();
	public abstract ComboDao getCombo();

	public abstract EquipoDao getEquipo();

	public abstract PersonaDao getPersona();
	public abstract CargoDao getCargo();

	public abstract LesDao getLes();
	public abstract ResDao getRes();

	
	public static Factory getTipo(int tipo){
		switch (tipo) {
		case TIPO_MYSQL:
			return new MySqlFactory();
		case TIPO_SQL_SERVER:
			return new SqlServerFactory();
		}
		
		return null;
	}
	
}
