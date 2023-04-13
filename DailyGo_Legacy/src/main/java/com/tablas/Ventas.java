package com.tablas;

public class Ventas {
	int cod_cli_ven;
	String DNI_rid_ven;
	String dir_vent;
	String fecha_ven;
	String estado_ven;
	String com_ven;
	public Ventas(int cod_cli_ven, String dNI_rid_ven, String dir_vent, String fecha_ven, String estado_ven,
			String com_ven) {
		super();
		this.cod_cli_ven = cod_cli_ven;
		DNI_rid_ven = dNI_rid_ven;
		this.dir_vent = dir_vent;
		this.fecha_ven = fecha_ven;
		this.estado_ven = estado_ven;
		this.com_ven = com_ven;
	}
	public int getCod_cli_ven() {
		return cod_cli_ven;
	}
	public void setCod_cli_ven(int cod_cli_ven) {
		this.cod_cli_ven = cod_cli_ven;
	}
	public String getDNI_rid_ven() {
		return DNI_rid_ven;
	}
	public void setDNI_rid_ven(String dNI_rid_ven) {
		DNI_rid_ven = dNI_rid_ven;
	}
	public String getDir_vent() {
		return dir_vent;
	}
	public void setDir_vent(String dir_vent) {
		this.dir_vent = dir_vent;
	}
	public String getFecha_ven() {
		return fecha_ven;
	}
	public void setFecha_ven(String fecha_ven) {
		this.fecha_ven = fecha_ven;
	}
	public String getEstado_ven() {
		return estado_ven;
	}
	public void setEstado_ven(String estado_ven) {
		this.estado_ven = estado_ven;
	}
	public String getCom_ven() {
		return com_ven;
	}
	public void setCom_ven(String com_ven) {
		this.com_ven = com_ven;
	}

}
