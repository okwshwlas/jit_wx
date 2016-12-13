package dogo.model;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by lyh on 2016/12/6.
 */
public class CrjLstdYwInfo  {

	  private static final long serialVersionUID = 1L;
	    private String id;			//id
	    private String ywbh;		//业务编号
	    private String ywType;		//业务类型
	    private String ywzt;		//业务状态 0:待审核 1：审核通过 2：审核未通过 3：取消预约  4：草稿 5：已办理
	    private String remarks;		//文字描述
	    private String jgbh;		//机构编号
	    private String jgdz;        //机构地址
	    private String xxr1;		//偕行人1
	    private String xxr2;		//偕行人2
	    private String xxr3;		//偕行人3
	    private String sfzhm;		//身份证号码
	    private String openid;		//openId
	    private String ywly;		//业务来源
	    private Date createDate;	//创建时间
	    private List<CrjLstdYwFjxx> fjxxList = new ArrayList<CrjLstdYwFjxx>();
	    private String spyj;        //审批意见
	    private String lxr;         //联系人
	    private String lxdh;        //联系电话
	    private String wz;          //位置
	    private String ck;          //窗口
	    public String getId() {
			return id;
		}
		public void setId(String id) {
			this.id = id;
		}
		public String getYwbh() {
			return ywbh;
		}
		public void setYwbh(String ywbh) {
			this.ywbh = ywbh;
		}
		public String getYwType() {
			return ywType;
		}
		public void setYwType(String ywType) {
			this.ywType = ywType;
		}
		public String getYwzt() {
			return ywzt;
		}
		public void setYwzt(String ywzt) {
			this.ywzt = ywzt;
		}
		public String getRemarks() {
			return remarks;
		}
		public void setRemarks(String remarks) {
			this.remarks = remarks;
		}
		public String getJgbh() {
			return jgbh;
		}
		public void setJgbh(String jgbh) {
			this.jgbh = jgbh;
		}
		public String getJgdz() {
			return jgdz;
		}
		public void setJgdz(String jgdz) {
			this.jgdz = jgdz;
		}
		public String getXxr1() {
			return xxr1;
		}
		public void setXxr1(String xxr1) {
			this.xxr1 = xxr1;
		}
		public String getXxr2() {
			return xxr2;
		}
		public void setXxr2(String xxr2) {
			this.xxr2 = xxr2;
		}
		public String getXxr3() {
			return xxr3;
		}
		public void setXxr3(String xxr3) {
			this.xxr3 = xxr3;
		}
		public String getSfzhm() {
			return sfzhm;
		}
		public void setSfzhm(String sfzhm) {
			this.sfzhm = sfzhm;
		}
		public String getOpenid() {
			return openid;
		}
		public void setOpenid(String openid) {
			this.openid = openid;
		}
		public String getYwly() {
			return ywly;
		}
		public void setYwly(String ywly) {
			this.ywly = ywly;
		}
		public Date getCreateDate() {
			return createDate;
		}
		public void setCreateDate(Date createDate) {
			this.createDate = createDate;
		}
		public List<CrjLstdYwFjxx> getFjxxList() {
			return fjxxList;
		}
		public void setFjxxList(List<CrjLstdYwFjxx> fjxxList) {
			this.fjxxList = fjxxList;
		}
		public String getSpyj() {
			return spyj;
		}
		public void setSpyj(String spyj) {
			this.spyj = spyj;
		}
		public String getLxr() {
			return lxr;
		}
		public void setLxr(String lxr) {
			this.lxr = lxr;
		}
		public String getLxdh() {
			return lxdh;
		}
		public void setLxdh(String lxdh) {
			this.lxdh = lxdh;
		}
		public String getWz() {
			return wz;
		}
		public void setWz(String wz) {
			this.wz = wz;
		}
		public String getCk() {
			return ck;
		}
		public void setCk(String ck) {
			this.ck = ck;
		}
		public String getSpRoleId() {
			return spRoleId;
		}
		public void setSpRoleId(String spRoleId) {
			this.spRoleId = spRoleId;
		}
		public static long getSerialversionuid() {
			return serialVersionUID;
		}
		private String spRoleId;    //审批roleid


	  
}
