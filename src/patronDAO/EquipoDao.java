package patronDAO;

import java.sql.SQLException;


import java.util.ArrayList;
import java.util.List;

import com.lowagie.text.pdf.ArabicLigaturizer;

import entidad.Cargo;
import entidad.Equipo;
import entidad.ListaCargoEquipo;
import entidad.ListadoEquipo;
import entidad.ListadoUnidad;
import entidad.Rol;
import entidad.UnidadOrganica;

public interface EquipoDao {
	
	public int registrarEquipo( Equipo equipo, ArrayList<ListaCargoEquipo> arrayList) throws SQLException;
	public int modificarEquipo( Equipo equipo, ArrayList<ListaCargoEquipo> arrayList) throws SQLException;
	public String eliminarEquipo(String idEquipo) throws SQLException;
	public ArrayList<ListadoEquipo> listarEquipo() throws SQLException;
	public ListadoEquipo listarEquipoXcodigo(String idEquipo) throws SQLException;
	public ArrayList<ListaCargoEquipo> listarCargoxEquipo(String idEquipo) throws SQLException;
	public int eliminaCargo(String idCargo) throws SQLException;
}