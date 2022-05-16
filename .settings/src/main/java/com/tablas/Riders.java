package com.tablas;

public class Riders {
    String dni_rid;
    String nom_rid;
    String ape_rid;
    String tlf_rid;
    String mail_rid;
    String pw_rid;
    String img_rid;
    public Riders(String dni_rid, String nom_rid, String ape_rid, String tlf_rid, String mail_rid, String pw_rid,
            String img_rid) {
        super();
        this.dni_rid = dni_rid;
        this.nom_rid = nom_rid;
        this.ape_rid = ape_rid;
        this.tlf_rid = tlf_rid;
        this.mail_rid = mail_rid;
        this.pw_rid = pw_rid;
        this.img_rid = img_rid;
    }
    public String getDni_rid() {
        return dni_rid;
    }
    public void setDni_rid(String dni_rid) {
        this.dni_rid = dni_rid;
    }
    public String getNom_rid() {
        return nom_rid;
    }
    public void setNom_rid(String nom_rid) {
        this.nom_rid = nom_rid;
    }
    public String getApe_rid() {
        return ape_rid;
    }
    public void setApe_rid(String ape_rid) {
        this.ape_rid = ape_rid;
    }
    public String getTlf_rid() {
        return tlf_rid;
    }
    public void setTlf_rid(String tlf_rid) {
        this.tlf_rid = tlf_rid;
    }
    public String getMail_rid() {
        return mail_rid;
    }
    public void setMail_rid(String mail_rid) {
        this.mail_rid = mail_rid;
    }
    public String getPw_rid() {
        return pw_rid;
    }
    public void setPw_rid(String pw_rid) {
        this.pw_rid = pw_rid;
    }
    public String getImg_rid() {
        return img_rid;
    }
    public void setImg_rid(String img_rid) {
        this.img_rid = img_rid;
    }


}