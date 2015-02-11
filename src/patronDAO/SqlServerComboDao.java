package patronDAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import util.ConexionSQL;
import entidad.Combo;

public class SqlServerComboDao implements ComboDao{

	@Override
	public ArrayList<Combo> lista(String sql) throws Exception {
		ArrayList<Combo> lista = new ArrayList<Combo>();
		Combo bean = null;
		System.out.println("SENTENCIA SQL : " + sql);	
		Connection conn = null;
		try {
			conn = new ConexionSQL().getConexion();
			Statement pstm = conn.createStatement();
			ResultSet rst = pstm.executeQuery(sql);
			while (rst.next()) {
				bean = new Combo();
				bean.setValue(rst.getString(1));
				bean.setDescripcion(rst.getString(2));
				lista.add(bean);
			}
			rst.close();
			pstm.close();
		}catch (SQLException e) {
			e.printStackTrace();
		}finally{
			conn.close();
		}
		return lista;
	}

}
