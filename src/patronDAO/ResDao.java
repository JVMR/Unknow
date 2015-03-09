package patronDAO;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entidad.Asalariado_RES;
import entidad.Empleado;
import entidad.Res;

public interface ResDao {

	public int registraRes(Res r);
	public int modificaRes(Res r) throws SQLException;
	public Res ResxCodigo(String codigo) throws SQLException;
	public List<Res> ResxRangoFecha(String fecha1, String fecha2, String idEstado) throws SQLException;
	//Romario
	public ArrayList<Res> listarVisaRES () throws SQLException;
	public int actualizaEstado(String idRES,String idAprobador,int idEstado,String pdf,String fecha) throws SQLException;
	public String verificaPersonaMYSQL(String idUsuario, String dni) throws SQLException;
	public String verificarFirma(String dni, String contraseña) throws SQLException; 
	
	public Empleado buscaDNI(String idRES) throws SQLException;
	public String obtengoFirma02(String dni) throws SQLException;
	
}
