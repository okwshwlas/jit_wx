package dogo.model;

public class Function {
    private String functionid;

    private String parentfunction;

    private String functionname;

    private String functionurl;

    private String functiontarget;

    private String functiondesc;

    private String functionorder;

    public String getFunctionid() {
        return functionid;
    }

    public void setFunctionid(String functionid) {
        this.functionid = functionid == null ? null : functionid.trim();
    }

    public String getParentfunction() {
        return parentfunction;
    }

    public void setParentfunction(String parentfunction) {
        this.parentfunction = parentfunction == null ? null : parentfunction.trim();
    }

    public String getFunctionname() {
        return functionname;
    }

    public void setFunctionname(String functionname) {
        this.functionname = functionname == null ? null : functionname.trim();
    }

    public String getFunctionurl() {
        return functionurl;
    }

    public void setFunctionurl(String functionurl) {
        this.functionurl = functionurl == null ? null : functionurl.trim();
    }

    public String getFunctiontarget() {
        return functiontarget;
    }

    public void setFunctiontarget(String functiontarget) {
        this.functiontarget = functiontarget == null ? null : functiontarget.trim();
    }

    public String getFunctiondesc() {
        return functiondesc;
    }

    public void setFunctiondesc(String functiondesc) {
        this.functiondesc = functiondesc == null ? null : functiondesc.trim();
    }

    public String getFunctionorder() {
        return functionorder;
    }

    public void setFunctionorder(String functionorder) {
        this.functionorder = functionorder == null ? null : functionorder.trim();
    }
}