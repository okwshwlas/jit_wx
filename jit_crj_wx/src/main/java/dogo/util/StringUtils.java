/**
 * 
 */
package dogo.util;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

/**
 * @ClassName: StringUtils.java
 * @Company: JIT Northeast R & D 
 * @Description: TODO
 * @author  ZGJ
 * @date  2014年10月16日
 */
public class StringUtils {
	
	/**
	 * object转string
	 */
	public static String objectToString(Object obj) {
        return (obj == null) ? "" : obj.toString().trim();
	}
	
	/**
	 * object转Double
	 */
	public static Double objectToDouble(Object obj) {
        return (obj == null) ? null : Double.valueOf(String.valueOf(obj));
	}
	
	/**
	 * object转Short
	 */
	public static Short objectToShort(Object obj) {
        return (obj == null) ? null : Short.valueOf(String.valueOf(obj));
	}
	
	/**
	 * String转Integer
	 */
	public static Integer stringToInteger(String str) {
		Integer ret = 0;
		try
		{
			ret = (str == null || "".equals(str) || "null".equals(str)) ? Integer.valueOf("0") : Integer.valueOf(str);
		} catch(Exception e) {
			System.out.println(e.toString());
		}
		return ret;
	}
	
	
	public static String randomCode(){
		String[] beforeShuffle = new String[] {"1","2","3","4","5","6","7", 
				"8","9","0"}; 
		List<?> list = Arrays.asList(beforeShuffle); 
		Collections.shuffle(list);
		StringBuilder sb = new StringBuilder(); 
		for (int i = 0; i < list.size(); i++) { 
			sb.append(list.get(i));
		}
		String afterShuffle = sb.toString(); 
		String result = afterShuffle.substring(5, 9); 
		return result;
	}
	
}
