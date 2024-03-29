package dogo.weixin.core;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.springframework.web.context.WebApplicationContext;

import dogo.model.Huanying;
import dogo.model.HuanyingTuwen;
import dogo.model.Tuwen;
import dogo.model.Wenben;
import dogo.service.HuanyingService;
import dogo.service.TuwenService;
import dogo.service.WenbenService;
import dogo.util.ApplicationContextUtil;
/**
 * 微信自动回复servlet
 * @author tj
 *
 */
public class WeiXinCore extends HttpServlet {
	
	
	private static final long serialVersionUID = -4934449866649771838L;
	private static final String TOKEN = "weixin";//微信平台TOKEN
	private String toUsername = "";//接收方帐号（收到的OpenID） 
	private String fromUsername = "";//发送的用户
	private String megType = "";//消息格式
	private String keyword = "";//用户发过来的关键字
	private String event = "";// 自定义按钮事件请求
	private String eKey = "";// 事件请求key值
	private WeiXinUtil weiXinUtil = new WeiXinUtil();
	
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {

		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		String openid = "";
		javax.servlet.jsp.PageContext pageContext = javax.servlet.jsp.JspFactory.getDefaultFactory().getPageContext(this, request, response, null, true, 8192, true);
		WebApplicationContext wac =ApplicationContextUtil.getWebApplicationContext(pageContext);
		WenbenService wenbenService  =  (WenbenService)wac.getBean("wenbenService");
		TuwenService tuwenService = (TuwenService)wac.getBean("tuwenService");
		HuanyingService huanyingService =  (HuanyingService)wac.getBean("huanyingService");
		String  realPath  =  "http://"  +  request.getServerName()  +  ":"  +  request.getServerPort()  +  request.getContextPath();  
		String echostr = request.getParameter("echostr");
		if (null == echostr || echostr.isEmpty()) {
			
			String postStr = null;
			try {
				postStr = weiXinUtil.readStreamParameter(request.getInputStream());
				if (null != postStr && !postStr.isEmpty()) {
					
					Document document = null;
					try {
						document = DocumentHelper.parseText(postStr);
					} catch (Exception e) {
						e.printStackTrace();
					}
					if (null == document) {
						weiXinUtil.print("",response);
						return;
					}
					
					Element root = document.getRootElement();
					fromUsername = root.elementText("FromUserName");//发送的用户（收到的OpenID） 
					toUsername = root.elementText("ToUserName");//接收方帐号
					keyword = root.elementTextTrim("Content");//用户发过来的关键字
					megType = root.elementTextTrim("MsgType");//消息格式
					event = root.elementTextTrim("Event");//事件
					eKey = root.elementTextTrim("EventKey");//事件请求key值
					Long time = new Date().getTime();
					openid = "?openid="+fromUsername;
					//用户发送过来的是事件
					System.out.println("*********555555555555555555*********"+eKey);
					System.out.println("*********888888888888888888*********"+megType);
					if (megType.equals("event")) {
						//关注事件
						if (event.equals("subscribe")) {
							//关注时发送消息,默认发送文本消息
							Huanying huanying= huanyingService.selectHuanyingWenbenById("1");
								//是否被启用
								if(huanying.getStatus().equals("0")){
									String resultStr = weiXinUtil.messageXml(fromUsername, toUsername, time,huanying.getNeirong());
									weiXinUtil.print(resultStr,response);
								}
								List<String> titles = new ArrayList<String>();
								List<String> descriptions = new ArrayList<String>();
								List<String> picurls = new ArrayList<String>();
								List<String> urls = new ArrayList<String>();
								HuanyingTuwen huanyingTuwen  = huanyingService.selectAllHuanyingtuwenById("aaaaaaaaaa");
								List<Tuwen> childTuwenList =huanyingTuwen.getList();
								if(huanyingTuwen.getStatus().equals("0")){
									if (childTuwenList!=null&&childTuwenList.size()>0) {
										//说明有子集
										titles.add(huanyingTuwen.getTitle());
										descriptions.add(huanyingTuwen.getMiaoshu());
										picurls.add(realPath+huanyingTuwen.getUrl()+openid);
										if(huanyingTuwen.getLink().contains("jit_crj_wx")){
											urls.add(huanyingTuwen.getLink()+openid);
										}else{
											urls.add(huanyingTuwen.getLink());
										}
										for (Tuwen tuwenChild : childTuwenList) {
											titles.add(tuwenChild.getTitle());
											descriptions.add(tuwenChild.getMiaoshu());
											picurls.add(realPath+tuwenChild.getUrl());
											if(tuwenChild.getLink().contains("jit_crj_wx")){
												urls.add(tuwenChild.getLink()+openid);
											}else{
												urls.add(tuwenChild.getLink());
											}
										}
										String resultStr = weiXinUtil.newsXml(fromUsername, toUsername, time, titles, descriptions, picurls, urls);
										weiXinUtil.print(resultStr,response);
									}else {
										titles.add(huanyingTuwen.getTitle());
										descriptions.add(huanyingTuwen.getMiaoshu());
										picurls.add(realPath+huanyingTuwen.getUrl());
										if(huanyingTuwen.getLink().contains("jit_crj_wx")){
											urls.add(huanyingTuwen.getLink()+openid);
										}else{
											urls.add(huanyingTuwen.getLink());
										}
										String resultStr = weiXinUtil.newsXml(fromUsername, toUsername, time, titles, descriptions, picurls, urls);
										weiXinUtil.print(resultStr,response);
									}
								}
							  //否则微信会默认发送一条消息
							
							}else if (event.equals("unsubscribe")) {//取消关注事件
						
							
							//模板消息成功事件	
							}else if (event.equals("TEMPLATESENDJOBFINISH")){
								
								
							}else if (event.equals("CLICK")) {//点击自定义菜单事件
							    //自定义菜单的处理
								if (eKey.equals("")) {
									
								}
								//转接客服 微信自带客服
								if(eKey.contains("-1")){
									String resultStr = weiXinUtil.kefuXml(fromUsername, toUsername,time);
									weiXinUtil.print(resultStr,response);
								
							    }else{

								List<Wenben> wenbenList = wenbenService.selectAllWenbenBySign(eKey);
								List<Tuwen> tuwenList = tuwenService.selectAllTuwenBySign(eKey);
								System.out.println("****************888888888888***********"+wenbenList.size()+wenbenList.size());
								if (wenbenList!=null&&wenbenList.size()>0) {
									Wenben vo = wenbenList.get(0);
									String resultStr = weiXinUtil.messageXml(fromUsername, toUsername, time,vo.getNeirong());
									weiXinUtil.print(resultStr,response);
									
								}else if(tuwenList!=null&&tuwenList.size()>0){
									
									List<String> titles = new ArrayList<String>();
									List<String> descriptions = new ArrayList<String>();
									List<String> picurls = new ArrayList<String>();
									List<String> urls = new ArrayList<String>();
									Tuwen tuwenVo = tuwenList.get(0);
									Tuwen tuwen= tuwenService.selectParentTuwenById(tuwenVo.getId());
									List<Tuwen> childTuwenList = tuwen.getChildList();
									System.out.println("****************888888888888***********"+childTuwenList.size()+childTuwenList);
									if (childTuwenList!=null&&childTuwenList.size()>0) {
										//说明有子集M
										titles.add(tuwenVo.getTitle());
										descriptions.add(tuwenVo.getMiaoshu());
										picurls.add(realPath+tuwenVo.getUrl());
										if(tuwenVo.getLink().contains("jit_crj_wx")){
											urls.add(tuwenVo.getLink()+openid);
										}else{
											urls.add(tuwenVo.getLink());
										}
										for (Tuwen tuwenChild : childTuwenList) {
											titles.add(tuwenChild.getTitle());
											descriptions.add(tuwenChild.getMiaoshu());
											picurls.add(realPath+tuwenChild.getUrl());
											if(tuwenChild.getLink().contains("jit_crj_wx")){
												urls.add(tuwenChild.getLink()+openid);
											}else{
												urls.add(tuwenChild.getLink());
											}
											
										}
										
										String resultStr = weiXinUtil.newsXml(fromUsername, toUsername, time, titles, descriptions, picurls, urls);
										weiXinUtil.print(resultStr,response);
										
										
									}else {
										titles.add(tuwenVo.getTitle());
										descriptions.add(tuwenVo.getMiaoshu());
										picurls.add(realPath+tuwenVo.getUrl());
										if(tuwenVo.getLink().contains("jit_crj_wx")){
											urls.add(tuwenVo.getLink()+openid);
										}else{
											urls.add(tuwenVo.getLink());
										}
										String resultStr = weiXinUtil.newsXml(fromUsername, toUsername, time, titles, descriptions, picurls, urls);
										weiXinUtil.print(resultStr,response);
										
									}
									
								}else {
									String resultStr = weiXinUtil.messageXml(fromUsername, toUsername, time,"感谢您对吉林出入境的支持！\n 输入数字查看相应内容或者查看\"历史消息\"\n\n 【0】省内居民办证须知 \n 【1】办理流程 \n 【2】加急办理须知 \n 【3】受理网点、办公电话、办公时间 \n 【4】申请港澳探亲签注须知 \n 【5】申请港澳商务签注须知\n 【6】港澳签注种类 \n【7】办理周期 \n【8】收费标准 \n 【9】微信预约 \n 【10】\"互联网+公安\"预约\n【11】办证小常识 \n【12】\"外省\"居民办证手续 \n【13】港澳签注自助机\n 【14】网上办理港澳再次签注须知 \n 【15】港澳探亲再次签注办理须知 \n 【16】未满16周岁办证须知\n 【17】台湾签注种类 \n");
									weiXinUtil.print(resultStr,response);
									
								}
								
							}
						}
						
					}else if (megType.equals("text")) {
						
						//转接客服
						if(keyword.contains("-1")){
							String resultStr = weiXinUtil.kefuXml(fromUsername, toUsername,time);
							weiXinUtil.print(resultStr,response);
							
						}else {
							//正常逻辑
							
							List<Wenben> wenbenList = wenbenService.selectAllWenbenBySign(keyword);
							List<Tuwen> tuwenList = tuwenService.selectAllTuwenBySign(keyword);
							if (wenbenList!=null&&wenbenList.size()>0) {
								Wenben vo = wenbenList.get(0);
								String resultStr = weiXinUtil.messageXml(fromUsername, toUsername, time,vo.getNeirong());
								weiXinUtil.print(resultStr,response);
								
							}else if(tuwenList!=null&&tuwenList.size()>0){
								
								List<String> titles = new ArrayList<String>();
								List<String> descriptions = new ArrayList<String>();
								List<String> picurls = new ArrayList<String>();
								List<String> urls = new ArrayList<String>();
								Tuwen tuwenVo = tuwenList.get(0);
								Tuwen tuwen= tuwenService.selectParentTuwenById(tuwenVo.getId());
								List<Tuwen> childTuwenList = tuwen.getChildList();
								if (childTuwenList!=null&&childTuwenList.size()>0) {
									//说明有子集
									titles.add(tuwenVo.getTitle());
									descriptions.add(tuwenVo.getMiaoshu());
									picurls.add(realPath+tuwenVo.getUrl());
									if(tuwenVo.getLink().contains("jit_crj_wx")){
										urls.add(tuwenVo.getLink()+openid);
									}else{
										urls.add(tuwenVo.getLink());
									}
									for (Tuwen tuwenChild : childTuwenList) {
										titles.add(tuwenChild.getTitle());
										descriptions.add(tuwenChild.getMiaoshu());
										picurls.add(realPath+tuwenChild.getUrl());
										if(tuwenChild.getLink().contains("jit_crj_wx")){
											urls.add(tuwenChild.getLink()+openid);
										}else{
											urls.add(tuwenChild.getLink());
										}
									}
									
									String resultStr = weiXinUtil.newsXml(fromUsername, toUsername, time, titles, descriptions, picurls, urls);
									weiXinUtil.print(resultStr,response);
									
									
								}else {
									titles.add(tuwenVo.getTitle());
									descriptions.add(tuwenVo.getMiaoshu());
									picurls.add(realPath+tuwenVo.getUrl());
									if(tuwenVo.getLink().contains("jit_crj_wx")){
										urls.add(tuwenVo.getLink()+openid);
									}else{
										urls.add(tuwenVo.getLink());
									}
									String resultStr = weiXinUtil.newsXml(fromUsername, toUsername, time, titles, descriptions, picurls, urls);
									weiXinUtil.print(resultStr,response);
									
								}
								
							}else {
								String resultStr = weiXinUtil.messageXml(fromUsername, toUsername, time,"感谢您对吉林出入境的支持！\n 输入数字查看相应内容或者查看\"历史消息\"\n\n【0】省内居民办证须知 \n 【1】办理流程 \n 【2】加急办理须知 \n 【3】受理网点、办公电话、办公时间 \n 【4】申请港澳探亲签注须知 \n 【5】申请港澳商务签注须知\n 【6】港澳签注种类 \n【7】办理周期 \n【8】收费标准 \n 【9】微信预约 \n 【10】\"互联网+公安\"预约\n【11】办证小常识 \n【12】\"外省\"居民办证手续 \n【13】港澳签注自助机\n 【14】网上办理港澳再次签注须知 \n 【15】港澳探亲再次签注办理须知 \n 【16】未满16周岁办证须知\n 【17】台湾签注种类 \n");
								weiXinUtil.print(resultStr,response);
								
							}
							
						}
						
						
						
						
					//图片	
					}else if(megType.equals("image")){
						
					//地理位置	
					}else if (megType.equals("location")) {
						
						
						
					}else {
						String resultStr = weiXinUtil.messageXml(fromUsername, toUsername, time, "");
						 weiXinUtil.print(resultStr,response);
						//其他格式 暂不处理
					}
					

				} else {
					weiXinUtil.print("",response);
					
				}
				
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else {
			
			if (weiXinUtil.checkSignature(request,TOKEN)) {
				weiXinUtil.print(echostr,response);
			} else {
				weiXinUtil.print("error",response);
			}
		}
		
	}
}