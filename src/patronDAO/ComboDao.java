
package patronDAO;

import java.util.ArrayList;

import entidad.Combo;

public interface ComboDao {
	public ArrayList<Combo> lista (String sql) throws Exception;
}

