package entidad;

public class ListadoUnidad {

	private String idUnidadOrganica;
	private String nombreUnidad;
	private String descripcionUnidad;
	private String idCargo; 
	private String nombreCargo;
	private String idRol;
	private int numEquipos;
	
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
	private double sueldo;
	private int gestionarLES;
	private int gestionarRES;
	private int verficarLES; 
	private int verificarRES;
	private int mantenimiento;
	private int reporte;
	
	
	
	public String getIdUnidadOrganica() {
		return idUnidadOrganica;
	}
	public void setIdUnidadOrganica(String idUnidadOrganica) {
		this.idUnidadOrganica = idUnidadOrganica;
	}
	public String getNombreUnidad() {
		return nombreUnidad;
	}
	public void setNombreUnidad(String nombreUnidad) {
		this.nombreUnidad = nombreUnidad;
	}
	public String getDescripcionUnidad() {
		return descripcionUnidad;
	}
	public void setDescripcionUnidad(String descripcionUnidad) {
		this.descripcionUnidad = descripcionUnidad;
	}
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
	public String getIdRol() {
		return idRol;
	}
	public void setIdRol(String idRol) {
		this.idRol = idRol;
	}
	public int getNumEquipos() {
		return numEquipos;
	}
	public void setNumEquipos(int numEquipos) {
		this.numEquipos = numEquipos;
	}
	
	
	
	
	
}