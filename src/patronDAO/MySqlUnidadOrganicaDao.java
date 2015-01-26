package patronDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.ConexionDB;
import entidad.Cargo;
import entidad.ListadoUnidad;
import entidad.Rol;
import entidad.UnidadOrganica;

public class MySqlUnidadOrganicaDao implements UnidadOrganicaDao{

	@Override
	public int registrarUnidadOrganica(UnidadOrganica unidadOrganica,
			Cargo cargo, Rol rol) throws SQLException {
		
		Connection conn= null;
		PreparedStatement pstm = null;		
		
		int salida=-1;
		try {
			conn = new ConexionDB().getConexion();
			String sql ="CALL SP_REGISTRA_UNIDADORGANICA(?,?,?,?,?,?,?,?,?,?,?,?,?)";
			pstm = conn.prepareStatement(sql);	
			pstm.setString(1, unidadOrganica.getDescripcionUnidad());
			pstm.setString(2, unidadOrganica.getNombreUnidad());
			pstm.setString(3, cargo.getNombreCargo());
			pstm.setDouble(4, cargo.getSueldo());
			pstm.setInt(5, rol.getGestionarLES());
			pstm.setInt(6, rol.getGestionarRES());
			pstm.setInt(7, rol.getVerificarLES());
			pstm.setInt(8, rol.getVerificarRES());
			pstm.setInt(9, rol.getVisarRES());
			pstm.setInt(10, rol.getListarLES());
			pstm.setInt(11, rol.getListarRES());
			pstm.setInt(12, rol.getMantenimiento());
			pstm.setInt(13, rol.getReporte());
			
			salida=pstm.executeUpdate();
			
		} catch (Exception ex) {
			System.out.println(ex);
			ex.printStackTrace();
		} finally{
			try {
				if(pstm!= null) pstm.close();
				if(conn!= null) conn.close();
			} catch (Exception e2) {
				System.out.println(e2);
			}
		}
		
		return salida;
	}

	@Override
	public int modificarUnidadOrganica(UnidadOrganica unidadOrganica,
			Cargo cargo,Rol rol) throws SQLException {
		Connection conn= null;
		PreparedStatement pstm = null;		
		
		int salida=-1;
		try {
			conn = new ConexionDB().getConexion();
			String sql ="CALL SP_MODIFICA_UNIDADORGANICA(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			pstm = conn.prepareStatement(sql);	
			pstm.setString(1, unidadOrganica.getIdUnidadOrganica());
			pstm.setString(2, unidadOrganica.getDescripcionUnidad());
			pstm.setString(3, unidadOrganica.getNombreUnidad());
			pstm.setString(4, cargo.getIdCargo());
			pstm.setString(5, cargo.getNombreCargo());
			pstm.setDouble(6, cargo.getSueldo());
			pstm.setInt(7, rol.getGestionarLES());
			pstm.setInt(8, rol.getGestionarRES());
			pstm.setInt(9, rol.getVerificarLES());
			pstm.setInt(10, rol.getVerificarRES());
			pstm.setInt(11, rol.getVisarRES());
			pstm.setInt(12, rol.getListarLES());
			pstm.setInt(13, rol.getListarRES());
			pstm.setInt(14, rol.getMantenimiento());
			pstm.setInt(15, rol.getReporte());
			
			salida=pstm.executeUpdate();
			
		} catch (Exception ex) {
			System.out.println(ex);
			ex.printStackTrace();
		} finally{
			try {
				if(pstm!= null) pstm.close();
				if(conn!= null) conn.close();
			} catch (Exception e2) {
				System.out.println(e2);
			}
		}
		return salida;
	}

	@Override
	public String eliminarUnidadOrganica(String idunidadOrganica, String idcargo)
			throws SQLException {
		Connection conn= null;
		PreparedStatement pstm = null;
		ResultSet rs = null;		
		String mensaje="";
		try {
			conn = new ConexionDB().getConexion();
			String sql ="select F_ELIMINAUNIDAORGANICA(?,?)";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, idunidadOrganica);	
			pstm.setString(2, idcargo);
			
			rs=pstm.executeQuery();
			rs.next();
			mensaje=rs.getString(1);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally{
			try {
				if(rs!= null) rs.close();
				if(pstm!= null) pstm.close();
				if(conn!= null) conn.close();
			} catch (Exception e2) {
			}
		}
		
		return mensaje;
	}

	@Override
	public List<ListadoUnidad> listarUnidadOrganica() throws SQLException {
		Connection conn= null;
		PreparedStatement pstm = null;
		ResultSet rs = null;	
		List<ListadoUnidad> data= new ArrayList<ListadoUnidad>();
		ListadoUnidad obj =  null;
		try {
			conn = new ConexionDB().getConexion();
			String sql ="CALL SP_LISTA_UNIDADORGANICA()";
			pstm = conn.prepareStatement(sql);					
			rs = pstm.executeQuery();
			while(rs.next()){
				obj = new ListadoUnidad();
				obj.setIdUnidadOrganica(rs.getString(1));
				obj.setNombreUnidad(rs.getString(2));
				obj.setDescripcionUnidad(rs.getString(3));
				obj.setIdCargo(rs.getString(4));
				obj.setNombreCargo(rs.getString(5));
				obj.setIdRol(rs.getString(6));
				obj.setNumEquipos(rs.getInt(7));
				
				data.add(obj);
			}	
		} catch (Exception ex) {
			System.out.println(ex);
			ex.printStackTrace();
		} finally{
			try {
				if(rs!= null) rs.close();
				if(pstm!= null) pstm.close();
				if(conn!= null) conn.close();
			} catch (Exception e2) {
				System.out.println(e2);
				e2.printStackTrace();
			}
		}
		
		return data;
	}

	@Override
	public ListadoUnidad listarUnidadOrganicaXcodigo(String idUnidad)
			throws SQLException {
		Connection conn= null;
		PreparedStatement pstm = null;
		ResultSet rs = null;	
		
		ListadoUnidad obj =  null;
		try {
			conn = new ConexionDB().getConexion();
			String sql ="CALL SP_LISTA_UNIDADORGANICAxCODIGO(?)";
			pstm = conn.prepareStatement(sql);	
			pstm.setString(1, idUnidad);
			rs = pstm.executeQuery();
			while(rs.next()){
				obj = new ListadoUnidad();
				obj.setIdUnidadOrganica(rs.getString(1));
				obj.setNombreUnidad(rs.getString(2));
				obj.setDescripcionUnidad(rs.getString(3));
				obj.setIdCargo(rs.getString(4));
				obj.setNombreCargo(rs.getString(5));
				obj.setSueldo(rs.getDouble(6));
				obj.setGestionarLES(rs.getInt(7));
				obj.setGestionarRES(rs.getInt(8));
				obj.setVerificarLES(rs.getInt(9));
				obj.setVerificarRES(rs.getInt(10));
				obj.setVisarRES(rs.getInt(11));
				obj.setListarLES(rs.getInt(12));
				obj.setListarRES(rs.getInt(13));
				obj.setMantenimiento(rs.getInt(14));
				obj.setReporte(rs.getInt(15));
			
			}	
		} catch (Exception ex) {
			System.out.println(ex);
			ex.printStackTrace();
		} finally{
			try {
				if(rs!= null) rs.close();
				if(pstm!= null) pstm.close();
				if(conn!= null) conn.close();
			} catch (Exception e2) {
				System.out.println(e2);
				e2.printStackTrace();
			}
		}
		
		return obj;
	}


}