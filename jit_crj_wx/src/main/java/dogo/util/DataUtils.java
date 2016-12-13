/**
 * 
 */
package dogo.util;

import java.text.Format;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;
import java.util.TimeZone;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * @Project:  mwzjxxSVN_a
 * @ClassName: DataUtils.java
 * @Company: JIT Northeast R & D 
 * @Description: TODO
 * @author  yuguoliang
 * @date  2014年9月16日
 */
public class DataUtils {
	// 精确到毫秒
	private final static String dateTimeZoneFormat = "yyyy-MM-dd HH:mm:ss.SSS";
	private static SimpleDateFormat datetimezoneFormatter = new SimpleDateFormat(
			dateTimeZoneFormat);
	private static DataUtils instances = new DataUtils();
	public static DataUtils getInstance() {
		return instances;
	}


	private final static String dateTimeFormat = "yyyy-MM-dd HH:mm:ss";
	
	private static SimpleDateFormat dateFormatter = new SimpleDateFormat(
			dateTimeFormat);
	
	/**
	 * 按固定格式转换时间日期字符串
	 * 
	 * @param date
	 *            时间日期字符串
	 * @return 转换后的时间日期字符串
	 */
	public static Date dateStringToDate(String date) {
		Date d = new Date();
		try {
			d = dateFormatter.parse(date);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return d;
	}

	/**
     * 计算间隔天数后的日期
     * @param date
     * @param intBetween
     * @return
     * @pre date != null
     */
    public static Date getDateBetween(Date date, int intBetween) {
        Calendar calo = Calendar.getInstance();
        calo.setTime(date);
        calo.add(Calendar.DATE, intBetween);
        return calo.getTime();
    }
    
	/**
	 * 获得系统时间
	 * @return
	 */
	public static String systemDateTime() {
		TimeZone tz = TimeZone.getTimeZone("Asia/Shanghai"); 
		TimeZone.setDefault(tz);
		Date date = new Date();
		Format format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss",Locale.CHINA);
		String dataTime = format.format(date);
		return dataTime;
	}
	
	/**
	 * 获得系统日期
	 * @return
	 */
	public static String systemDate() {
		TimeZone tz = TimeZone.getTimeZone("Asia/Shanghai"); 
		TimeZone.setDefault(tz);
		Date date = new Date();
		Format format = new SimpleDateFormat("yyyy-MM-dd",Locale.CHINA);
		String dataTime = format.format(date);
		return dataTime;
	}
	
	/**
     * 
     * @param date 日期
     * @param formater 类型
     * @return
     */
	public static String formaterDate(Date date, String formater) {
		if (date == null) {
			return "";
		}
		if (formater == null || "".equals(formater)) {
			formater = "yyyy-MM-dd";
		}
		SimpleDateFormat sdf = new SimpleDateFormat(formater);
		return sdf.format(date);
	}

	/**
     * 
     * @param date 日期
     * @param formater 类型
     * @return
     */
	public static int getMaxDaysOfTheMonth(int year, int month) {
		Calendar cal = Calendar.getInstance();  
		cal.set(Calendar.YEAR, year);  
		cal.set(Calendar.MONTH, month - 1);  
		cal.set(Calendar.DATE, 1);  
		cal.roll(Calendar.DATE, -1);  
		int maxDate = cal.get(Calendar.DATE);  
		return maxDate;
	}

	/**
	 * 该日期是本周的第几天
	 * @param year 年
	 * @param month 月
	 * @param day 日
	 * @throws ParseException 
	 * @throws Exception
	 */
	public static int getDayOfTheWeek(int year, int month, int day) {
		Calendar cal = Calendar.getInstance();  
		cal.set(Calendar.YEAR, year);  
		cal.set(Calendar.MONTH, month - 1);  
		cal.set(Calendar.DATE, day);  
		//cal.roll(Calendar.DATE, -1);  
		int days = cal.get(Calendar.DAY_OF_WEEK);  
		return days;
	}
	/**
	 * 时间日期字符串转换固定格式
	 * 
	 * @param date
	 *            时间日期
	 * @return 固定格式  如：20130730142134625
	 */
	public static Long dateToDateTimeZoneLong(Date date) {
		Long l = null;
		try {
			l = new Long(filterUnNumber(datetimezoneFormatter
					.format(date)));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return l;
	}
	
	/**
	 * 
	 * @param str
	 *            需要过滤的字符串
	 * @return
	 * @Description:过滤数字以外的字符
	 */
	private static String filterUnNumber(String str) {
		// 只允数字
		String regEx = "[^0-9]";
		Pattern p = Pattern.compile(regEx);
		Matcher m = p.matcher(str);
		// 替换与模式匹配的所有字符（即非数字的字符将被""替换）
		return m.replaceAll("").trim();
	}

	
}
