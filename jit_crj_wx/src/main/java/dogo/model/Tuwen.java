package dogo.model;

import java.util.List;

public class Tuwen {
    private String id;

    private String title;

    private String url;

    private String link;

    private String miaoshu;

    private String neirong;

    private String parentId;

    private String keywordId;
    
    private Keywords keywords;
    
    private List<Tuwen> childList;

    public List<Tuwen> getChildList() {
		return childList;
	}

	public void setChildList(List<Tuwen> childList) {
		this.childList = childList;
	}

	public Keywords getKeywords() {
		return keywords;
	}

	public void setKeywords(Keywords keywords) {
		this.keywords = keywords;
	}

	public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url == null ? null : url.trim();
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link == null ? null : link.trim();
    }

    public String getMiaoshu() {
        return miaoshu;
    }

    public void setMiaoshu(String miaoshu) {
        this.miaoshu = miaoshu == null ? null : miaoshu.trim();
    }

    public String getNeirong() {
        return neirong;
    }

    public void setNeirong(String neirong) {
        this.neirong = neirong == null ? null : neirong.trim();
    }

    public String getParentId() {
        return parentId;
    }

    public void setParentId(String parentId) {
        this.parentId = parentId == null ? null : parentId.trim();
    }

    public String getKeywordId() {
        return keywordId;
    }

    public void setKeywordId(String keywordId) {
        this.keywordId = keywordId == null ? null : keywordId.trim();
    }
}