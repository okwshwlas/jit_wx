package dogo.util;

import java.io.UnsupportedEncodingException;

import sun.misc.*;

public class Base64Utils {
	// 加密
	public static String getBase64(String str) {
		byte[] b = null;
		String s = null;
		try {
			b = str.getBytes("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		if (b != null) {
			s = new BASE64Encoder().encode(b);
		}
		return s;
	}

	// 解密
	public static String getFromBase64(String s) {
		byte[] b = null;
		String result = null;
		if (s != null) {
			BASE64Decoder decoder = new BASE64Decoder();
			try {
				b = decoder.decodeBuffer(s);
				result = new String(b, "utf-8");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	public static void main(String[] args) {
		String params = " { " + 
	            "\"touser\":\"orOuKwNU6g-SZb7ASB63YO4K1op4\","+
	            "\"template_id\":\"OrcXU1L4mCQsO1hjgcGd7G3jzjKxrzkXehBq48usm5c\","+
	            "\"url\":\"\"," +            
	            "\"data\":{ " + 
	                   "\"first\": { " + 
	                       "\"value\":\"恭喜你购买成功！\"," +
	                       "\"color\":\"#173177\"" +
	                   "}," + 
	                   "\"keyword1\":{" +
	                       "\"value\":\"巧克力1\","+
	                       "\"color\":\"#173177\""+
	                   "}," +
	                   "\"keyword2\":{" +
	                       "\"value\":\"巧克力2\","+
	                       "\"color\":\"#173177\""+
                       "}," +
                       "\"keyword3\":{" +
	                       "\"value\":\"巧克力3\","+
	                       "\"color\":\"#173177\""+
                       "}," +
                       "\"keyword4\":{" +
	                       "\"value\":\"巧克力4\","+
	                       "\"color\":\"#173177\""+
                       "}" +
		            "}" +
		        "}";
		
		System.out.println(getBase64(params));
		System.out.println(getFromBase64(getBase64(params)));
	}
}