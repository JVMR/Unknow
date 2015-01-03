
package util;

import java.util.List;
import java.util.ResourceBundle;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import entidad.Combo;
import patronDAO.Factory;
import patronDAO.ComboDao;

@SuppressWarnings("serial")
public class ComboDinamico extends TagSupport{
private String nombre, sql;
	
	public int doStartTag() throws JspException {
		//Permite leer archivos properties
		ResourceBundle rb = ResourceBundle.getBundle("tags");
		
		JspWriter out = pageContext.getOut();

		Factory bd = Factory.getTipo(Factory.TIPO_MYSQL);
		ComboDao  dao = bd.getCombo();
		
		try {
			out.print("<select class='form-control' name='" + nombre + "'>");
			out.print("<option value='-1'>[Seleccione]</option>");
			
			List<Combo>  lista = dao.lista(rb.getString(sql));
				for (Combo obj : lista) {
					out.print("<option value='" +obj.getValue()+ "'>");
					out.print(obj.getDescripcion());
					out.print("</option>");
				}
			out.print("</select>");

		} catch (Exception e) {
			e.printStackTrace();
		}
		return super.doStartTag();
	}




	public String getNombre() {
		return nombre;
	}




	public void setNombre(String nombre) {
		this.nombre = nombre;
	}




	public String getSql() {
		return sql;
	}




	public void setSql(String sql) {
		this.sql = sql;
	}
}

