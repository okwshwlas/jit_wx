package dogo.model;

import java.math.BigDecimal;

public class SysDictionary {
    private String id;

    private String pid;

    private String dicName;

    private String dicCode;

    private BigDecimal dicOrder;

    private BigDecimal dicHierarchy;

    private String dicType;

    private Object dicRemark;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid == null ? null : pid.trim();
    }

    public String getDicName() {
        return dicName;
    }

    public void setDicName(String dicName) {
        this.dicName = dicName == null ? null : dicName.trim();
    }

    public String getDicCode() {
        return dicCode;
    }

    public void setDicCode(String dicCode) {
        this.dicCode = dicCode == null ? null : dicCode.trim();
    }

    public BigDecimal getDicOrder() {
        return dicOrder;
    }

    public void setDicOrder(BigDecimal dicOrder) {
        this.dicOrder = dicOrder;
    }

    public BigDecimal getDicHierarchy() {
        return dicHierarchy;
    }

    public void setDicHierarchy(BigDecimal dicHierarchy) {
        this.dicHierarchy = dicHierarchy;
    }

    public String getDicType() {
        return dicType;
    }

    public void setDicType(String dicType) {
        this.dicType = dicType == null ? null : dicType.trim();
    }

    public Object getDicRemark() {
        return dicRemark;
    }

    public void setDicRemark(Object dicRemark) {
        this.dicRemark = dicRemark;
    }
}