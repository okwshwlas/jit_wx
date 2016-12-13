package dogo.model;

public class CrjWxGrxx {
    private String id;

    private String openid;

    private String zjxxflag;

    private String bsjdflag;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getOpenid() {
        return openid;
    }

    public void setOpenid(String openid) {
        this.openid = openid == null ? null : openid.trim();
    }

    public String getZjxxflag() {
        return zjxxflag;
    }

    public void setZjxxflag(String zjxxflag) {
        this.zjxxflag = zjxxflag == null ? null : zjxxflag.trim();
    }

    public String getBsjdflag() {
        return bsjdflag;
    }

    public void setBsjdflag(String bsjdflag) {
        this.bsjdflag = bsjdflag == null ? null : bsjdflag.trim();
    }
}