package com.tablas;

public class Productos {
	String DEN_PROD;
	Double PU_PROD;
	String NOM_RES;
	String img_prod;
	public Productos(String dEN_PROD, Double pU_PROD, String NOM_RES, String img_prod) {
		super();
		DEN_PROD = dEN_PROD;
		PU_PROD = pU_PROD;
		this.NOM_RES = NOM_RES;
		this.img_prod = img_prod;
	}
	public String getDEN_PROD() {
		return DEN_PROD;
	}
	public void setDEN_PROD(String dEN_PROD) {
		DEN_PROD = dEN_PROD;
	}
	public Double getPU_PROD() {
		return PU_PROD;
	}
	public void setPU_PROD(Double pU_PROD) {
		PU_PROD = pU_PROD;
	}
	public String getNOM_RES() {
		return NOM_RES;
	}
	public void setNOM_RES(String NOM_RES) {
		this.NOM_RES = NOM_RES;
	}
	public String getImg_prod() {
		return img_prod;
	}
	public void setImg_prod(String img_prod) {
		this.img_prod = img_prod;
	}
	
}
