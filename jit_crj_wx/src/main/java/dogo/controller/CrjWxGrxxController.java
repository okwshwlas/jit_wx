package dogo.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import dogo.util.HttpClientUtil;
import dogo.util.UUID;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.alibaba.fastjson.JSON;

import dogo.model.CrjJjyw;
import dogo.model.CrjWxGrxx;
import dogo.modeljson.AjaxJson;
import dogo.modeljson.BaseJson;
import dogo.modeljson.JsonDateValueProcessor;
import dogo.service.CrjJjywServiceI;
import dogo.service.CrjWxGrxxServiceI;

@Controller
@RequestMapping("/proscenium/crjwxgrxxController")
public class CrjWxGrxxController {
	
	private static final Logger log = Logger.getLogger(CrjWxGrxxController.class);
	
	@Autowired
	private CrjWxGrxxServiceI crjWxGrxxServiceI;
	
	/**
	 * 保存一条数据
	 * @param response
	 */
	@RequestMapping(value = "/weixin/save.do", method = RequestMethod.POST)
	public void save(HttpServletResponse response,String openid,String zjxxflag,String bsjdflag){
		try{
			CrjWxGrxx crjWxGrxx = new CrjWxGrxx();
			String id = UUID.getUID();
			crjWxGrxx.setId((id).toString());
			crjWxGrxx.setOpenid(openid);
			crjWxGrxx.setZjxxflag(zjxxflag);
			crjWxGrxx.setBsjdflag(bsjdflag);
			crjWxGrxxServiceI.save(crjWxGrxx);
		}catch (Exception e) {
			e.printStackTrace();
			log.error(e);
		}
	}
	
	/**
	 * 修改一条数据
	 * @param response
	 */
	@RequestMapping(value = "/weixin/update.do", method = RequestMethod.POST)
	public void update(HttpServletResponse response,String openid,String zjxxflag,String bsjdflag){
		try{
			CrjWxGrxx crjWxGrxx = new CrjWxGrxx();
			crjWxGrxx.setOpenid(openid);
			crjWxGrxx.setZjxxflag(zjxxflag);
			crjWxGrxx.setBsjdflag(bsjdflag);
			crjWxGrxxServiceI.update(crjWxGrxx);
		}catch (Exception e) {
			e.printStackTrace();
			log.error(e);
		}
	}
	
	/**
	 * 修改证件信息状态
	 */
	@RequestMapping(value = "/weixin/zjxxzt.do", method = RequestMethod.POST)
	public void zjxxzt(HttpServletResponse response,String openid,String zjxxflag){
		try{
			CrjWxGrxx crjWxGrxx1 = crjWxGrxxServiceI.selectByPrimaryKey(openid);
			if(crjWxGrxx1!=null){
				CrjWxGrxx crjWxGrxx = new CrjWxGrxx();
				crjWxGrxx.setOpenid(openid);
				crjWxGrxx.setZjxxflag(zjxxflag);
				crjWxGrxxServiceI.update(crjWxGrxx);
			}else{
				CrjWxGrxx crjWxGrxx = new CrjWxGrxx();
				String id = UUID.getUID();
				crjWxGrxx.setId((id).toString());
				crjWxGrxx.setOpenid(openid);
				crjWxGrxx.setZjxxflag(zjxxflag);
				crjWxGrxxServiceI.save(crjWxGrxx);
			}
		}catch (Exception e) {
			e.printStackTrace();
			log.error(e);
		}
	}
	
	/**
	 * 修改到期提醒状态
	 */
	@RequestMapping(value = "/weixin/dqtxzt.do", method = RequestMethod.POST)
	public void dqtxzt(HttpServletResponse response,String openid,String bsjdflag){
		try{
			CrjWxGrxx crjWxGrxx1 = crjWxGrxxServiceI.selectByPrimaryKey(openid);
			if(crjWxGrxx1!=null){
				CrjWxGrxx crjWxGrxx = new CrjWxGrxx();
				crjWxGrxx.setOpenid(openid);
				crjWxGrxx.setBsjdflag(bsjdflag);
				crjWxGrxxServiceI.update(crjWxGrxx);
			}else{
				CrjWxGrxx crjWxGrxx = new CrjWxGrxx();
				String id = UUID.getUID();
				crjWxGrxx.setId((id).toString());
				crjWxGrxx.setOpenid(openid);
				crjWxGrxx.setBsjdflag(bsjdflag);
				crjWxGrxxServiceI.save(crjWxGrxx);
			}
		}catch (Exception e) {
			e.printStackTrace();
			log.error(e);
		}
	}
	
	/**
	 * 查询一条数据
	 * @param response
	 */
	@RequestMapping(value = "/weixin/select.do", method = RequestMethod.POST)
	public void select(HttpServletResponse response,String openid){
		try{
			CrjWxGrxx crjWxGrxx = crjWxGrxxServiceI.selectByPrimaryKey(openid);
			BaseJson baseJson = new BaseJson();
			String ret = "";
			response.setCharacterEncoding("UTF-8"); //设置编码格式
			response.setContentType("text/html");   //设置数据格式
			PrintWriter out = response.getWriter();
			baseJson.setData(crjWxGrxx);
	        JsonConfig jsonConfig = new JsonConfig();
	        JSONObject aa = JSONObject.fromObject(baseJson, jsonConfig);
	        ret = JSON.toJSONString(aa);
	        out = response.getWriter();
	        out.print(ret);
		}catch (Exception e) {
			e.printStackTrace();
			log.error(e);
		}
	}
	
	 /**
	  * 请求超哥数据
	  * @param response
	  * @param request
	  * @throws IOException
	  */
	 @RequestMapping(value={"/weixin/qqsj.do"}, method={org.springframework.web.bind.annotation.RequestMethod.POST})
	 public  void qqsj(HttpServletResponse response, HttpServletRequest request)
			    throws IOException{
		    String ret = "";
		    response.setCharacterEncoding("UTF-8");
		    response.setContentType("text/html");
		    PrintWriter out = response.getWriter();
		    BaseJson baseJson = new BaseJson();
		 String returnString = "";
		 String type = request.getParameter("type");
		 String sfzh =request.getParameter("sfzh");
		 String openid =request.getParameter("openid");
		 try {
			 String url="http://192.168.2.154:7001/jit_jobservice/QueryCrjService";
			 String data = "";
			 data +="type="+type;
			 data += "&sfzh="+sfzh;
			 data += "&openid="+openid;
			 System.out.println(data);
			 returnString =  HttpClientUtil.sendGet(url, data);
		} catch (Exception e) {
			// TODO: handle exception
		}
		     baseJson.setData(returnString);
	        JsonConfig jsonConfig = new JsonConfig();
	        JSONObject aa = JSONObject.fromObject(baseJson, jsonConfig);
	        ret = JSON.toJSONString(aa);
	        System.out.println(returnString);
	        out = response.getWriter();
	        out.print(ret);
	 }
	 
}
