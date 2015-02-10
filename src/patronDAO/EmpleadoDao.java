package patronDAO;

import java.sql.SQLException;
import java.util.List;

import entidad.Empleado;

public interface EmpleadoDao {

	public Empleado validaEmpleado(String usu, String pas) throws SQLException;
	public int registraEmpleado(Empleado e);
	public int modificaEmpleado(Empleado e) throws SQLException;
	public int eliminaEmpleado(String codigo) throws SQLException;
	public List<Empleado> listaEmpleado() throws SQLException;
	public Empleado EmpleadoxCodigo(String codigo) throws SQLException;
}
