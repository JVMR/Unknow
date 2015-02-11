package entidad;

public class Persona {
	private String nDNI,nombre,apeP,apeM,sexo,fechaNac,telefono,direccion,email,idDistrito,idProv,idDepart;
	public String getIdProv() {
		return idProv;
	}
	public void setIdProv(String idProv) {
		this.idProv = idProv;
	}
	public String getIdDepart() {
		return idDepart;
	}
	public void setIdDepart(String idDepart) {
		this.idDepart = idDepart;
	}
	private byte[] foto,firma,huella;
	public String getnDNI() {
		return nDNI;
	}
	public void setnDNI(String nDNI) {
		this.nDNI = nDNI;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getApeP() {
		return apeP;
	}
	public void setApeP(String apeP) {
		this.apeP = apeP;
	}
	public String getApeM() {
		return apeM;
	}
	public void setApeM(String apeM) {
		this.apeM = apeM;
	}
	public String getSexo() {
		return sexo;
	}
	public void setSexo(String sexo) {
		this.sexo = sexo;
	}
	public String getFechaNac() {
		return fechaNac;
	}
	public void setFechaNac(String fechaNac) {
		this.fechaNac = fechaNac;
	}
	public String getTelefono() {
		return telefono;
	}
	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}
	public String getDireccion() {
		return direccion;
	}
	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getIdDistrito() {
		return idDistrito;
	}
	public void setIdDistrito(String idDistrito) {
		this.idDistrito = idDistrito;
	}
	public byte[] getFoto() {
		return foto;
	}
	public void setFoto(byte[] foto) {
		this.foto = foto;
	}
	public byte[] getFirma() {
		return firma;
	}
	public void setFirma(byte[] firma) {
		this.firma = firma;
	}
	public byte[] getHuella() {
		return huella;
	}
	public void setHuella(byte[] huella) {
		this.huella = huella;
	}
	
	
}
