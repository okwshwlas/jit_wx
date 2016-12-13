package dogo.model;

public class SysWorkdaySample {
    private String id;

    private String year;

    private String quarter;

    private String month;

    private String week;

    private String day;

    private String isworkday;

    private String useflag;

    private String publicflag;

    private Object commonmadedate;

    private Object commonmodifydate;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year == null ? null : year.trim();
    }

    public String getQuarter() {
        return quarter;
    }

    public void setQuarter(String quarter) {
        this.quarter = quarter == null ? null : quarter.trim();
    }

    public String getMonth() {
        return month;
    }

    public void setMonth(String month) {
        this.month = month == null ? null : month.trim();
    }

    public String getWeek() {
        return week;
    }

    public void setWeek(String week) {
        this.week = week == null ? null : week.trim();
    }

    public String getDay() {
        return day;
    }

    public void setDay(String day) {
        this.day = day == null ? null : day.trim();
    }

    public String getIsworkday() {
        return isworkday;
    }

    public void setIsworkday(String isworkday) {
        this.isworkday = isworkday == null ? null : isworkday.trim();
    }

    public String getUseflag() {
        return useflag;
    }

    public void setUseflag(String useflag) {
        this.useflag = useflag == null ? null : useflag.trim();
    }

    public String getPublicflag() {
        return publicflag;
    }

    public void setPublicflag(String publicflag) {
        this.publicflag = publicflag == null ? null : publicflag.trim();
    }

    public Object getCommonmadedate() {
        return commonmadedate;
    }

    public void setCommonmadedate(Object commonmadedate) {
        this.commonmadedate = commonmadedate;
    }

    public Object getCommonmodifydate() {
        return commonmodifydate;
    }

    public void setCommonmodifydate(Object commonmodifydate) {
        this.commonmodifydate = commonmodifydate;
    }
}