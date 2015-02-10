package patronDAO;

import entidad.Menu;
import entidad.Utilitario;

public interface UtilitarioDao {

	public Utilitario listaUtil(String codigo);
	public Menu listaMenu(String cargo);
}
