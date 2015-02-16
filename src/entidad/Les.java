package entidad;

public class Les {

	private String idLes;
	private String diagnostico;
	private String fechaInicioDes;
	private String fechaFinDes;
	private String pdf;
	private String error;
	private int cantidad;
	public int getCantidad() {
		return cantidad;
	}
	public String getPdf() {
		return pdf;
	}
	public String getError() {
		return error;
	}
	public void setError(String error) {
		this.error = error;
	}
	public void setPdf(String pdf) {
		this.pdf = pdf;
	}
	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}
	private byte[] documento;
	private String motivoLicencia;
	private String descripcionMotivo;
	private String fechaHora;
	private String idEmpleado;
	private String idEstado;
	private String nomEmpleado;
	
	public String getNomEmpleado() {
		return nomEmpleado;
	}
	public void setNomEmpleado(String nomEmpleado) {
		this.nomEmpleado = nomEmpleado;
	}
	public String getIdLes() {
		return idLes;
	}
	public void setIdLes(String idLes) {
		this.idLes = idLes;
	}
	public String getDiagnostico() {
		return diagnostico;
	}
	public void setDiagnostico(String diagnostico) {
		this.diagnostico = diagnostico;
	}
	public String getFechaInicioDes() {
		return fechaInicioDes;
	}
	public void setFechaInicioDes(String fechaInicioDes) {
		this.fechaInicioDes = fechaInicioDes;
	}
	public String getFechaFinDes() {
		return fechaFinDes;
	}
	public void setFechaFinDes(String fechaFinDes) {
		this.fechaFinDes = fechaFinDes;
	}
	public String getMotivoLicencia() {
		return motivoLicencia;
	}
	public void setMotivoLicencia(String motivoLicencia) {
		this.motivoLicencia = motivoLicencia;
	}
	public String getDescripcionMotivo() {
		return descripcionMotivo;
	}
	public void setDescripcionMotivo(String descripcionMotivo) {
		this.descripcionMotivo = descripcionMotivo;
	}
	public String getFechaHora() {
		return fechaHora;
	}
	public void setFechaHora(String fechaHora) {
		this.fechaHora = fechaHora;
	}
	public String getIdEmpleado() {
		return idEmpleado;
	}
	public void setIdEmpleado(String idEmpleado) {
		this.idEmpleado = idEmpleado;
	}
	public String getIdEstado() {
		return idEstado;
	}
	public void setIdEstado(String idEstado) {
		this.idEstado = idEstado;
	}
	public byte[] getDocumento() {
		return documento;
	}
	public void setDocumento(byte[] documento) {
		this.documento = documento;
	}
	
}
