package patronDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.ConexionDB;
import entidad.Persona;

public class SqlServerPersonaDao implements PersonaDao{

	@Override
	public int registraPersona(Persona e) {
		Connection conn= null;
		PreparedStatement pstm = null;		
		
		int salida=-1;
		try {
			System.out.println(""+e.getFoto());
			conn = new ConexionDB().getConexion();
			String sql ="{CALL registraPersona(?,?,?,?,?,?,?,?,?,?,?,?,?)}";
			pstm = conn.prepareStatement(sql);	
			pstm.setString(1, e.getnDNI());
			pstm.setString(2, e.getNombre());
			pstm.setString(3, e.getApeP());
			pstm.setString(4, e.getApeM());
			pstm.setString(5, e.getSexo());
			pstm.setString(6, e.getFechaNac());
			pstm.setString(7, e.getTelefono());
			pstm.setString(8, e.getDireccion());
			pstm.setString(9, e.getEmail());			
			pstm.setBytes(10, e.getFoto());
			pstm.setBytes(11, e.getFirma());
			pstm.setBytes(12, e.getHuella());
			pstm.setString(13, e.getIdDistrito());
			salida=pstm.executeUpdate();
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally{
			try {
				if(pstm!= null) pstm.close();
				if(conn!= null) conn.close();
			} catch (Exception e2) {
			}
		}
		
		return salida;
	}

	@Override
	public int modificaPersona(Persona e) throws SQLException {
		Connection conn= null;
		PreparedStatement pstm = null;
		ResultSet rs = null;		
		int salida=-1;
		try {
			conn = new ConexionDB().getConexion();
			String sql ="{CALL modificaPersona(?,?,?,?,?,?,?,?,?,?,?,?,?,?)}";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, e.getnDNI());
			pstm.setString(2, e.getNombre());
			pstm.setString(3, e.getApeP());
			pstm.setString(4, e.getApeM());
			pstm.setString(5, e.getSexo());
			pstm.setString(6, e.getFechaNac());
			pstm.setString(7, e.getTelefono());
			pstm.setString(8, e.getDireccion());
			pstm.setString(9, e.getEmail());			
			pstm.setBytes(10, e.getFoto());
			pstm.setBytes(11, e.getFirma());
			pstm.setBytes(12, e.getHuella());
			pstm.setString(13, e.getIdDistrito());
			salida=pstm.executeUpdate();
			
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
		
		return salida;
	}

	@Override
	public int eliminaPersona(String codigo) throws SQLException {
		Connection conn= null;
		PreparedStatement pstm = null;
		ResultSet rs = null;		
		int salida=-1;
		try {
			conn = new ConexionDB().getConexion();
			String sql ="{CALL eliminaPersona(?)}";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, codigo);			
			salida=pstm.executeUpdate();
			
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
		
		return salida;
	}

	@Override
	public List<Persona> listaPersona() throws SQLException {
		Connection conn= null;
		PreparedStatement pstm = null;
		ResultSet rs = null;	
		List<Persona> data= new ArrayList<Persona>();
		Persona obj =  null;
		try {
			conn = new ConexionDB().getConexion();
			String sql ="{call listaPersona()}";
			pstm = conn.prepareStatement(sql);					
			rs = pstm.executeQuery();
			while(rs.next()){
				obj = new Persona();
				obj.setnDNI(rs.getString(1));
				obj.setNombre(rs.getString(2));
				obj.setApeP(rs.getString(3));
				obj.setApeM(rs.getString(4));
				obj.setSexo(rs.getString(5));
				obj.setFechaNac(rs.getString(6));
				obj.setTelefono(rs.getString(7));
				obj.setDireccion(rs.getString(8));
				obj.setEmail(rs.getString(9));
				obj.setFoto(rs.getBytes(10));
				obj.setFirma(rs.getBytes(11));
				obj.setHuella(rs.getBytes(12));
				obj.setIdDistrito(rs.getString(13));				
				data.add(obj);
			}	
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
		
		return data;
	}

	@Override
	public Persona PersonaxCodigo(String codigo) throws SQLException {
		Connection conn= null;
		PreparedStatement pstm = null;
		ResultSet rs = null;	
		Persona obj =  null;
		try {
			conn = new ConexionDB().getConexion();
			String sql ="{CALL listaPersonaxCodigo(?)}";
			pstm = conn.prepareStatement(sql);	
			pstm.setString(1, codigo);	
			rs = pstm.executeQuery();
			while(rs.next()){
				obj = new Persona();
				obj.setnDNI(rs.getString(1));
				obj.setNombre(rs.getString(2));
				obj.setApeP(rs.getString(3));
				obj.setApeM(rs.getString(4));
				obj.setSexo(rs.getString(5));
				obj.setFechaNac(rs.getString(6));
				obj.setTelefono(rs.getString(7));
				obj.setDireccion(rs.getString(8));
				obj.setEmail(rs.getString(9));
				obj.setFoto(rs.getBytes(10));
				obj.setFirma(rs.getBytes(11));
				obj.setHuella(rs.getBytes(12));
				obj.setIdDistrito(rs.getString(13));	
				}	
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
		
		return obj;
	}

}
