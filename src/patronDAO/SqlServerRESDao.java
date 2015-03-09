package patronDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.print.attribute.standard.PresentationDirection;

import util.ConexionSQL;
import entidad.Empleado;
import entidad.Res;

public class SqlServerRESDao implements ResDao {

	@Override
	public int registraRes(Res r) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int modificaRes(Res r) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Res ResxCodigo(String codigo) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Res> ResxRangoFecha(String fecha1, String fecha2,
			String idEstado) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Res> listarVisaRES() throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int actualizaEstado(String idRES, String idAprobador, int idEstado,
			String pdf, String fecha) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public String verificaPersonaMYSQL(String idUsuario, String dni)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String verificarFirma(String dni, String contraseña)
			throws SQLException {
		
		Connection conn=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		String resultado="";

		try {
			conn= new ConexionSQL().getConexion();
			String sql="{call SP_PRUEBA(?,?)}";
			pstm=conn.prepareStatement(sql);
			pstm.setString(1, dni);
			pstm.setString(2, contraseña);
			rs=pstm.executeQuery();
			
			while(rs.next()){
				resultado=rs.getString(1);
				if(resultado.startsWith("1")){
					resultado="NO";
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(pstm!=null) pstm.close();
			if(conn!=null) conn.close();
		}
		
		return resultado;
	}

	@Override
	public Empleado buscaDNI(String idRES) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String obtengoFirma02(String dni) throws SQLException {
		
		Connection conn=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		String firma="";
		try {
			conn = new ConexionSQL().getConexion();
			String sql="SELECT firma FROM PERSONA WHERE nDNI=?";
			pstm=conn.prepareStatement(sql);
			pstm.setString(1, dni);
			rs=pstm.executeQuery();
			while(rs.next()){
				firma=rs.getString(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(rs!=null) rs.close();
			if(pstm!=null) pstm.close();
			if(conn!=null) conn.close();
		}
		
		return firma;
	}

}
