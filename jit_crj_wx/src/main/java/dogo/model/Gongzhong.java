package dogo.model;

public class Gongzhong {
    private String id;

    private String account;

    private String token;

    private String weixin;

    private String accountDepict;

    private String accountAppid;

    private String accountAppsecret;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account == null ? null : account.trim();
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token == null ? null : token.trim();
    }

    public String getWeixin() {
        return weixin;
    }

    public void setWeixin(String weixin) {
        this.weixin = weixin == null ? null : weixin.trim();
    }

    public String getAccountDepict() {
        return accountDepict;
    }

    public void setAccountDepict(String accountDepict) {
        this.accountDepict = accountDepict == null ? null : accountDepict.trim();
    }

    public String getAccountAppid() {
        return accountAppid;
    }

    public void setAccountAppid(String accountAppid) {
        this.accountAppid = accountAppid == null ? null : accountAppid.trim();
    }

    public String getAccountAppsecret() {
        return accountAppsecret;
    }

    public void setAccountAppsecret(String accountAppsecret) {
        this.accountAppsecret = accountAppsecret == null ? null : accountAppsecret.trim();
    }
}