package dogo.model;

public class SysOrganization {
    private String id;

    private String jgdwName;

    private String xzqhId;

    private String jgdwLatitude;

    private String jgdwLongitude;

    private String jgdwTxm;

    private Object jgdwBz;

    private String jgdwBz1;

    private String jgdwOrder;
    
    //	sql.append(" wt.id, wt.start_time as startTime, wt.end_time as endTime, wt.yyzl, wt.yysl, wt.sysl, wt.riqi, wt.week ");
	
    private String wtid;
    
    private String startTime;
    
    private String endTime;
    
    private String yyzl;
    
    private String yysl;
    
    private String sysl;
    
    private String riqi;
    
    private String week;
    
    private String jgdwId;
    
    private String latitude;
    
    private String longitude;
    
    public String getJgdwId() {
		return jgdwId;
	}

	public void setJgdwId(String jgdwId) {
		this.jgdwId = jgdwId;
	}

	public String getLatitude() {
		return latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

	public String getLongitude() {
		return longitude;
	}

	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}

	public String getWtid() {
		return wtid;
	}

	public void setWtid(String wtid) {
		this.wtid = wtid;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public String getYyzl() {
		return yyzl;
	}

	public void setYyzl(String yyzl) {
		this.yyzl = yyzl;
	}

	public String getYysl() {
		return yysl;
	}

	public void setYysl(String yysl) {
		this.yysl = yysl;
	}

	public String getSysl() {
		return sysl;
	}

	public void setSysl(String sysl) {
		this.sysl = sysl;
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

	public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getJgdwName() {
        return jgdwName;
    }

    public void setJgdwName(String jgdwName) {
        this.jgdwName = jgdwName == null ? null : jgdwName.trim();
    }

    public String getXzqhId() {
        return xzqhId;
    }

    public void setXzqhId(String xzqhId) {
        this.xzqhId = xzqhId == null ? null : xzqhId.trim();
    }

    public String getJgdwLatitude() {
        return jgdwLatitude;
    }

    public void setJgdwLatitude(String jgdwLatitude) {
        this.jgdwLatitude = jgdwLatitude == null ? null : jgdwLatitude.trim();
    }

    public String getJgdwLongitude() {
        return jgdwLongitude;
    }

    public void setJgdwLongitude(String jgdwLongitude) {
        this.jgdwLongitude = jgdwLongitude == null ? null : jgdwLongitude.trim();
    }

    public String getJgdwTxm() {
        return jgdwTxm;
    }

    public void setJgdwTxm(String jgdwTxm) {
        this.jgdwTxm = jgdwTxm == null ? null : jgdwTxm.trim();
    }

    public Object getJgdwBz() {
        return jgdwBz;
    }

    public void setJgdwBz(Object jgdwBz) {
        this.jgdwBz = jgdwBz;
    }

    public String getJgdwBz1() {
        return jgdwBz1;
    }

    public void setJgdwBz1(String jgdwBz1) {
        this.jgdwBz1 = jgdwBz1 == null ? null : jgdwBz1.trim();
    }

    public String getJgdwOrder() {
        return jgdwOrder;
    }

    public void setJgdwOrder(String jgdwOrder) {
        this.jgdwOrder = jgdwOrder == null ? null : jgdwOrder.trim();
    }
}