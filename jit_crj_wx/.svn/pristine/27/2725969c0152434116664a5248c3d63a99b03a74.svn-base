package dogo.util;

import java.math.BigDecimal;

/**
 * EasyUI 默认参数 page,rows
 * */
public class Page {
	private Integer page=1;// 当前页
	private Integer rows=10;// 每页显示记录数
	private String typeValue; // 查询显示值
	private String typeName; // 查询条件
	private String ids;// 批量删除标识
	private BigDecimal ROWNUM_;// sql查询时,设置返回对象为Vo,分页需要的属性
	private int begin;
	private int end;
	
	private String sort;//排序字段
	
	private String dir;//asc,desc
	

	public BigDecimal getROWNUM_() {
		return ROWNUM_;
	}

	public void setROWNUM_(BigDecimal rOWNUM) {
		ROWNUM_ = rOWNUM;
	}

	public String getTypeValue() {
		return typeValue;
	}

	public int getBegin() {
		return (page - 1) * rows;
	}

	public int getEnd() {
		return page*rows;
	}

	public void setTypeValue(String typeValue) {
		this.typeValue = typeValue;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getRows() {
		return rows;
	}

	public void setRows(Integer rows) {
		this.rows = rows;
	}

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public String getDir() {
		return dir;
	}

	public void setDir(String dir) {
		this.dir = dir;
	}

	public void setBegin(int begin) {
		this.begin = begin;
	}

	public void setEnd(int end) {
		this.end = end;
	}
	
}
