package patronDAO;

import java.sql.SQLException;


import java.util.List;

import entidad.Cargo;
import entidad.ListadoUnidad;
import entidad.Rol;
import entidad.UnidadOrganica;

public interface UnidadOrganicaDao {
	
	public int registrarUnidadOrganica(UnidadOrganica unidadOrganica, Cargo cargo, Rol rol) throws SQLException;
	public int modificarUnidadOrganica(UnidadOrganica unidadOrganica, Cargo cargo,Rol rol) throws SQLException;
	public String eliminarUnidadOrganica(String idunidadOrganica, String idcargo) throws SQLException;
	public List<ListadoUnidad> listarUnidadOrganica() throws SQLException;
	public ListadoUnidad listarUnidadOrganicaXcodigo(String idUnidad) throws SQLException;
}