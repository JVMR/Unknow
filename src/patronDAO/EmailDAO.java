package patronDAO;

import entidad.Email;

public interface EmailDAO {

	public  Email enviarcorreo(String receptor,String mensaje);
}
