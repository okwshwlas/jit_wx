package dogo.util;

import javax.servlet.ServletContext;
import javax.servlet.jsp.PageContext;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;


/**
 * spring 上下文工具类
 * @author Administrator
 *
 */
public class ApplicationContextUtil  {

	
	/**
	 * 获取上下文对象
	 * @param pageContext
	 * @return
	 */
	public static WebApplicationContext getWebApplicationContext(PageContext pageContext){
		ServletContext servletContext = pageContext.getServletContext();
		WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(servletContext);
		return wac;
		
	}
}
