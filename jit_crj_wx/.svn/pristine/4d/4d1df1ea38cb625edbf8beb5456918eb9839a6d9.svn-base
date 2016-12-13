package dogo.Interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import dogo.model.User;

/*
 HandlerInterceptor1 preHandle  
 HandlerInterceptor2 preHandle  

 HandlerInterceptor2 postHandle  
 HandlerInterceptor1 postHandle  

 HandlerInterceptor2 afterCompletion  
 HandlerInterceptor1 afterCompletion  
 执行顺序为xml中mvc:interceptors里各个拦截器声明的上下顺序
 
 哪个拦截器的preHandle返回false,则该拦截器的postHandle,afterCompletion将禁用
 如果拦截器1的preHandle返回false,那么请求全程只会执行拦截器1的preHandle方法
 如果只有拦截器2的preHandle返回false，那么请求会先执行拦截器1的preHandle,拦截器2的preHandle
 最后执行拦截器1的afterCompletion
 */
public class LogInterceptor implements HandlerInterceptor {
	/**
	 * 该方法将在整个请求完成之后，也就是说在视图渲染之后进行调用，主要用于进行一些资源的释放
	 */
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object o, Exception e)
			throws Exception {
		System.out.println("日志拦截-渲染完成之后");

	}

	/**
	 * 这个方法只会在当前这个Interceptor的preHandle方法返回值为true的时候才会执行。postHandle是进行处理器拦截用的，
	 * 它的执行时间是在处理器进行处理之
	 * 后，也就是在Controller的方法调用之后执行，但是它会在DispatcherServlet进行视图的渲染之前执行
	 * ，也就是说在这个方法中你可以对ModelAndView进行操
	 * 作。这个方法的链式结构跟正常访问的方向是相反的，也就是说先声明的Interceptor拦截器该方法反而会后调用
	 * ，这跟Struts2里面的拦截器的执行过程有点像，
	 * 只是Struts2里面的intercept方法中要手动的调用ActionInvocation的invoke方法
	 * ，Struts2中调用ActionInvocation的invoke方法就是调用下一个Interceptor
	 * 或者是调用action，然后要在Interceptor之前调用的内容都写在调用invoke之前
	 * ，要在Interceptor之后调用的内容都写在调用invoke方法之后。
	 * 
	 * 注：如果Controller方法的返回是boolean类型，不需要DispatcherServlet进行视图渲染，
	 * 则postHandle无法拦截到该请求
	 * postHandle只能拦截到需要经过DispatcherServlet进行渲染的请求,如返回值是Map,List
	 * ,String类型的Controller方法
	 */

	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object o, ModelAndView m)
			throws Exception {
		System.out.println("日志拦截-控制器完成后渲染操作之前");

	}

	/**
	 * preHandle方法是进行处理器拦截用的，顾名思义，该方法将在Controller处理之前进行调用，
	 * SpringMVC中的Interceptor拦截器是链式的，可以同时存在
	 * 多个Interceptor，然后SpringMVC会根据声明的前后顺序一个接一个的执行
	 * ，而且所有的Interceptor中的preHandle方法都会在
	 * Controller方法调用之前调用。SpringMVC的这种Interceptor链式结构也是可以进行中断的
	 * ，这种中断方式是令preHandle的返 回值为false，当preHandle的返回值为false的时候该拦截器的post,after方法
	 * 以及后续拦截器相关的postHandle的处理流程就结束了。
	 */
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object o) throws Exception {
		System.out.println("日志拦截-控制器操作之前");
		System.out.println(request.getRequestURI());
		System.out.println(request.getRequestURL());
		System.out.println(request.getRequestURL().substring(
				request.getRequestURL().lastIndexOf("/") + 1));
		User u = (User) request.getSession().getAttribute("loginUser");
		if (u != null) {
			System.out.println(u.getUsername());
		}
		return true;
	}
}
