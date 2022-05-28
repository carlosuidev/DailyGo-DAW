package com.tablas;

public class detalleVentas {
	int num_ven_det;
	int cod_prod;
	int cantidadComprada;
	String nombreProd_det;
	Double precio_u_det;
	String img_det;
	public String getImg_det() {
		return img_det;
	}
	public void setImg_det(String img_det) {
		this.img_det = img_det;
	}
	public detalleVentas(int num_ven_det, int cod_prod, int cantidadComprada, String nombreProd_det,
			Double precio_u_det, String img_det) {
		super();
		this.num_ven_det = num_ven_det;
		this.cod_prod = cod_prod;
		this.cantidadComprada = cantidadComprada;
		this.nombreProd_det = nombreProd_det;
		this.precio_u_det = precio_u_det;
		this.img_det = img_det;
	}
	public detalleVentas(int num_ven_det, int cod_prod, int cantidadComprada) {
		super();
		this.num_ven_det = num_ven_det;
		this.cod_prod = cod_prod;
		this.cantidadComprada = cantidadComprada;
	}
	public int getnum_ven_det() {
		return num_ven_det;
	}
	public void setnum_ven_det(int num_ven_det) {
		this.num_ven_det = num_ven_det;
	}
	public int getCod_prod() {
		return cod_prod;
	}
	public void setCod_prod(int cod_prod) {
		this.cod_prod = cod_prod;
	}
	public int getCantidadComprada() {
		return cantidadComprada;
	}
	public void setCantidadComprada(int cantidadComprada) {
		this.cantidadComprada = cantidadComprada;
	}
	public int getNum_ven_det() {
		return num_ven_det;
	}
	public void setNum_ven_det(int num_ven_det) {
		this.num_ven_det = num_ven_det;
	}
	public String getNombreProd_det() {
		return nombreProd_det;
	}
	public void setNombreProd_det(String nombreProd_det) {
		this.nombreProd_det = nombreProd_det;
	}
	public Double getPrecio_u_det() {
		return precio_u_det;
	}
	public void setPrecio_u_det(Double precio_u_det) {
		this.precio_u_det = precio_u_det;
	}
	
	
}
