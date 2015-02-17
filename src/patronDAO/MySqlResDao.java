package patronDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.swing.text.html.HTMLDocument.HTMLReader.PreAction;

import util.ConexionDB;
import entidad.Asalariado_RES;
import entidad.Res;

public class MySqlResDao implements ResDao{

	@Override
	public int registraRes(Res r) {
		Connection conn= null;
		PreparedStatement pstm = null;		
		
		int salida=-1;
		try {
			conn = new ConexionDB().getConexion();
			String sql ="CALL SP_REGISTRARES(?,?,?,?,?,?,?)";
			pstm = conn.prepareStatement(sql);	
			pstm.setString(1, r.getReferencia());
			pstm.setString(2, r.getDescriptor());
			pstm.setString(3, r.getObjetoConsulta());
			pstm.setString(4, r.getAnalisis());
			pstm.setString(5, r.getFechaGenerado());
			pstm.setString(6, r.getIdLes());
			pstm.setString(7, r.getIdAsalariado());
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
	public Res ResxCodigo(String codigo) throws SQLException {
		Connection conn= null;
		PreparedStatement pstm = null;
		ResultSet rs = null;	
		Res obj =  null;
		try {
			conn = new ConexionDB().getConexion();
			String sql ="CALL SP_LISTARESxCODIGO(?)";
			pstm = conn.prepareStatement(sql);	
			pstm.setString(1, codigo);	
			rs = pstm.executeQuery();
			while(rs.next()){
				obj = new Res();
				obj.setIdRes(rs.getString(1));
				obj.setReferencia(rs.getString(2));
				obj.setDescriptor(rs.getString(3));
				obj.setObjetoConsulta(rs.getString(4));
				obj.setAnalisis(rs.getString(5));
				obj.setFechaGenerado(rs.getString(6));
				obj.setIdLes(rs.getString(7));
				obj.setIdAsalariado(rs.getString(8));
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

	@Override
	public List<Res> ResxRangoFecha(String fecha1, String fecha2, String idEstado)
			throws SQLException {
		Connection conn= null;
		PreparedStatement pstm = null;
		ResultSet rs = null;	
		List<Res> data= new ArrayList<Res>();
		Res obj =  null;
		try {
			conn = new ConexionDB().getConexion();
			String sql ="CALL SP_LISTARESxFECHAS(?,?,?)";
			pstm = conn.prepareStatement(sql);	
			pstm.setString(1, fecha1);
			pstm.setString(2, fecha2);
			pstm.setString(3, idEstado);
			rs = pstm.executeQuery();
			while(rs.next()){
				obj = new Res();
				obj.setIdRes(rs.getString(1));
				obj.setReferencia(rs.getString(2));
				obj.setDescriptor(rs.getString(3));
				obj.setObjetoConsulta(rs.getString(4));
				obj.setAnalisis(rs.getString(5));
				obj.setFechaGenerado(rs.getString(6));
				obj.setIdLes(rs.getString(7));
				obj.setIdEstado(rs.getString(8));
				obj.setIdAsalariado(rs.getString(9));
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
	public int modificaRes(Res r) throws SQLException {
		Connection conn= null;
		PreparedStatement pstm = null;
		ResultSet rs = null;		
		int salida=-1;
		try {
			conn = new ConexionDB().getConexion();
			String sql ="CALL SP_ACTUALIZARRES(?,?,?)";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, r.getIdRes());
			pstm.setString(2, r.getObjetoConsulta());
			pstm.setString(3, r.getAnalisis());
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
	public ArrayList<Res> listarVisaRES() throws SQLException {
		
		Connection conn=null;
		PreparedStatement pstm01=null, pstm02=null;
		ResultSet rs01=null, rs02=null;
		ArrayList<Res> data= new ArrayList<Res>();
		Res res=null;
		ArrayList<Integer> listacodRES= new ArrayList<Integer>();
		
		data.clear();
		listacodRES.clear();
		int i=0;
		try {
			conn = new ConexionDB().getConexion();
			
			String sql01="select idRES from asa_res";
			pstm01=conn.prepareStatement(sql01);
			rs01=pstm01.executeQuery();
			while(rs01.next()){
				listacodRES.add(rs01.getInt(1));
				
				//int c = rs01.getInt(1);
				//System.out.println("dentro del for para igualar codigo :" + rs01.getString(1));
				
			/*	for (Integer cod : listacodRES) {
					if(cod!=c){
						listacodRES.add(c);
						System.out.println("Este codigo dentro de listado: "+c);
					}
					
				}		*/
			}
			
			System.out.println("dentro del for para igualar codigo :" +listacodRES);
			
			for (Integer cod : listacodRES) {
				
				
				
				String sql02="CALL SP_LISTA_VISAR_RES(?)";
				pstm02= conn.prepareStatement(sql02);
				pstm02.setInt(1, cod);
				
				rs02=pstm02.executeQuery();
				System.out.println("Valores del resulset : "+rs02);
				
				while(rs02.next()){
					if(rs02.getString(1).startsWith("E")){
						
					}else{
						res = new Res();
						res.setIdRes(rs02.getString(1));
						res.setNombreAprobador(rs02.getString(2));
						res.setFechaAprobada(rs02.getString(3));
						data.add(res);
					}
					}	
				i++;
				System.out.println("NUmero de vueltas del for: "+i);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			try {
				if(rs01!=null) rs01.close();
				if(rs02!=null) rs02.close();
				if(pstm01!=null) pstm01.close();
				if(pstm02!=null) pstm02.close();
				if(conn!=null) conn.close();
				
				i=0;
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		
		return data;
		
		
	}

	@Override
	public int actualizaEstado(Res res, Asalariado_RES asalariado_RES) throws SQLException {
		Connection conn = null;
		PreparedStatement pstm= null, pstm02=null;
		
		int salida = -1;
		
		try {
			conn = new ConexionDB().getConexion();
			String sql= "call SP_ACTUALIZA_ESTADO_RES(?,?)";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, res.getIdRes());
			pstm.setString(2, res.getIdEstado());
			salida=pstm.executeUpdate();
			if(res.getIdEstado().equals("9")){
				String sql02="insert into asa_res(`idAsalariado`,`idRES`,`fechaAprob`) values(?,?,?);";
				pstm02 = conn.prepareStatement(sql02);
				pstm02.setString(1, asalariado_RES.getIdAsalariado());
				pstm02.setInt(2, asalariado_RES.getIdRES());
				pstm02.setString(3, asalariado_RES.getFechaAprob());
				
				salida=pstm02.executeUpdate();
			}
			
			
						
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				if(pstm!=null) pstm.close();
				if(conn!=null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return salida;
	}

	
	
}
