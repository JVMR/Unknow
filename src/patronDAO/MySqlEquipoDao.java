package patronDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.taglibs.standard.tag.common.core.SetSupport;

import util.ConexionDB;
import entidad.Cargo;
import entidad.Empleado;
import entidad.Equipo;
import entidad.ListaCargoEquipo;
import entidad.ListadoEquipo;
import entidad.ListadoUnidad;

public class MySqlEquipoDao implements EquipoDao{

	@Override
	public int registrarEquipo(Equipo equipo,ArrayList<ListaCargoEquipo> arrayList) throws SQLException {
		
		int contador =-1;
		Connection conn= null;
		PreparedStatement pstm = null,pstm02=null,pstm03=null;
		ResultSet rs = null,rs02=null;		
		String idEquipo="";
		ArrayList<String> idCargo = new ArrayList<String>();
		
		try {
			conn = new ConexionDB().getConexion();
			
			conn.setAutoCommit(false);
			
			//se registra equipo y se recupera su id
			String sql ="select F_REGISTRA_EQUIPO(?,?,?)";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, equipo.getNombreEquipo());	
			pstm.setString(2, equipo.getIdUnidadOrganica());
			pstm.setString(3, equipo.getDescripcionEquipo());
			
			rs=pstm.executeQuery();
			rs.next();
			idEquipo=rs.getString(1);
			
			//se registra el cargo junto con rol
			String sql02="SELECT F_REGISTRA_CARGO_ROL_DE_EQUIPO(?,?,?,?,?,?,?,?)";
			pstm02=conn.prepareStatement(sql02);
			for (ListaCargoEquipo listaCargoEquipo : arrayList) {
				pstm02.setString(1, listaCargoEquipo.getNombreCargo());
				pstm02.setDouble(2, listaCargoEquipo.getSueldo());
				pstm02.setInt(3, listaCargoEquipo.getGestionarLES());
				pstm02.setInt(4, listaCargoEquipo.getGestionarRES());
				pstm02.setInt(5, listaCargoEquipo.getVerficarLES());
				pstm02.setInt(6, listaCargoEquipo.getVerificarRES());
				pstm02.setInt(7, listaCargoEquipo.getMantenimiento());
				pstm02.setInt(8, listaCargoEquipo.getReporte());
				
				rs02=pstm02.executeQuery();
				rs02.next();
				idCargo.add(rs02.getString(1));
			}
			
			//registro de cargo_equipo
			String sql03="CALL SP_REGISTRA_CARGO_EQUIPO(?,?)";
			pstm03=conn.prepareStatement(sql03);
			for (int i = 0; i < idCargo.size(); i++) {
				pstm03.setString(1, idCargo.get(i));
				pstm03.setString(2, idEquipo);
				pstm03.executeUpdate();
			}
			
			//se ejecuta todos los SQl en la base de datos
			conn.commit();
			
		} catch (Exception ex) {
			try {
				conn.rollback();
				//se vuelva a un inicio 
				//No permite un SQL por separado
			} catch (SQLException e1) {
				System.out.println(e1);
			}
			System.out.println(ex);
		} finally{
			try {
				if(rs!= null) rs.close();
				if(rs02!= null) rs02.close();
				if(pstm!= null) pstm.close();
				if(pstm02!= null) pstm02.close();
				if(pstm03!= null) pstm03.close();
				if(conn!= null) conn.close();
			} catch (Exception e2) {
				
			}
		}
		
