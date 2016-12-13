package dogo.model;

public class SysCode {
    private String id;

    private String codeid;

    private String xzqhId;

    private String cyear;

    private String type;

    private String riqi;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getCodeid() {
        return codeid;
    }

    public void setCodeid(String codeid) {
        this.codeid = codeid == null ? null : codeid.trim();
    }

    public String getXzqhId() {
        return xzqhId;
    }

    public void setXzqhId(String xzqhId) {
        this.xzqhId = xzqhId == null ? null : xzqhId.trim();
    }

    public String getCyear() {
        return cyear;
    }

    public void setCyear(String cyear) {
        this.cyear = cyear == null ? null : cyear.trim();
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    public String getRiqi() {
        return riqi;
    }

    public void setRiqi(String riqi) {
        this.riqi = riqi == null ? null : riqi.trim();
    }
}