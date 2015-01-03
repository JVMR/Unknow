package entidad;

public class ListaCargoEquipo {
	private String idCargo;
	private int itemCargo;
	public int getItemCargo() {
		return itemCargo;
	}
	public void setItemCargo(int itemCargo) {
		this.itemCargo = itemCargo;
	}
	private String nombreCargo;
	private double sueldo;

	private int gestionarLES;
	private int gestionarRES;
	private int verficarLES; 
	private int verificarRES;
	private int mantenimiento;
	private int reporte;
	public String getIdCargo() {
		return idCargo;
	}
	public void setIdCargo(String idCargo) {
		this.idCargo = idCargo;
	}
	public String getNombreCargo() {
		return nombreCargo;
	}
	public void setNombreCargo(String nombreCargo) {
		this.nombreCargo = nombreCargo;
	}
	public double getSueldo() {
		return sueldo;
	}
	public void setSueldo(double sueldo) {
		this.sueldo = sueldo;
	}
	public int getGestionarLES() {
		return gestionarLES;
	}
	public void setGestionarLES(int gestionarLES) {
		this.gestionarLES = gestionarLES;
	}
	public int getGestionarRES() {
		return gestionarRES;
	}
	public void setGestionarRES(int gestionarRES) {
		this.gestionarRES = gestionarRES;
	}
	public int getVerficarLES() {
		return verficarLES;
	}
	public void setVerficarLES(int verficarLES) {
		this.verficarLES = verficarLES;
	}
	public int getVerificarRES() {
		return verificarRES;
	}
	public void setVerificarRES(int verificarRES) {
		this.verificarRES = verificarRES;
	}
	public int getMantenimiento() {
		return mantenimiento;
	}
	public void setMantenimiento(int mantenimiento) {
		this.mantenimiento = mantenimiento;
	}
	public int getReporte() {
		return reporte;
	}
	public void setReporte(int reporte) {
		this.reporte = reporte;
	}
	
	

}
