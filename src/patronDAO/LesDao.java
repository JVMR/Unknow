package patronDAO;

import java.sql.SQLException;
import java.util.List;

import entidad.Les;

public interface LesDao {

	public List<Les> listaLes() throws SQLException;
	public int ingresaLes(Les obj);
	public Les LesxCodigo(String codigo) throws SQLException;
	public int ActualizaEstado(Les l) throws SQLException;
	
}
