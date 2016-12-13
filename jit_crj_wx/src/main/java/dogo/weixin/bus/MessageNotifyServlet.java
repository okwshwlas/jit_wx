package dogo.weixin.bus;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.springframework.web.context.WebApplicationContext;

import com.alibaba.fastjson.JSON;

import dogo.model.Gongzhong;
import dogo.modeljson.BaseJson;
import dogo.service.GongzhongZhanghaoService;
import dogo.service.MessageNotifyServiceI;
import dogo.util.ApplicationContextUtil;
import dogo.util.Base64Utils;
import dogo.weixin.core.WeiXinUtil;

/**
 * 证件业务消息提醒服务
 * @author cjl
 */
public class MessageNotifyServlet extends HttpServlet {
	private static final long serialVersionUID = -4934449866649771838L;
	private WeiXinUtil weiXinUtil = new WeiXinUtil();
	public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8"); //设置编码格式
		response.setContentType("text/html");   //设置数据格式
		PrintWriter out = response.getWriter();
		BaseJson baseJson = new BaseJson();
		String nowDate = (new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(new Date());//系统当前时间
		String paramsEncode = request.getParameter("params");//消息模版的JSON字符串（base64加密）
		String fromName = request.getParameter("fromName");//消息来源 1:出入境 2：大平台 3：法治
		//paramsEncode = "ewogICAgInRvdXNlciI6ICJvck91S3dOVTZnLVNaYjdBU0I2M1lPNEsxb3A0IiwKICAgICJ0ZW1wbGF0ZV9pZCI6ICJwSmwxelBRdFFxX1VKeEtVcGNoRU9iMlpoYndaWU1TMGV0QUtGbTlHSVVvIiwKICAgICJ1cmwiOiAiIiwKICAgICJkYXRhIjogewogICAgICAgICJmaXJzdCI6IHsKICAgICAgICAgICAgInZhbHVlIjogIuaCqOWlve+8jOaCqOacieWNs+WwhuWIsOacn+eahOWHuuWFpeWig+ivgeS7tu+8jOivt+WPiuaXtuWwsei/keeahOWFrOWuieWHuuWFpeWig+euoeeQhumDqOmXqOWPiuaXtuabtOaNouivgeS7tuOAguivgeS7tuS/oeaBr+WmguS4i++8miIsCiAgICAgICAgICAgICJjb2xvciI6ICIjMTczMTc3IgogICAgICAgIH0sCiAgICAgICAgImtleXdvcmQxIjogewogICAgICAgICAgICAidmFsdWUiOiAi5aSn6ZmG5bGF5rCR5b6A5p2l5Y+w5rm+6YCa6KGM6K+BIiwKICAgICAgICAgICAgImNvbG9yIjogIiMxNzMxNzciCiAgICAgICAgfSwKICAgICAgICAia2V5d29yZDIiOiB7CiAgICAgICAgICAgICJ2YWx1ZSI6ICIyMDE25bm0MTHmnIg15pelIiwKICAgICAgICAgICAgImNvbG9yIjogIiMxNzMxNzciCiAgICAgICAgfSwKICAgICAgICAicmVtYXJrIjogewogICAgICAgICAgICAidmFsdWUiOiAi5YW25LuW5Ye65YWl5aKD5pyN5Yqh5LqL6aG577yM6K+35YWz5rOo5ZCJ5p6X5Ye65YWl5aKD5b6u5L+h5YWs5LyX6LSm5Y+35Y+K5pe25LqG6Kej44CC44CQ5ZCJ5p6X5Ye65YWl5aKD44CRIiwKICAgICAgICAgICAgImNvbG9yIjogIiMxNzMxNzciCiAgICAgICAgfQogICAgfQp9";
		//paramsEncode = "ewogICAgInRvdXNlciI6ICJvck91S3dOVTZnLVNaYjdBU0I2M1lPNEsxb3A0IiwKICAgICJ0ZW1wbGF0ZV9pZCI6ICJRcWhJUXRpX2Z0a0VvWmRQY2k5dnN2d09VUldXUU9NenF6OWh3OXR6V2pzIiwKICAgICJ1cmwiOiAiIiwKICAgICJkYXRhIjogewogICAgICAgICJmaXJzdCI6IHsKICAgICAgICAgICAgInZhbHVlIjogIuaCqOWQju+8jOaCqOWcqOWQieael+S6kuiBlOe9kSvlhazlronmnI3liqHlubPlj7DnmoTnlLPor7fkuJrliqHmnInkuobmlrDnmoTov5vlsZXvvJoiLAogICAgICAgICAgICAiY29sb3IiOiAiIzE3MzE3NyIKICAgICAgICB9LAogICAgICAgICJrZXl3b3JkMSI6IHsKICAgICAgICAgICAgInZhbHVlIjogIuWkp+mZhuWxheawkeW+gOadpea4r+a+s+mAmuihjOivgSIsCiAgICAgICAgICAgICJjb2xvciI6ICIjMTczMTc3IgogICAgICAgIH0sCiAgICAgICAgImtleXdvcmQyIjogewogICAgICAgICAgICAidmFsdWUiOiAi6ZW/5pil5Ye65YWl5aKD566h55CG5bGAIiwKICAgICAgICAgICAgImNvbG9yIjogIiMxNzMxNzciCiAgICAgICAgfSwKICAgICAgICAia2V5d29yZDMiOiB7CiAgICAgICAgICAgICJ2YWx1ZSI6ICLliLbor4Hlrozmr5UiLAogICAgICAgICAgICAiY29sb3IiOiAiIzE3MzE3NyIKICAgICAgICB9LAogICAgICAgICJrZXl3b3JkNCI6IHsKICAgICAgICAgICAgInZhbHVlIjogIumZiOWoieWoiSIsCiAgICAgICAgICAgICJjb2xvciI6ICIjMTczMTc3IgogICAgICAgIH0sCiAgICAgICAgImtleXdvcmQ1IjogewogICAgICAgICAgICAidmFsdWUiOiAiMjAxNuW5tDEx5pyINeaXpSIsCiAgICAgICAgICAgICJjb2xvciI6ICIjMTczMTc3IgogICAgICAgIH0sCiAgICAgICAgInJlbWFyayI6IHsKICAgICAgICAgICAgInZhbHVlIjogIuivt+aMieWbnuaJp+WNleS4iueahOWPluivgeaWueW8j+WSjOWPluivgeaXpeacn+WPiuaXtuWPluivgeOAguWFtuS7luWHuuWFpeWig+acjeWKoeS6i+mhue+8jOivt+WFs+azqOWQieael+WHuuWFpeWig+W+ruS/oeWFrOS8l+i0puWPt+WPiuaXtuS6huino+OAguOAkOWQieael+WHuuWFpeWig+OAkSIsCiAgICAgICAgICAgICJjb2xvciI6ICIjMTczMTc3IgogICAgICAgIH0KICAgIH0KfQ==";
		//paramsEncode = "eyJkYXRhIjp7InJlbWFyayI6eyJjb2xvciI6IiMxNzMxNzciLCJ2YWx1ZSI6IuWFtuS7luWHuuWFpeWig+acjeWKoeS6i+mhue+8jOivt+WFs+azqOWQieael+WHuuWFpeWig+W+ruS/oeWFrOS8l+i0puWPt+WPiuaXtuS6huino+OAguOAkOWQieael+WHuuWFpeWig+OAkSJ9LCJrZXl3b3JkMSI6eyJjb2xvciI6IiMxNzMxNzciLCJ2YWx1ZSI6IuWkp+mZhuWxheawkeW+gOadpeWPsOa5vumAmuihjOivgSJ9LCJrZXl3b3JkMiI6eyJjb2xvciI6IiMxNzMxNzciLCJ2YWx1ZSI6IjIwMjHlubQwMeaciDA25pelIn0sImZpcnN0Ijp7ImNvbG9yIjoiIzE3MzE3NyIsInZhbHVlIjoi5oKo5aW977yM5oKo5pyJ5Y2z5bCG5Yiw5pyf55qE5Ye65YWl5aKD6K+B5Lu277yM6K+35Y+K5pe25bCx6L+R55qE5YWs5a6J5Ye65YWl5aKD566h55CG6YOo6Zeo5Y+K5pe25pu05o2i6K+B5Lu244CC6K+B5Lu25L+h5oGv5aaC5LiL77yaIn19LCJ0ZW1wbGF0ZV9pZCI6InBKbDF6UFF0UXFfVUp4S1VwY2hFT2IyWmhid1pZTVMwZXRBS0ZtOUdJVW8iLCJ0b3VzZXIiOiJvck91S3dOVTZnLVNaYjdBU0I2M1lPNEsxb3A0IiwidXJsIjoiIn0=";
		if(paramsEncode == null || "".equals(paramsEncode)){
			baseJson.setCode("0");
			baseJson.setData(nowDate);
			baseJson.setMsg("消息发送失败，params参数不能为空！");
		}else{
			String paramsDecode = Base64Utils.getFromBase64(paramsEncode);//参数BASE64解密
			if(paramsDecode != null && !"".equals(paramsDecode)){
				javax.servlet.jsp.PageContext pageContext = javax.servlet.jsp.JspFactory.getDefaultFactory().getPageContext(this, request, response, null, true, 8192, true);
				WebApplicationContext wac =ApplicationContextUtil.getWebApplicationContext(pageContext);
				MessageNotifyServiceI messageNotifyServiceI  =  (MessageNotifyServiceI)wac.getBean("MessageNotifyServiceI");
				GongzhongZhanghaoService gongzhongZhanghaoService = (GongzhongZhanghaoService)wac.getBean("gongzhongZhanghaoService");
				Gongzhong gongzhong = gongzhongZhanghaoService.selectGongzhongZhanghaoById("1");
				if(gongzhong == null){
					baseJson.setCode("0");
					baseJson.setData(nowDate);
					baseJson.setMsg("消息发送失败，公众帐号未设置！");
				} else {
					HttpSession session = request.getSession();
					session.setMaxInactiveInterval(6800);//设置session的失效时间
					String appid = gongzhong.getAccountAppid();
					String appsecret = gongzhong.getAccountAppsecret();
					String token = (String)session.getAttribute("token");
					if(token == null || token.equals("")){
						token = weiXinUtil.getAccess_token(appid, appsecret);
						session.setAttribute("token",token);
					}
					if(!messageNotifyServiceI.send(paramsDecode, token)){
						baseJson.setCode("0");
						baseJson.setData(nowDate);
						baseJson.setMsg("消息发送失败，消息发送失败，请确认公众号和模版参数正确！");
					}else{
						baseJson.setCode("1");
						baseJson.setData(nowDate);
						baseJson.setMsg("消息发送成功！");
					}
				}
			} else {
				baseJson.setCode("0");
				baseJson.setData(nowDate);
				baseJson.setMsg("消息发送失败，params参数BASE64解密失败！");
			}
		}
		JSONObject json = JSONObject.fromObject(baseJson);
		String ret = JSON.toJSONString(json);
		out = response.getWriter(); //获取写入对象
		out.print(ret); //将json数据写入流中
	}
}