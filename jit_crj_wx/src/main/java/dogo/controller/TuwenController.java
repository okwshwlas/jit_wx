package dogo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import dogo.model.Keywords;
import dogo.model.Tuwen;
import dogo.modeljson.AjaxJson;
import dogo.service.KeywordsService;
import dogo.service.TuwenService;
import dogo.util.Page;
import dogo.util.ResourceUtil;
import dogo.util.UUID;
@Controller
@RequestMapping("/tuwenControl/*")
public class TuwenController{
	
	private static final Logger log = Logger.getLogger(TuwenController.class);
	
	private TuwenService tuwenService;

	private KeywordsService keywordsService;

	/**
	 * 查询所有图文表单
	 * 
	 * @param response
	 * @param tuwen
	 * @param page
	 * @return
	 */
	@RequestMapping(value = "/selectAllTuwen.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> selectAllTuwen(HttpServletResponse response,Tuwen tuwen,Page page,String tuwenId){
		Map<String, Object> res = new HashMap<String, Object>();
		res.put("tuwen", tuwen);
		res.put("page", page);
		res.put("tuwenId", tuwenId);
		try{
			int recordsCount = tuwenService.selectAllTuwenCount(res);
			List<Tuwen> list = tuwenService.selectAllTuwen(res);
			res.put("rows", list);
			res.put("page", page.getPage());
			res.put("total", recordsCount);
		}catch (Exception e) {
			log.error(e);
			e.printStackTrace();
		}
		
		return res;
	}
	
	/**
	 *获取图文主键id
	 * 
	 * @param tuwen
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/addTuwen.do", method = RequestMethod.POST)
	@ResponseBody
	public String addTuwen(Tuwen tuwen,HttpServletRequest request) {
		try {
			String id = UUID.getUID();
			return id;
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e);
		}
		return null;
	}

	/**
	 * 查询关键字
	 * @return
	 */
	@RequestMapping(value = "/selectAllKeywordsNotpage.do", method = RequestMethod.POST)
	@ResponseBody
	public List<Keywords> selectAllKeywordsNotpage() { 
		List<Keywords> allKeywords = null;
		try {
			allKeywords = keywordsService.selectKeywords();
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e);
		}
		
