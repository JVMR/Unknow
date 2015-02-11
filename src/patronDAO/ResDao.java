package patronDAO;

import java.sql.SQLException;
import java.util.List;

import entidad.Res;

public interface ResDao {

	public int registraRes(Res r);
	public int modificaRes(Res r) throws SQLException;
	public Res ResxCodigo(String codigo) throws SQLException;
	public List<Res> ResxRangoFecha(String fecha1, String fecha2, String idEstado) throws SQLException;
	
}
