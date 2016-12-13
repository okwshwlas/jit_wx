package dogo.model;

/**
 * 预约时间bean
 * 
 * @Project: jit_crj
 * @ClassName: YuYueBean.java
 * @author zhang
 * @date 2015年12月28日
 */
public class YuYueRiqiBean {
	// 预约时间id
	private String id;
	// 预约日期
	private String riqi;
	// 星期
	private String week;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getRiqi() {
		return riqi;
	}

	public void setRiqi(String riqi) {
		this.riqi = riqi;
	}

	public String getWeek() {
		return week;
	}

	public void setWeek(String week) {
		this.week = week;
	}

}
