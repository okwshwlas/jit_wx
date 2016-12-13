package dogo.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;

import dogo.model.CustomMenu;
import dogo.model.Gongzhong;
import dogo.modeljson.AjaxJson;
import dogo.service.CustomMenuServiceI;
import dogo.service.GongzhongZhanghaoService;
import dogo.util.Page;
import dogo.weixin.core.WeiXinUtil;

/**
 * 微信自定义菜单控制类
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/customMenuController/*")
public class CustomMenuController {
	
	private static final Logger log = Logger.getLogger(CustomMenuController.class);
	
	private CustomMenuServiceI customMenuServiceI;
	
	private GongzhongZhanghaoService gongzhongZhanghaoService;

	public GongzhongZhanghaoService getGongzhongZhanghaoService() {
		return gongzhongZhanghaoService;
	}
	@Resource
	public void setGongzhongZhanghaoService(
			GongzhongZhanghaoService gongzhongZhanghaoService) {
		this.gongzhongZhanghaoService = gongzhongZhanghaoService;
	}

	public CustomMenuServiceI getCustomMenuServiceI() {
		return customMenuServiceI;
	}
	
	@Autowired
	public void setCustomMenuServiceI(CustomMenuServiceI customMenuServiceI) {
		this.customMenuServiceI = customMenuServiceI;
	}
	
	/**
	 * 查询所有
	 * @param customMenu
	 * @param page
	 * @return
	 */
	@RequestMapping(value = "/selectAllCustomMenu.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> selectAllCustomMenu(CustomMenu customMenu,Page page) {
		Map<String, Object> res = new HashMap<String, Object>();
		try {
			List<CustomMenu> list = customMenuServiceI.selectAllCustomMenu();
			int recordsCount = list.size();
			String json = JSON.toJSONString(list);
			json = json.replaceAll("parentid", "_parentId");
			res.put("rows", JSONArray.parse(json));
			res.put("page", page.getPage());
			res.put("total", recordsCount);
		} catch (Exception e) {
			log.error(e);
			return res;
		}
		return res;
	}
	/**
	 * 根据ID查询
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/selectCustomMenuById.do", method = RequestMethod.POST)
	@ResponseBody
	public CustomMenu selectCustomMenuById(String id) {
		return customMenuServiceI.selectByPrimaryKey(id);
	}
	
	/**
	 * 修改
	 * @param customMenu
	 * @return
	 */
	@RequestMapping(value = "/updateCustomMenu.do", method = RequestMethod.POST)
	@ResponseBody
	public AjaxJson updateCustomMenu(CustomMenu customMenu) {
		AjaxJson ajaxJson = new AjaxJson();
		try {
			customMenuServiceI.updateByPrimaryKeySelective(customMenu);
			ajaxJson.setMsg("保存成功");
		} catch (Exception e) {
			log.error(e);
			ajaxJson.setMsg("保存失败");
			return ajaxJson;
		}
		return ajaxJson;
	}
	
	/**
	 * 根据父ID批量修改子节点状态
	 * @param customMenu
	 * @return
	 */
	@RequestMapping(value = "/updateChildCustomMenuStatusByParentid.do", method = RequestMethod.POST)
	@ResponseBody
	public AjaxJson updateChildCustomMenuStatusByParentid(CustomMenu customMenu) {
		AjaxJson ajaxJson = new AjaxJson();
		try {
			List<CustomMenu> childCustomMenus = customMenuServiceI.selectAllChildCustomMenuByParentid(customMenu.getId());
			for (CustomMenu customMenu2 : childCustomMenus) {
				customMenu2.setStatus("不启用");
				//更新子节点状态
				customMenuServiceI.updateByPrimaryKeySelective(customMenu2);
			}
			ajaxJson.setSuccess(true);
			ajaxJson.setMsg("保存成功");
		} catch (Exception e) {
			log.error(e);
			ajaxJson.setSuccess(false);
			ajaxJson.setMsg("保存失败");
			return ajaxJson;
		}
		return ajaxJson;
	}
	
	
	/**
	 * 生成自定义菜单
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/createCustomMenu.do", method = RequestMethod.POST)
	@ResponseBody
	public AjaxJson createCustomMenu(HttpServletRequest request){
		AjaxJson ajaxJson = new AjaxJson();
		String  realPath  =  "http://"  +  request.getServerName()  +  ":"  +  request.getServerPort()  +  request.getContextPath();  
		List <CustomMenu> allCustommenu =null;
		StringBuffer buffer  = new StringBuffer();
		buffer.append("{\"button\":[");

		/*Gongzhong gongzhong = gongzhongZhanghaoService.selectGongzhongZhanghaoById("1");
		String appid = gongzhong.getAccountAppid();
		String appsecret = gongzhong.getAccountAppsecret();
		WeiXinUtil weiXinUtil = new WeiXinUtil();
		String token = 	weiXinUtil.getAccess_token(appid,appsecret);
		System.out.println("*******************");
	    boolean temp = 	weiXinUtil.createMenu(buffer.toString(), token);*/
		Gongzhong gongzhong = gongzhongZhanghaoService.selectGongzhongZhanghaoById("1");
		String appid = gongzhong.getAccountAppid();
		try {
			  //获取启用的所有父菜单
			  allCustommenu = customMenuServiceI.selectAllQiyongCustomMenu1("", "启用");
			  int j=0;
			  for (CustomMenu custommenu : allCustommenu) {
						  String name =custommenu.getName().trim();
						  String key = custommenu.getKeywordorurl();
						  if(key==null){
							  key="";
						  }
						  //根据父ID获取已启用的所有子节点
						  List<CustomMenu> childrens =  customMenuServiceI.selectAllQiyongCustomMenu(custommenu.getId(), "启用");
						  if(childrens.size()==0){
								  if(custommenu.getContent()!=null&&!custommenu.getContent().trim().equals("")){
									  buffer.append("{\"type\":\"view\",\"name\":\""+name+"\",\"url\":\""+realPath+"/WeixinMenuServlet?id="+custommenu.getId()+"&date="+new Date()+"\"}");
								  }else{
										if(key.contains("http")||key.contains("www")){
											buffer.append("{\"type\":\"view\",\"name\":\""+custommenu.getName()+"\",\"url\":\""+key+"\"}");
										}else{
											buffer.append("{\"type\":\"click\",\"name\":\""+name+"\",\"key\":\""+key+"\"}");
										}
								  }
							  }else{
							  buffer.append("{\"name\":\""+name+"\",\"sub_button\":[");
							  int k=0;
							 //http://jentary.eicp.net/WeixinWeb/WeixinCustommenuServlet/WeixinCustommenuServlet?id=+custommenuVo.getId()
							  for (CustomMenu childCustommenu : childrens) {
								if(childCustommenu.getContent()!=null&&!childCustommenu.getContent().equals("")){
									buffer.append("{\"type\":\"view\",\"name\":\""+childCustommenu.getName()+"\",\"url\":\""+realPath+"/WeixinMenuServlet?id="+childCustommenu.getId()+"\"}");
								}else{
									if(childCustommenu.getKeywordorurl().contains("http")||childCustommenu.getKeywordorurl().contains("www")){
										//buffer.append("{\"type\":\"view\",\"name\":\""+childCustommenu.getName()+"\",\"url\":\""+childCustommenu.getKeywordorurl()+"\"}");
										buffer.append("{\"type\":\"view\",\"name\":\""+childCustommenu.getName()+"\",\"url\":\"https://open.weixin.qq.com/connect/oauth2/authorize?appid="+appid+"&redirect_uri="+childCustommenu.getKeywordorurl()+"&response_type=code&scope=snsapi_userinfo&state=1#wechat_redirect\"}");
										//buffer.append("{\"type\":\"view\",\"name\":\""+childCustommenu.getName()+"\",\"url\":\"https://open.weixin.qq.com/connect/oauth2/authorize?appid="+appid+"&redirect_uri="+childCustommenu.getKeywordorurl()+"&response_type=code&scope=snsapi_base&state=1#wechat_redirect\"}");
									}else{
										buffer.append("{\"type\":\"click\",\"name\":\""+childCustommenu.getName()+"\",\"key\":\""+childCustommenu.getKeywordorurl()+"\"}");
									}
								}
								  if(k!=childrens.size()-1){
									  buffer.append(",");
								  }
								  k++;
						  }
							  buffer.append("]}");
					  } 
						  if(j!=allCustommenu.size()-1){
							  buffer.append(",");
						  }
						  j++;
			}
			  buffer.append("]}");
			} catch (Exception e) {
					e.printStackTrace();
					ajaxJson.setSuccess(false);
					ajaxJson.setMsg("自定义菜单生成超时");
								
			}

		String appsecret = gongzhong.getAccountAppsecret();
		WeiXinUtil weiXinUtil = new WeiXinUtil();
		String token = 	weiXinUtil.getAccess_token(appid,appsecret);
	    boolean temp = 	weiXinUtil.createMenu(buffer.toString(), token);
	    if(temp){
			 ajaxJson.setSuccess(temp);
			 ajaxJson.setMsg("自定义菜单生成成功");
		}else{
			 ajaxJson.setSuccess(temp);
			 ajaxJson.setMsg("自定义菜单生成超时,请重新生成");
		}
	    return ajaxJson;
	}
	
	/**
	 * 撤销自定义菜单
	 * @return
	 */
	@RequestMapping(value = "/repealAllCustommenus.do", method = RequestMethod.POST)
	@ResponseBody
	public AjaxJson repealAllCustommenus(){
		AjaxJson ajaxJson = new AjaxJson();
		WeiXinUtil weiXinUtil = new WeiXinUtil();
		Gongzhong gongzhong = gongzhongZhanghaoService.selectGongzhongZhanghaoById("1");
		String appid = gongzhong.getAccountAppid();
		String appsecret = gongzhong.getAccountAppsecret();
		String token = 	weiXinUtil.getAccess_token(appid,appsecret);
		boolean  temp = weiXinUtil.deleteMenu(token);
		if(temp){
			 ajaxJson.setSuccess(temp);
			 ajaxJson.setMsg("撤销自义菜单成功");
		}else{
			 ajaxJson.setSuccess(temp);
			 ajaxJson.setMsg("撤销自义菜单超时");
		}
		return ajaxJson;
	}
	

}
