package dogo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import dogo.model.Keywords;
import dogo.model.Tuwen;
import dogo.model.Wenben;
import dogo.modeljson.AjaxJson;
import dogo.service.KeywordsService;
import dogo.service.TuwenService;
import dogo.service.WenbenService;
import dogo.util.Page;
import dogo.util.UUID;

@Controller
@RequestMapping("/keywordsController/*")
public class KeywordsController {

	private static final Logger log = Logger.getLogger(KeywordsController.class);
	
	private KeywordsService keywordsService;
	
	private TuwenService tuwenService;
	
	private WenbenService wenbenService;
	
	public KeywordsService getKeywordsService() {
		return keywordsService;
	}
	@Resource
	public void setKeywordsService(KeywordsService keywordsService) {
		this.keywordsService = keywordsService;
	}

	public TuwenService getTuwenService() {
		return tuwenService;
	}
	@Resource
	public void setTuwenService(TuwenService tuwenService) {
		this.tuwenService = tuwenService;
	}
	
	public WenbenService getWenbenService() {
		return wenbenService;
	}
	@Resource
	public void setWenbenService(WenbenService wenbenService) {
		this.wenbenService = wenbenService;
	}
	/**
	 * 查询所有关键字
	 * @param keywords
	 * @param page
	 * @return
	 */
	@RequestMapping(value="/selectAllKeywords.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> selectAllKeywords(Keywords keywords,Page page) {
		Map<String, Object> res = new HashMap<String, Object>();
		try {
			//查询条件
			res.put("keywords", keywords);
			res.put("page", page);
			//记录数
			int count = keywordsService.selectAllKeywordsCount(res);
			//结果集
			List<Keywords> list = keywordsService.selectAllKeywordsByPage(res);
			res.put("rows", list);
			res.put("page", page.getPage());
			res.put("total", count);
			return res;
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e);
			return null;
		}
		
	}
	/**
	 * 新增关键字
	 * @param keywords
	 * @return
	 */
	@RequestMapping(value = "/insertKeywords.do", method = RequestMethod.POST)
	@ResponseBody
	public AjaxJson insertKeywords(Keywords keywords){ // 添加菜单
		AjaxJson ajaxJson = new AjaxJson();
		try {
			keywords.setId(UUID.getUID());
			keywordsService.insertKeywords(keywords);
			ajaxJson.setSuccess(true);
			ajaxJson.setMsg("保存成功");
			return ajaxJson;
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e);
			ajaxJson.setSuccess(false);
			ajaxJson.setMsg("保存失败");
			return ajaxJson;
		}
	}
	
	/**
	 * 根据id查询关键字
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/selectKeywordsById.do",method=RequestMethod.POST)
	@ResponseBody
	public Keywords selectKeywordsById(String id) {
		try {
			Keywords keywords = keywordsService.selectKeywordsById(id);
			return keywords;
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e);
			return null;
		}
		
	}
	/**
	 * 修改关键字
	 * @param keywords
	 * @return
	 */
	@RequestMapping(value = "/updateKeywords.do", method = RequestMethod.POST)
	@ResponseBody
	public AjaxJson updateKeywords(Keywords keywords){ // 修改菜单
		AjaxJson ajaxJson = new AjaxJson();
		try {
			keywordsService.updateKeywords(keywords);
			ajaxJson.setSuccess(true);
			ajaxJson.setMsg("保存成功");
			return ajaxJson;
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e);
			ajaxJson.setSuccess(false);
			ajaxJson.setMsg("保存失败");
			return ajaxJson;
		}
	}
	/**
	 * 删除关键字(单个)
	 * @param keywords
	 * @return
	 */
	@RequestMapping(value = "/deleteKeywords.do", method = RequestMethod.POST)
	@ResponseBody
	public AjaxJson deleteKeywords(Keywords keywords){ 
		AjaxJson ajaxJson = new AjaxJson();
		try {
			//删除关联的文本和图文
			List<Wenben> wenbens  = wenbenService.selectWenbenBykeyword_id(keywords.getId());
			List<Tuwen> tuwens = tuwenService.selectTuwenBykeyword_id(keywords.getId());
			for (Wenben wenben : wenbens) {
				wenbenService.deleteWenbenById(wenben.getId());
			}
			for (Tuwen tuwen : tuwens) {
				tuwenService.deleteTuwenById(tuwen.getId());
			}
			keywordsService.deleteSingleKeywords(keywords);
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
}
