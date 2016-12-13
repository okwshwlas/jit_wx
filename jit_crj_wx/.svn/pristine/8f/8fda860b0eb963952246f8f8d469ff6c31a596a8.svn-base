package dogo.modeljson;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import net.sf.json.JsonConfig;
import net.sf.json.processors.JsonValueProcessor;

/**
 * date转换
 * @Project:  jit_crj
 * @ClassName: JsonDateValueProcessor.java
 * @Company: JIT Northeast R & D 
 * @Description: TODO
 * @author  Administrator
 * @date  2015年12月24日
 */
public class JsonDateValueProcessor implements JsonValueProcessor {
	
	private String format ="yyyy-MM-dd";  

	public JsonDateValueProcessor() {  
		super();  
	}

	public JsonDateValueProcessor(String format) {  
		super();  
		this.format = format;  
	}
	

	public Object processArrayValue(Object paramObject,JsonConfig paramJsonConfig) {  
		return process(paramObject);  
	}
	

	public Object processObjectValue(String paramString, Object paramObject,JsonConfig paramJsonConfig) {  
		return process(paramObject);  
	}

	private Object process(Object value){  
		if(value instanceof Date){    
			SimpleDateFormat sdf = new SimpleDateFormat(format,Locale.CHINA);    
			return sdf.format(value);  
		}    
		return value == null ? "" : value.toString();    
	}
}
