package com.tablas;

public class Pedidos {
	int num_ped;
	String nom_rep_ped;
	String estado_ped;
	String nom_prod_ped;
	String img_prod_ped;
	double precio_ud_ped;
	int cant_ped;
	public Pedidos(int num_ped, String nom_rep_ped, String estado_ped, String nom_prod_ped, String img_prod_ped,
			double precio_ud_ped, int cant_ped) {
		super();
		this.num_ped = num_ped;
		this.nom_rep_ped = nom_rep_ped;
		this.estado_ped = estado_ped;
		this.nom_prod_ped = nom_prod_ped;
		this.img_prod_ped = img_prod_ped;
		this.precio_ud_ped = precio_ud_ped;
		this.cant_ped = cant_ped;
	}
	public int getNum_ped() {
		return num_ped;
	}
	public void setNum_ped(int num_ped) {
		this.num_ped = num_ped;
	}
	public String getNom_rep_ped() {
		return nom_rep_ped;
	}
	public void setNom_rep_ped(String nom_rep_ped) {
		this.nom_rep_ped = nom_rep_ped;
	}
	public String getEstado_ped() {
		return estado_ped;
	}
	public void setEstado_ped(String estado_ped) {
		this.estado_ped = estado_ped;
	}
	public String getNom_prod_ped() {
		return nom_prod_ped;
	}
	public void setNom_prod_ped(String nom_prod_ped) {
		this.nom_prod_ped = nom_prod_ped;
	}
	public String getImg_prod_ped() {
		return img_prod_ped;
	}
	public void setImg_prod_ped(String img_prod_ped) {
		this.img_prod_ped = img_prod_ped;
	}
	public double getPrecio_ud_ped() {
		return precio_ud_ped;
	}
	public void setPrecio_ud_ped(double precio_ud_ped) {
		this.precio_ud_ped = precio_ud_ped;
	}
	public int getCant_ped() {
		return cant_ped;
	}
	public void setCant_ped(int cant_ped) {
		this.cant_ped = cant_ped;
	}
	
	
}
