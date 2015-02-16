package patronDAO;

import java.sql.SQLException;
import java.util.List;

import entidad.Les;

public interface LesDao {

	public List<Les> listaLes() throws SQLException;
	public List<Les> evLes() throws SQLException;
	public int ingresaLes(Les obj);
	public int modificarLes(Les obj);
	public Les LesxCodigo(String codigo) throws SQLException;
	public Les listaLesxEstado(String estado) throws SQLException;
	public int ActualizaEstado(Les l) throws SQLException;
	public List<Les> listaLesxCodigo(String codigo) throws SQLException;
	public void modificaErrorLes(Les obj) throws SQLException;
}