		return 1;
	}

	@Override
	public ArrayList<ListadoEquipo> listarEquipo() throws SQLException {
		Connection conn= null;
		PreparedStatement pstm = null;
		ResultSet rs = null;	
		ArrayList<ListadoEquipo> data= new ArrayList<ListadoEquipo>();
		ListadoEquipo obj =  null;
		try {
			conn = new ConexionDB().getConexion();
			String sql ="CALL SP_LISTA_EQUIPOS()";
			pstm = conn.prepareStatement(sql);					
			rs = pstm.executeQuery();
			while(rs.next()){
				obj = new ListadoEquipo();
				obj.setIdEquipo(rs.getString(1));
				obj.setNombreEquipo(rs.getString(2));
				obj.setDescripcionEquipo(rs.getString(3));
				obj.setIdUnidadOrganica(rs.getString(4));
				obj.setCantidadCargo(rs.getInt(5));
				
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
	public ListadoEquipo listarEquipoXcodigo(String idEquipo)
			throws SQLException {
		Connection conn= null;
		PreparedStatement pstm = null;
		ResultSet rs = null;	
		
		ListadoEquipo obj =  null;
		try {
			conn = new ConexionDB().getConexion();
			String sql ="CALL SP_LISTA_EQUIPOSxCODIGO(?)";
			pstm = conn.prepareStatement(sql);	
			pstm.setString(1, idEquipo);
			rs = pstm.executeQuery();
			while(rs.next()){
				obj = new ListadoEquipo();
				obj.setIdEquipo(rs.getString(1));
				obj.setNombreEquipo(rs.getString(2));
				obj.setDescripcionEquipo(rs.getString(3));
				obj.setIdUnidadOrganica(rs.getString(4));
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

	@Override
	public ArrayList<ListaCargoEquipo> listarCargoxEquipo(String idEquipo)
			throws SQLException {
		Connection conn= null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		ArrayList<ListaCargoEquipo> arrayList=new ArrayList<ListaCargoEquipo>();
		ListaCargoEquipo obj = null;
		try {
			conn = new ConexionDB().getConexion();
			String sql ="call SP_LISTA_CARGOxEQUIPOS(?)";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, idEquipo);
			rs = pstm.executeQuery();
			while(rs.next()){
				obj = new ListaCargoEquipo();
				obj.setIdCargo(rs.getString("idCargo"));
				obj.setNombreCargo(rs.getString("nomCargo"));
				obj.setSueldo(rs.getDouble("sueldo"));
				obj.setGestionarLES(rs.getInt("gestionarLES"));
				obj.setGestionarRES(rs.getInt("gestionarRES"));
				obj.setVerficarLES(rs.getInt("verificarLES"));
				obj.setVerificarRES(rs.getInt("verificarRES"));
				obj.setMantenimiento(rs.getInt("mantenimiento"));
				obj.setReporte(rs.getInt("reporte"));
				
				arrayList.add(obj);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			try {
				if(rs!= null) rs.close();
				if(pstm!= null) pstm.close();
				if(conn!= null) conn.close();
			} catch (Exception e2) {
			}
		}
		
		return arrayList;
	}
	
	

	@Override
	public int eliminaCargo(String idCargo) throws SQLException {
		Connection conn= null;
		PreparedStatement pstm = null;		
		
		int salida=-1;
		try {
			conn = new ConexionDB().getConexion();
			String sql ="CALL SP_ELIMINA_CARGO(?)";
			pstm = conn.prepareStatement(sql);	
			pstm.setString(1, idCargo);
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
	public int modificarEquipo(Equipo equipo,
			ArrayList<ListaCargoEquipo> arrayList) throws SQLException {

		int contador =-1;
		Connection conn= null;
		PreparedStatement pstm = null,pstm02=null,pstm03=null;
		ResultSet rs = null,rs02=null;	
		ArrayList<String> idCargo = new ArrayList<String>();
		
		try {
			conn = new ConexionDB().getConexion();
			
			conn.setAutoCommit(false);
			
			//se registra equipo y se recupera su id
			String sql ="call SP_ACTUALIZA_EQUIPO(?,?,?)";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, equipo.getIdEquipo());	
			pstm.setString(2, equipo.getNombreEquipo());
			pstm.setString(3, equipo.getDescripcionEquipo());
			
			rs=pstm.executeQuery();
			
			//se registra el cargo junto con rol
			String sql02="SELECT F_REGISTRA_CARGO_ROL_DE_EQUIPO(?,?,?,?,?,?,?,?)";
			pstm02=conn.prepareStatement(sql02);
			
			for (ListaCargoEquipo listaCargoEquipo : arrayList) {
				if(listaCargoEquipo.getItemCargo()!=0){
					pstm02.setString(1, listaCargoEquipo.getNombreCargo());
					pstm02.setDouble(2, listaCargoEquipo.getSueldo());
					pstm02.setInt(3, listaCargoEquipo.getGestionarLES());
					pstm02.setInt(4, listaCargoEquipo.getGestionarRES());
					pstm02.setInt(5, listaCargoEquipo.getVerficarLES());
					pstm02.setInt(6, listaCargoEquipo.getVerificarRES());
					pstm02.setInt(7, listaCargoEquipo.getMantenimiento());
					pstm02.setInt(8, listaCargoEquipo.getReporte());
					
					rs02=pstm02.executeQuery();
					rs02.next();
					idCargo.add(rs02.getString(1));
				}
				
			}
			
			//registro de cargo_equipo
			String sql03="CALL SP_REGISTRA_CARGO_EQUIPO(?,?)";
			pstm03=conn.prepareStatement(sql03);
			for (int i = 0; i < idCargo.size(); i++) {
				pstm03.setString(1, idCargo.get(i));
				pstm03.setString(2, equipo.getIdEquipo());
				pstm03.executeUpdate();
			}
			
			//se ejecuta todos los SQl en la base de datos
			conn.commit();
			
		} catch (Exception ex) {
			try {
				conn.rollback();
				//se vuelva a un inicio 
				//No permite un SQL por separado
			} catch (SQLException e1) {
				System.out.println("despues del roolbac"+e1);
			}
			System.out.println(ex);
		} finally{
			try {
				if(rs!= null) rs.close();
				if(rs02!= null) rs02.close();
				if(pstm!= null) pstm.close();
				if(pstm02!= null) pstm02.close();
				if(pstm03!= null) pstm03.close();
				if(conn!= null) conn.close();
			} catch (Exception e2) {
				
			}
		}
		
		return 1;
	}

	@Override
	public String eliminarEquipo(String idEquipo) throws SQLException {
		Connection conn= null;
		PreparedStatement pstm = null, pstm02=null,pstm03=null;
		ResultSet rs = null;		
		String mensaje="";
		ArrayList<Cargo> arrayListCargos= new ArrayList<Cargo>();
		
		try {
			conn = new ConexionDB().getConexion();

			
			String sql ="call SP_VERIFICA_ELIMINA_EQUIPO(?)";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, idEquipo);
			
			rs=pstm.executeQuery();
			
			while (rs.next()){
				Cargo cargo= new Cargo();
				cargo.setIdCargo(rs.getString(1));
				System.out.println(cargo.getIdCargo());
				if(cargo.getIdCargo().length()==6){
					arrayListCargos.add(cargo);
					System.out.println("este id si se agrego = "+cargo.getIdCargo());
				}
				
			}

			
			
				String sql02 ="CALL SP_ELIMINA_CARGO(?)";
				pstm02 = conn.prepareStatement(sql02);	
				for (Cargo cargo : arrayListCargos) {
					if(cargo.getIdCargo().length()==6){
						pstm02.setString(1, cargo.getIdCargo());
						pstm02.executeUpdate();
		
					System.out.println("este id si se esta eliminando = "+cargo.getIdCargo());
					}
					
			}
			
			
			
			
			
			if(arrayListCargos.get(1).getIdCargo().length()==6){
				String sql03 ="CALL SP_ELIMINA_EQUIPO(?)";
				pstm03 = conn.prepareStatement(sql03);	
				pstm03.setString(1, idEquipo);
				pstm03.executeUpdate();
			}
			

			
			arrayListCargos.clear();
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally{
			try {
				if(rs!= null) rs.close();
				if(pstm!= null) pstm.close();
				if(pstm02!= null) pstm02.close();
				if(pstm03!= null) pstm03.close();
				if(conn!= null) conn.close();
			} catch (Exception e2) {
			}
		}
		
		return mensaje;
	}

}