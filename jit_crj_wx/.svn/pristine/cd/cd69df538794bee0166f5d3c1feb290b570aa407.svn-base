package dogo.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import dogo.util.UUID;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.alibaba.fastjson.JSON;

import dogo.model.CrjJjyw;
import dogo.modeljson.AjaxJson;
import dogo.modeljson.BaseJson;
import dogo.modeljson.JsonDateValueProcessor;
import dogo.service.CrjJjywServiceI;

@Controller
@RequestMapping("/proscenium/crjjjywController")
public class CrjJjywController {
	
	private static final Logger log = Logger.getLogger(CrjJjywController.class);
	
	@Autowired
	private CrjJjywServiceI crjJjywServiceI;
	
	/**
	 * 保存一条数据
	 * @param response
	 * @param qzzl
	 * @param xm
	 * @param sfzh
	 * @param jjsy
	 * @param fj1
	 * @param fj2
	 * @param fj3
	 */
	@RequestMapping(value = "/weixin/save.do", method = RequestMethod.POST)
	public void save(HttpServletResponse response,String qzzl,String xm,String sfzh,String jjsy,String fj1,
			String fj2,String fj3,String openid){
		try{
			CrjJjyw crjJjyw = new CrjJjyw();
			String id = UUID.getUID();
			crjJjyw.setId((id).toString());
			crjJjyw.setQzzl(qzzl);
			crjJjyw.setXm(xm);
			crjJjyw.setSfzh(sfzh);
			crjJjyw.setJjsy(jjsy);
			crjJjyw.setFj1(fj1);
			crjJjyw.setFj2(fj2);
			crjJjyw.setFj3(fj3);
			crjJjyw.setOpenid(openid);
			crjJjyw.setSqsj(new Date());
			crjJjywServiceI.save(crjJjyw);
		}catch (Exception e) {
			e.printStackTrace();
			log.error(e);
		}
		
		
	}
	/**
	 * 审核多条数据
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/weixin/check.do", method = RequestMethod.GET)
	public AjaxJson check(HttpServletResponse response)throws IOException{
		AjaxJson ajaxJson=new AjaxJson();
		List<CrjJjyw> crjJjywList = crjJjywServiceI.selectByShjg();
		ajaxJson.setObj(crjJjywList);
		return ajaxJson;
	}
	/**
	 * 审核一条数据
	 * @param response
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/weixin/checkOne.do", method = RequestMethod.GET)
	public AjaxJson checkOne(HttpServletResponse response,String id)throws IOException{
		AjaxJson ajaxJson=new AjaxJson();
		CrjJjyw crjJjyw = crjJjywServiceI.selectById(id);
		ajaxJson.setObj(crjJjyw);
		return ajaxJson;
	}
	/**
	 * 审核修改审核结果
	 * @param response
	 * @param shjg
	 * @param shyj
	 * @param shr
	 * @param sqsj
	 * @param id
	 */
	@RequestMapping(value = "/weixin/update.do", method = RequestMethod.POST)
	public AjaxJson update(HttpServletResponse response,String shjg,String shyj,String shr,String sqsj,String id)throws IOException{
		CrjJjyw crjJjyw = new CrjJjyw();
		AjaxJson ajaxJson=new AjaxJson();
		crjJjyw.setShjg(shjg);
		crjJjyw.setShyj(shyj);
		crjJjyw.setShr(shr);
		crjJjyw.setSqsj(new Date());
		crjJjyw.setId(id);
		crjJjywServiceI.update(crjJjyw);
		String dh = crjJjyw.getCrjdh();
		ajaxJson.setObj(dh);
		return ajaxJson;
	}
	
	/**
	 * 查看历史申请记录
	 * @param response
	 * @param shjg
	 * @param shyj
	 * @param shr
	 * @param sqsj
	 * @param id
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "/weixin/checkAll.do", method = RequestMethod.GET)
	public void checkAll(HttpServletResponse response,String openId)throws IOException{
		AjaxJson ajaxJson=new AjaxJson();
		BaseJson baseJson = new BaseJson();
		String ret = "";
		response.setCharacterEncoding("UTF-8"); //设置编码格式
		response.setContentType("text/html");   //设置数据格式
		PrintWriter out = response.getWriter();
		try {
			List<CrjJjyw> crjJjywList = crjJjywServiceI.selectByOpenId(openId);
			baseJson.setData(crjJjywList);
			baseJson.setCode("");
			baseJson.setMsg("");
			JsonConfig jsonConfig = new JsonConfig();  
			jsonConfig.registerJsonValueProcessor(Date.class, new JsonDateValueProcessor());
			JSONObject json = JSONObject.fromObject(baseJson, jsonConfig);
			ret = JSON.toJSONString(json);
			out = response.getWriter(); //获取写入对象
			out.print(ret.replace("data", "list")); //将json数据写入流中
			
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			e.printStackTrace();
			ajaxJson.setCode("000001");
			ajaxJson.setMsg("操作失败");
			out.print(JSON.toJSONString(ajaxJson));
//			return JSON.toJSONString(ajaxJson);
			
		} finally {
			out.flush();
			out.close();
		}
		
	}	
	
	
	/**
	 * 查看审核通过结果页面
	 * @param response
	 * @param shjg
	 * @param shyj
	 * @param shr
	 * @param sqsj
	 * @param id
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "/weixin/checktg.do", method = RequestMethod.GET)
	public void checktg(HttpServletResponse response,String id)throws IOException{
		AjaxJson ajaxJson=new AjaxJson();
		BaseJson baseJson = new BaseJson();
		String ret = "";
		response.setCharacterEncoding("UTF-8"); //设置编码格式
		response.setContentType("text/html");   //设置数据格式
		PrintWriter out = response.getWriter();
		try {
			CrjJjyw crjJjyw = crjJjywServiceI.selectById(id);
			baseJson.setData(crjJjyw);
			baseJson.setCode("");
			baseJson.setMsg("");
			JsonConfig jsonConfig = new JsonConfig();  
			jsonConfig.registerJsonValueProcessor(Date.class, new JsonDateValueProcessor());
			JSONObject json = JSONObject.fromObject(baseJson, jsonConfig);
			ret = JSON.toJSONString(json);
			out = response.getWriter(); //获取写入对象
			out.print(ret.replace("data", "list")); //将json数据写入流中
			
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			e.printStackTrace();
			ajaxJson.setCode("000001");
			ajaxJson.setMsg("操作失败");
			out.print(JSON.toJSONString(ajaxJson));
//			return JSON.toJSONString(ajaxJson);
			
		} finally {
			out.flush();
			out.close();
		}
	}
	
}
