package patronDAO;

import java.sql.SQLException;
import java.util.List;

import entidad.Les;

public interface LesDao {

	public List<Les> listaLes() throws SQLException;
	
}
