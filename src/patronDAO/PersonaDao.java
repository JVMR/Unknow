package patronDAO;

import java.sql.SQLException;
import java.util.List;

import entidad.Persona;

public interface PersonaDao {

	public int registraPersona(Persona e);
	public int modificaPersona(Persona e) throws SQLException;
	public int eliminaPersona(String codigo) throws SQLException;
	public List<Persona> listaPersona() throws SQLException;
	public Persona PersonaxCodigo(String codigo) throws SQLException;
}
