package com.tablas;

public class Clientes {
	
	String nom_cli;
	String ape_cli;
	int tlf_cli;
	String mail_cli;
	String psw_cli;
	String img_cli;
	
	public Clientes( String nom_cli, String ape_cli, int tlf_cli, String mail_cli, String psw_cli,
			String img_cli) {
		super();
		
		this.nom_cli = nom_cli;
		this.ape_cli = ape_cli;
		this.tlf_cli = tlf_cli;
		this.mail_cli = mail_cli;
		this.psw_cli = psw_cli;
		this.img_cli = img_cli;
	}
	
	
	
	public String getNom_cli() {
		return nom_cli;
	}
	
	public void setNom_cli(String nom_cli) {
		this.nom_cli = nom_cli;
	}
	
	public String getApe_cli() {
		return ape_cli;
	}
	
	public void setApe_cli(String ape_cli) {
		this.ape_cli = ape_cli;
	}
	
	public int getTlf_cli() {
		return tlf_cli;
	}
	
	public void setTlf_cli(int tlf_cli) {
		this.tlf_cli = tlf_cli;
	}
	
	public String getMail_cli() {
		return mail_cli;
	}
	
	public void setMail_cli(String mail_cli) {
		this.mail_cli = mail_cli;
	}
	
	public String getPsw_cli() {
		return psw_cli;
	}
	
	public void setPsw_cli(String psw_cli) {
		this.psw_cli = psw_cli;
	}
	
	public String getImg_cli() {
		return img_cli;
	}
	
	public void setImg_cli(String img_cli) {
		this.img_cli = img_cli;
	}
	
}