		return allKeywords;
	}


	/**
	 * 添加图文
	 * @param tuwen
	 * @return
	 */
	@RequestMapping(value = "/insertTuwenParent.do", method = RequestMethod.POST)
	@ResponseBody
	public AjaxJson insertTuwenParent(Tuwen tuwen,HttpServletRequest request) {
		AjaxJson ajaxJson = new AjaxJson();
		try {
			String neirong = tuwen.getNeirong();
			if(tuwen.getLink()==null||tuwen.getLink().equals("")){
				if(neirong!=null&&!neirong.equals("")){
					tuwen.setLink(ResourceUtil.getUrl(request)+"/WeixinZhuanfaServlet?id="+tuwen.getId());
				}else{
					tuwen.setLink("");
				}
			}
			tuwenService.insertTuwen(tuwen);
			ajaxJson.setSuccess(true);
			ajaxJson.setMsg("保存成功! ");
			return ajaxJson;
		} catch (Exception e) {
			ajaxJson.setSuccess(false);
			ajaxJson.setMsg("保存失败! ");
			e.printStackTrace();
			log.error(e);
			return ajaxJson;
		}
		
	}
	
	/**
	 * 删除图文(父子)
	 * 
	 * @param ids
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/deleteAllParentWenbenById.do", method = RequestMethod.POST)
	@ResponseBody
	public AjaxJson deleteAllParentWenbenById(String ids, HttpServletResponse response) {
		AjaxJson ajaxJson = new AjaxJson();
		try {
			String id[] = ids.split(",");
			for (int i = 0; i < id.length; i++) {
				tuwenService.deleteAllTuwenById(id[i]);
			}
			ajaxJson.setSuccess(true);
			ajaxJson.setMsg("删除成功");
			return ajaxJson;
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e);
			ajaxJson.setSuccess(false);
			ajaxJson.setMsg("删除失败");
			return ajaxJson;
		}
	}
	
	/**
	 * 根据主键删除
	 * 
	 * @param ids
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/deleteAllTuwenById.do", method = RequestMethod.POST)
	@ResponseBody
	public AjaxJson deleteAllTuwenById(String ids, HttpServletResponse response){
		AjaxJson ajaxJson = new AjaxJson();
		try {
				
			String id[] = ids.split(",");
			
			for (int i = 0; i < id.length; i++) {
				tuwenService.deleteTuwenById(id[i]);
			}
			ajaxJson.setSuccess(true);
			ajaxJson.setMsg("删除成功");
			return ajaxJson;
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e);
			ajaxJson.setSuccess(false);
			ajaxJson.setMsg("删除失败");
			return ajaxJson;
		}
	}
	
	/**
	 * 查询图文(包括子图文)
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/selectParentTuwenById.do", method = RequestMethod.POST)
	@ResponseBody
	public Tuwen selectParentTuwenById(String id) {
		try {
			Tuwen tuwen= tuwenService.selectParentTuwenById(id);
			return tuwen;
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e);
		}
		return null;
	}
	
	/**
	 * 给图文添加父id
	 * 
	 * @param tuwen
	 * @param flag
	 * @return
	 */
	@RequestMapping(value = "/updateTuwenById.do", method = RequestMethod.POST)
	@ResponseBody
	public AjaxJson updateTuwen(Tuwen tuwen,String flag,HttpServletRequest request) {
		AjaxJson ajaxJson = new AjaxJson();
		try {
			if("addChild".equals(flag)){
				int count = tuwenService.selectHasParentId(tuwen);
				if(count!=0){//不等于0,说明该图文已经是child,不需要再添加了
					ajaxJson.setSuccess(false);
					ajaxJson.setMsg("该图文已经添加");
					return ajaxJson;
				}
			}
			String neirong = tuwen.getNeirong();
			if(tuwen.getLink()==null||tuwen.getLink().equals("")){
				if(neirong!=null&&!neirong.equals("")){
					tuwen.setLink(ResourceUtil.getUrl(request)+"/WeixinZhuanfaServlet?id="+tuwen.getId());
				}else{
					tuwen.setLink("");
				}
			}
			tuwenService.updateTuwen(tuwen);
			ajaxJson.setSuccess(true);
			ajaxJson.setMsg("该图文没有添加");
			return ajaxJson;
			
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e);
			ajaxJson.setSuccess(false);
			ajaxJson.setMsg("修改父id失败");
			return ajaxJson;
		}
		
			
	}
	/**
	 * 删除图文父id
	 * 
	 * @param tuwen
	 * @return
	 */
	@RequestMapping(value = "/deletePatentId.do", method = RequestMethod.POST)
	@ResponseBody
	public AjaxJson deletePatentId(Tuwen tuwen) {
		AjaxJson ajaxJson = new AjaxJson();
		try {
			tuwenService.deletePatentId(tuwen);
			ajaxJson.setSuccess(true);
			ajaxJson.setMsg("删除成功");
			return ajaxJson;
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e);
			ajaxJson.setSuccess(false);
			ajaxJson.setMsg("删除失败");
			return ajaxJson;
		}
	}
	/**
	 * 查询关键字是否可用
	 * @param wenbenid
	 * @param tuwenid
	 * @param keyword_id
	 * @return
	 */
	@RequestMapping(value = "/selectisNotkeyword.do", method = RequestMethod.POST)
	@ResponseBody
	public AjaxJson selectisNotkeyword(String wenbenid, String tuwenid,String keyword_id) {
		AjaxJson ajaxJson = new AjaxJson();
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("wenbenid", wenbenid);
			map.put("tuwenid", tuwenid);
			map.put("keyword_id", keyword_id);
			int count = tuwenService.selectisNotkeyword(map);
			if(0 == count){
				ajaxJson.setSuccess(true);
				ajaxJson.setMsg("该关键字可以使用");
			}else{
				ajaxJson.setSuccess(false);
				ajaxJson.setMsg("该关键字不可以使用");
			}
			return ajaxJson;
		} catch (Exception e) {
			e.printStackTrace();
			ajaxJson.setSuccess(false);
			ajaxJson.setMsg("查询关键字是否可以使用失败");
			return ajaxJson;
		}
	}
	
	public TuwenService getTuwenService() {
		return tuwenService;
	}


	@Autowired
	public void setTuwenService(TuwenService tuwenService) {
		this.tuwenService = tuwenService;
	}

	public KeywordsService getKeywordsService() {
		return keywordsService;
	}
	@Autowired
	public void setKeywordsService(KeywordsService keywordsService) {
		this.keywordsService = keywordsService;
	}

	
	
	
	
	
}
