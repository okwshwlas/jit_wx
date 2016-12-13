package dogo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import dogo.model.Wenben;
import dogo.modeljson.AjaxJson;
import dogo.service.WenbenService;
import dogo.util.Page;
import dogo.util.UUID;

@Controller
@RequestMapping("/wenbenControl/*")
public class WenbenController {

	private static final Logger log = Logger.getLogger(WenbenController.class);
	
	private WenbenService wenbenService;
	
	public WenbenService getWenbenService() {
		return wenbenService;
	}
	@Resource
	public void setWenbenService(WenbenService wenbenService) {
		this.wenbenService = wenbenService;
	}

	/**
	 * 带分页查询文本
	 * @param response
	 * @param wenben
	 * @param page
	 * @return
	 */
	@RequestMapping(value = "/selectAllWenben.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> selectAllWenben(HttpServletResponse response,Wenben wenben,Page page){
		Map<String, Object> res = new HashMap<String, Object>();
		res.put("wenben", wenben);
		res.put("page", page);
		try{
			int recordsCount = wenbenService.selectAllWenbenCount(res);
			List<Wenben> list = wenbenService.selectAllWenben(res);
			res.put("rows", list);
			res.put("page", page.getPage());
			res.put("total", recordsCount);
		}catch (Exception e) {
			log.error(e);
			e.printStackTrace();
		}
		
		return res;
	}
	
	/**生产一个id
	 * @param wenben
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/addWenben.do", method = RequestMethod.POST)
	@ResponseBody
	public String addWenben(Wenben wenben,HttpServletRequest request) {
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
	 * 新增文本
	 * @param wenben
	 * @return
	 */
	@RequestMapping(value = "/insertWenben.do", method = RequestMethod.POST)
	@ResponseBody
	public AjaxJson insertWenben(Wenben wenben) {
		AjaxJson ajaxJson = new AjaxJson();
		try {
			wenben.setId(UUID.getUID());
			wenbenService.insertWenben(wenben);
			ajaxJson.setSuccess(true);
			ajaxJson.setMsg("保存成功! ");
		} catch (Exception e) {
			ajaxJson.setSuccess(false);
			ajaxJson.setMsg("保存失败! ");
			e.printStackTrace();
			log.error(e);
		}
	    return ajaxJson;
		
	}
	
	/**
	 * 根据id查询文本
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/selectWenbenById.do",method=RequestMethod.POST)
	@ResponseBody
	public Wenben selectWenbenById(String id) {
		try {
			Wenben wenben = wenbenService.selectWenbenById(id);
			return wenben;
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e);
			return null;
		}
		
	}
	/**
	 * 根据id修改文本
	 * @param wenben
	 * @return
	 */
	@RequestMapping(value = "/updateWenbenById.do", method = RequestMethod.POST)
	@ResponseBody
	public AjaxJson updateWenbenById(Wenben wenben) {
		AjaxJson ajaxJson = new AjaxJson();
		try {
			wenbenService.updateWenbenById(wenben);
			ajaxJson.setSuccess(true);
			ajaxJson.setMsg("修改成功");
			return ajaxJson;
			
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e);
			ajaxJson.setSuccess(false);
			ajaxJson.setMsg("修改失败");
			return ajaxJson;
		}
		
			
	}
	
	/**
	 * 删除文本
	 * @param ids
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/deleteWenben.do", method = RequestMethod.POST)
	@ResponseBody
	public AjaxJson deleteWenben(String ids, HttpServletResponse response){
		AjaxJson ajaxJson = new AjaxJson();
		try {
				
			String id[] = ids.split(",");
			
			for (int i = 0; i < id.length; i++) {
				wenbenService.deleteWenbenById(id[i]);
			}
			ajaxJson.setSuccess(true);
			ajaxJson.setMsg("删除成功");
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e);
			ajaxJson.setSuccess(false);
		}
		return ajaxJson;
	}
}
