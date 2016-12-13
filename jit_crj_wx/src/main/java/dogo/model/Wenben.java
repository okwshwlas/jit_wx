package dogo.model;

public class Wenben {
    private String id;

    private String keywordId;

    private String neirong;
    
    private Keywords keywords;

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

    public String getKeywordId() {
        return keywordId;
    }

    public void setKeywordId(String keywordId) {
        this.keywordId = keywordId == null ? null : keywordId.trim();
    }

    public String getNeirong() {
        return neirong;
    }

    public void setNeirong(String neirong) {
        this.neirong = neirong == null ? null : neirong.trim();
    }
}