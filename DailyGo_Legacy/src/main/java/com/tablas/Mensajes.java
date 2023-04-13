package com.tablas;

public class Mensajes {
	
	int cod_cli_men;
	String asu_men;
	String men_men;
	
	public Mensajes(int cod_cli_men, String asu_men, String men_men) {
		super();
		this.cod_cli_men = cod_cli_men;
		this.asu_men = asu_men;
		this.men_men = men_men;
	}
	
	public int getCod_cli_men() {
		return cod_cli_men;
	}
	public void setCod_cli_men(int cod_cli_men) {
		this.cod_cli_men = cod_cli_men;
	}
	public String getAsu_men() {
		return asu_men;
	}
	public void setAsu_men(String asu_men) {
		this.asu_men = asu_men;
	}
	public String getMen_men() {
		return men_men;
	}
	public void setMen_men(String men_men) {
		this.men_men = men_men;
	}
	
}
