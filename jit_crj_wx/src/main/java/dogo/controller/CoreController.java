package dogo.controller;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;

import dogo.model.Gongzhong;
import dogo.modeljson.AjaxJson;
import dogo.modeljson.BaseJson;
import dogo.service.GongzhongZhanghaoService;
import dogo.util.Sha1Util;
import dogo.weixin.core.WeiXinUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by FirenzesEagle on 2016/5/30 0030.
 * Email:liumingbo2008@gmail.com
 */
@Controller
@RequestMapping("/corecontroller")
public class CoreController{
	@Autowired
	private GongzhongZhanghaoService gongzhongZhanghaoService;
    /**
     *
     *
     * @param request 获得调用微信JS-SDK需要的参数 timestamp 时间戳  nonceStr 签名的随机串  signature 生成的签名
     * @param response
     * @throws Exception
     */
    @RequestMapping(value = "getSdk")
    @ResponseBody
    public Map<String,Object> getSdk(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
    	WeiXinUtil weiXinUtil = new WeiXinUtil();
    	String url=request.getParameter("url");
        Map<String,Object> map=new HashMap<String,Object>();
        String nonceStr=Sha1Util.getNonceStr();
        String timestamp=Sha1Util.getTimeStamp();
        Gongzhong gongzhong = gongzhongZhanghaoService.selectGongzhongZhanghaoById("1");
        //获得access_token
        String access_token=weiXinUtil.getAccess_token(gongzhong.getAccountAppid(), gongzhong.getAccountAppsecret());
        //获得ticket
        String jsapi_ticket=weiXinUtil.getJsapi_ticket(access_token);
        //生成签名
        String salt="jsapi_ticket="+jsapi_ticket+"&noncestr="+nonceStr+"&timestamp="+timestamp+"&url="+url;
        String signature=Sha1Util.getSha1(salt);
        map.put("nonceStr",nonceStr);
        map.put("timestamp",timestamp);
        map.put("signature",signature);
        return map;
    }
    
  	@RequestMapping(value = "getOpenId", method = RequestMethod.GET)
  	public void getOpenId(HttpServletResponse response,String code) throws IOException {
  		AjaxJson ajaxJson=new AjaxJson();
  		String ret = "";
  		response.setCharacterEncoding("UTF-8"); //设置编码格式
  		response.setContentType("text/html");   //设置数据格式
  		PrintWriter out = response.getWriter();
  			try {
  				Gongzhong gongzhong = gongzhongZhanghaoService.selectGongzhongZhanghaoById("1");
  				String appid = gongzhong.getAccountAppid();
  				String appsecret = gongzhong.getAccountAppsecret();
  				WeiXinUtil util = new WeiXinUtil();
  				String openid = util.getOpenid(appid, appsecret, code);
  				BaseJson baseJson = new BaseJson();
  					if(!"".equals(openid)){
  						baseJson.setCode("000000");
  						baseJson.setMsg("成功");
  						baseJson.setData(openid);
  					}
  				JSONObject json = JSONObject.fromObject(baseJson);
  				ret = JSON.toJSONString(json);
  				out = response.getWriter(); //获取写入对象
  				out.print(ret); //将json数据写入流中
  			} catch (Exception e) {
  				e.printStackTrace();
  				ajaxJson.setCode("000001");
  				ajaxJson.setMsg("操作失败");
  				out.print(JSON.toJSONString(ajaxJson));
  			} finally {
  				out.flush();
  				out.close();
  			}
  		}
  	@RequestMapping(value = "getAccessToken", method = RequestMethod.GET)
  	public void getAccessToken(HttpServletResponse response,String code) throws IOException {
  		AjaxJson ajaxJson=new AjaxJson();
  		String ret = "";
  		response.setCharacterEncoding("UTF-8"); //设置编码格式
  		response.setContentType("text/html");   //设置数据格式
  		PrintWriter out = response.getWriter();
  			try {
  				Gongzhong gongzhong = gongzhongZhanghaoService.selectGongzhongZhanghaoById("1");
  				String appid = gongzhong.getAccountAppid();
  				String appsecret = gongzhong.getAccountAppsecret();
  				WeiXinUtil util = new WeiXinUtil();
  				String accssToken = util.getAccess_token(appid, appsecret);
  				BaseJson baseJson = new BaseJson();
				if(!"".equals(accssToken)){
					baseJson.setCode("000000");
					baseJson.setMsg("成功");
					baseJson.setData(accssToken);
				}
  				JSONObject json = JSONObject.fromObject(baseJson);
  				ret = JSON.toJSONString(json);
  				out = response.getWriter(); //获取写入对象
  				out.print(ret); //将json数据写入流中
  			} catch (Exception e) {
  				e.printStackTrace();
  				ajaxJson.setCode("000001");
  				ajaxJson.setMsg("操作失败");
  				out.print(JSON.toJSONString(ajaxJson));
  			} finally {
  				out.flush();
  				out.close();
  			}
  		}
    /**
    *
    * @param request 将微信的地图坐标转为百度地图坐标
    * @param response
    * @throws Exception
    */
   @RequestMapping(value = "convertdituzb")
   @ResponseBody
   public Map<String,Object> convertDituZb(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
	   	WeiXinUtil weiXinUtil = new WeiXinUtil();
	   	String longitude=request.getParameter("longitude");
	   	String latitude=request.getParameter("latitude");
       Map<String,Object> map=new HashMap<String,Object>();
       //获得微信地图坐标转百度地图坐标
       Map<String,Object> returnMap =weiXinUtil.convertDituZb(longitude,latitude);
       map.put("longitude",returnMap.get("longitude"));
       map.put("latitude",returnMap.get("latitude"));
       return map;
   }
}
