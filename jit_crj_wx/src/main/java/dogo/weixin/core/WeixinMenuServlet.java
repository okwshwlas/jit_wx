package dogo.weixin.core;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspFactory;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;

import org.springframework.web.context.WebApplicationContext;

import dogo.model.CustomMenu;
import dogo.model.Gongzhong;
import dogo.service.CustomMenuServiceI;
import dogo.service.GongzhongZhanghaoService;
import dogo.util.ApplicationContextUtil;
/**
 * 微信自定义菜单转发servlet
 * @author Administrator
 *
 */
public class WeixinMenuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static CustomMenuServiceI customMenuServiceI;
	
	private static GongzhongZhanghaoService gongzhongZhanghaoService;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		doPost(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		//String realPath = "http://" + request.getServerName() + ":"+ request.getServerPort() + request.getContextPath();
		String id = request.getParameter("id");
		String openid = request.getParameter("openid");//微信用户唯一号
		javax.servlet.jsp.PageContext pageContext = javax.servlet.jsp.JspFactory.getDefaultFactory().getPageContext(this, request, response, null, true, 8192, true);
		WebApplicationContext wac =ApplicationContextUtil.getWebApplicationContext(pageContext);
		customMenuServiceI = (CustomMenuServiceI)wac.getBean("customMenuServiceI");
		gongzhongZhanghaoService = (GongzhongZhanghaoService)wac.getBean("gongzhongZhanghaoService");
		Gongzhong gongzhong = gongzhongZhanghaoService.selectGongzhongZhanghaoById("1");
		CustomMenu customMenu =  customMenuServiceI.selectByPrimaryKey(id);
		request.setAttribute("openid", openid);
		request.setAttribute("title", gongzhong.getAccount());
		request.setAttribute("content", customMenu.getContent());
		RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/proscenium/content.jsp");
		dispatcher.forward(request, response);
		// response.sendRedirect(realPath+"/jsp/weixinneirong.jsp");//重定向

	}

}
