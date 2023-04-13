package com.tablas;

public class Proveedores {
     String cif_prov;
     String razsoc;
     String dir_prov;
     String tlf_prov;
     String mail_prov;
     String pw_prov;
     String img_prov;

    public String getCif_prov() {
        return cif_prov;
    }

    public void setCif_prov(String cif_prov) {
        this.cif_prov = cif_prov;
    }

    public String getRazsoc() {
        return razsoc;
    }

    public void setRazsoc(String razsoc) {
        this.razsoc = razsoc;
    }

    public String getDir_prov() {
        return dir_prov;
    }

    public void setDir_prov(String dir_prov) {
        this.dir_prov = dir_prov;
    }

    public String getTlf_prov() {
        return tlf_prov;
    }

    public void setTlf_prov(String tlf_prov) {
        this.tlf_prov = tlf_prov;
    }

    public String getMail_prov() {
        return mail_prov;
    }

    public void setMail_prov(String mail_prov) {
        this.mail_prov = mail_prov;
    }

    public String getPw_prov() {
        return pw_prov;
    }

    public void setPw_prov(String pw_prov) {
        this.pw_prov = pw_prov;
    }

    public String getImg_prov() {
        return img_prov;
    }

    public void setImg_prov(String img_prov) {
        this.img_prov = img_prov;
    }

    public Proveedores(String cif_prov, String razsoc, String dir_prov, String tlf_prov, String mail_prov, String pw_prov,
            String img_prov) {
        super();
        this.cif_prov = cif_prov;
        this.razsoc = razsoc;
        this.dir_prov = dir_prov;
        this.tlf_prov = tlf_prov;
        this.mail_prov = mail_prov;
        this.pw_prov = pw_prov;
        this.img_prov = img_prov;
    }


}