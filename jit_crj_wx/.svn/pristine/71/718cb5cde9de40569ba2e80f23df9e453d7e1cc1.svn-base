package dogo.util;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.TimeZone;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sun.misc.BASE64Encoder;

/**
 * 基础工具类
 *
 */
public class Params {

	// 向请求端发送返回数据
	public static void print(String content, HttpServletResponse response) {
		PrintWriter writer = null;
		try {
			writer = response.getWriter();
			writer.print(content);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			writer.flush();
			writer.close();
		}

	}

	/**
	 * 获得编码
	 * 
	 * @return
	 */
	public static String getCode() {

		TimeZone tz = TimeZone.getTimeZone("Asia/Shanghai");
		TimeZone.setDefault(tz);
		Date date = new Date();
		Format format = new SimpleDateFormat("yyyyMMddHHmmssSSS", Locale.CHINA);
		String code = format.format(date);
		return code;
	}

	/**
	 * 获得系统时间
	 * 
	 * @return
	 */
	public static String systemDateTime() {
		TimeZone tz = TimeZone.getTimeZone("Asia/Shanghai");
		TimeZone.setDefault(tz);
		Date date = new Date();
		Format format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss",
				Locale.CHINA);
		String dataTime = format.format(date);
		return dataTime;
	}

	/**
	 * 获得系统日期
	 * 
	 * @return
	 */
	public static String systemDate() {
		TimeZone tz = TimeZone.getTimeZone("Asia/Shanghai");
		TimeZone.setDefault(tz);
		Date date = new Date();
		Format format = new SimpleDateFormat("yyyy-MM-dd", Locale.CHINA);
		String dataTime = format.format(date);
		return dataTime;
	}

	/**
	 * 获得系统时间
	 * 
	 * @return
	 */
	public static String systemDate(String pattern) {
		TimeZone tz = TimeZone.getTimeZone("Asia/Shanghai");
		TimeZone.setDefault(tz);
		Date date = new Date();
		Format format = new SimpleDateFormat(pattern);
		String dataTime = format.format(date);
		return dataTime;
	}

	public static String systemDateForYMD() {
		String year = systemDate("yyyy");
		String month = systemDate("M");
		String day = systemDate("d");
		return year + "年" + month + "月" + day + "日";
	}

	/**
	 * 时间格式转换 如：2012-09-09 —— 2012年09月09日
	 * */
	public static String zhDate(Object obj) {
		String str = obj.toString();
		int count = Params.split(str, "-").length;
		String rq = "";
		if (str != null && str != "" && count != 1) {
			rq = Params.split(str, "-")[0] + "年" + Params.split(str, "-")[1]
					+ "月" + Params.split(str, "-")[2] + "日";
		} else if (count == 1) {
			return str;
		}
		return rq;
	}

	/**
	 * 时间格式转换 如：2012-09-09-09:09 —— 2012年09月09日09时09分
	 * */
	public static String zhsfDate(Object obj) {
		String str = obj.toString();
		int count = Params.split(str, "-").length;
		String rq = "";
		if (str != null && str != "" && count != 1) {
			rq = Params.split(str, "-")[0] + "年" + Params.split(str, "-")[1]
					+ "月" + Params.split(Params.split(str, " ")[0], "-")[2]
					+ "日" + Params.split(Params.split(str, " ")[1], ":")[0]
					+ "时" + Params.split(Params.split(str, " ")[1], ":")[1]
					+ "分";
		} else if (count == 1) {
			return str;
		}
		return rq;

	}

	/**
	 * 时间格式转换 如：09:09 —— 09时09分
	 * */
	public static String sfDate(Object obj) {

		String str = obj.toString();
		int count = Params.split(str, "-").length;
		String rq = "";
		if (str != null && str != "" && count != 1) {
			rq = Params.split(str, ":")[0] + "时" + Params.split(str, ":")[1]
					+ "分";
		} else if (count == 1) {
			return str;
		}
		return rq;

	}

	/**
	 * 获得本月的星期
	 * 
	 * @return
	 */

	public static String systemWeekDay() {

		Calendar c = Calendar.getInstance();
		c.setTime(new Date());
		int i = c.get(Calendar.DAY_OF_WEEK) - 1;
		String day = "";
		switch (i) {
		case 0:
			day = "星期日";
			break;
		case 1:
			day = "星期一";
			break;
		case 2:
			day = "星期二";
			break;
		case 3:
			day = "星期三";
			break;
		case 4:
			day = "星期四";
			break;
		case 5:
			day = "星期五";
			break;
		case 6:
			day = "星期六";
			break;
		default:
			day = "";
		}

		return day;
	}

	/**
	 * 将字符串转换成数组
	 */

	public static String[] split(String args, String str) {
		if (args == null || "".equals(args)) {
			return new String[0];
		}
		List<String> list = new ArrayList<String>();
		if (args.indexOf(str) == -1) {
			String[] s = new String[1];
			s[0] = args;
			return s;
		}
		if (args.substring(args.length() - 1).equals(str)) {
			args = args.substring(0, args.length() - 1);
		}
		while (true) {
			if (args.indexOf(str) != -1) {
				list.add(args.substring(0, args.indexOf(str)));
				args = args.substring(args.indexOf(str) + 1);
			} else {
				list.add(args);
				String[] s = new String[list.size()];
				for (int i = 0; i < list.size(); i++) {
					s[i] = (String) list.get(i);
				}
				return s;
			}
		}
	}

	/**
	 * 获得访问IP
	 * 
	 * @param request
	 * @return
	 */
	public static String getIP(HttpServletRequest request) {
		return request.getRemoteAddr();
	}

	public static String addStr(int num, String str) {
		String newStr = str;
		for (int i = 0; i < num; i++) {
			newStr += str;
		}
		return newStr;

	}

	/**
	 * 按照arg格式替换成arg1
	 * 
	 * @param arg
	 * @param args1
	 * @param str
	 *            分割符
	 * @return
	 */
	public static String replaceFormat(String arg, String arg1, String str) {
		String[] args = Params.split(arg, str);
		String newStr = "";
		for (int i = 0; i < args.length; i++) {
			newStr += Params.addStr(i, arg1) + str;
		}
		if ("".equals(newStr)) {
			return arg;
		} else {
			return newStr;
		}

	}

	/**
	 * 特殊符号处理
	 * 
	 * @param String
	 * @return String
	 */
	public static String specialSymbols(String str) {

		if (str.indexOf("<", 1) > 0) {

			str = str.replaceAll("<", "&lt;");

		} else if (str.indexOf(">", 1) > 0) {

			str = str.replaceAll(">", "&gt;");

		} else if (str.indexOf("&", 1) > 0) {

			str = str.replaceAll("&", "&amp;");

		} else if (str.indexOf("'", 1) > 0) {

			str = str.replaceAll("'", "&apos;");

		} else if (str.indexOf("\"", 1) > 0) {

			str = str.replaceAll("\"", "&quot;");

		}

		return str;
	}

	public static String trim(String arg) {
		String str = "";
		for (int i = 0; i < arg.length(); i++) {
			if (arg.charAt(i) != ' ') {
				str += String.valueOf(arg.charAt(i));
			}
		}

		return str;
	}

	/**
	 * 特殊符号处理
	 * 
	 * @param 数据库BLOB
	 *            存的二进制流文件
	 * @return String
	 */

	public static String ioToBase64(InputStream inBlob) throws IOException {
		String strBase64 = null;
		try {

			InputStream in = inBlob;
			// in.available()返回文件的字节长度
			byte[] bytes = new byte[in.available()];
			// 将文件中的内容读入到数组中
			in.read(bytes);
			strBase64 = new BASE64Encoder().encode(bytes); // 将字节流数组转换为字符串
			in.close();
		} catch (FileNotFoundException fe) {
			fe.printStackTrace();
		} catch (IOException ioe) {
			ioe.printStackTrace();
		}
		return strBase64;
	}

	/**
	 * 折算
	 */
	public static String conver(double base, double scale) {
		DecimalFormat df = new DecimalFormat("#.##");
		return df.format((base / scale) * ((double) 100)) + "%";
	}

	public static String conver(String str) {
		DecimalFormat df = new DecimalFormat("#.##");
		return df.format(Double.parseDouble(str)) + "%";
	}
	
	public static List listPage(int totalCount, int endNum, int startNum, List obj)
	  {
	    int pageCount = 0;

	    if (totalCount % endNum > 0)
	    {
	      pageCount = totalCount / endNum + 1;
	    }
	    else {
	      pageCount = totalCount / endNum;
	    }
	    if ((totalCount > 0) && 
	      (startNum <= pageCount)) {
	      if (startNum == 1)
	      {
	        if (totalCount <= endNum)
	        {
	          obj = obj.subList(0, totalCount);
	        }
	        else obj = obj.subList(0, endNum);
	      }
	      else
	      {
	        int fromIndex = (startNum - 1) * endNum;

	        int toIndex = startNum * endNum;

	        if ((totalCount - toIndex) % endNum >= 0)
	          toIndex = startNum * endNum;
	        else {
	          toIndex = (startNum - 1) * endNum + 
	            totalCount % endNum;
	        }
	        if (totalCount >= toIndex) {
	          obj = obj.subList(fromIndex, toIndex);
	        }
	      }

	    }

	    return obj;
	  }

}
