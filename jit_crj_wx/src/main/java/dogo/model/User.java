package dogo.model;

public class User {
    private String userid;

    private String username;

    private String userpwd;

    private String usertel;

    private String usermobiletel;

    private String userstate;

    private String usercode;

    private String userdiqu;

    private String userbmmc;

    private String userdep;
    
    private String rolename;
    
    // 判断是否登陆微信
    private Boolean weixinlogin;

    public Boolean getWeixinlogin() {
		return weixinlogin;
	}

	public void setWeixinlogin(Boolean weixinlogin) {
		this.weixinlogin = weixinlogin;
	}

	public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid == null ? null : userid.trim();
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getUserpwd() {
        return userpwd;
    }

    public void setUserpwd(String userpwd) {
        this.userpwd = userpwd == null ? null : userpwd.trim();
    }

    public String getUsertel() {
        return usertel;
    }

    public void setUsertel(String usertel) {
        this.usertel = usertel == null ? null : usertel.trim();
    }

    public String getUsermobiletel() {
        return usermobiletel;
    }

    public void setUsermobiletel(String usermobiletel) {
        this.usermobiletel = usermobiletel == null ? null : usermobiletel.trim();
    }

    public String getUserstate() {
        return userstate;
    }

    public void setUserstate(String userstate) {
        this.userstate = userstate == null ? null : userstate.trim();
    }

    public String getUsercode() {
        return usercode;
    }

    public void setUsercode(String usercode) {
        this.usercode = usercode == null ? null : usercode.trim();
    }

    public String getUserdiqu() {
        return userdiqu;
    }

    public void setUserdiqu(String userdiqu) {
        this.userdiqu = userdiqu == null ? null : userdiqu.trim();
    }

    public String getUserbmmc() {
        return userbmmc;
    }

    public void setUserbmmc(String userbmmc) {
        this.userbmmc = userbmmc == null ? null : userbmmc.trim();
    }

    public String getUserdep() {
        return userdep;
    }

    public void setUserdep(String userdep) {
        this.userdep = userdep == null ? null : userdep.trim();
    }

	public String getRolename() {
		return rolename;
	}

	public void setRolename(String rolename) {
		this.rolename = rolename;
	}
}