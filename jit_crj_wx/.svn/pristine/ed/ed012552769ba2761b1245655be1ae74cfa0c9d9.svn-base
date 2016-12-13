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

import dogo.model.Gongzhong;
import dogo.modeljson.AjaxJson;
import dogo.service.GongzhongZhanghaoService;
import dogo.util.Page;
import dogo.util.UUID;

@Controller
@RequestMapping("/gongzhongZhanghaoController/*")
public class GongzhongZhanghaoController {
	
	private static final Logger log = Logger.getLogger(GongzhongZhanghaoController.class);
	
	private GongzhongZhanghaoService gongzhongZhanghaoService;

	public GongzhongZhanghaoService getGongzhongZhanghaoService() {
		return gongzhongZhanghaoService;
	}
	@Resource
	public void setGongzhongZhanghaoService(
			GongzhongZhanghaoService gongzhongZhanghaoService) {
		this.gongzhongZhanghaoService = gongzhongZhanghaoService;
	}

	/**
	 * 带分页查询所有公众账号
	 * @param gongzhong
	 * @param page
	 * @return
	 */
	@RequestMapping(value="/selectAllGongZhongZhanghao.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> selectAllZhanghao(Gongzhong gongzhong,Page page) {
		Map<String, Object> res = new HashMap<String, Object>();
		try {
			//查询条件
			res.put("gongzhong", gongzhong);
			res.put("page", page);
			//记录数
			int count = gongzhongZhanghaoService.selectAllGZZHCount(res);
			//结果集
			List<Gongzhong> list = gongzhongZhanghaoService.selectAllGZZHByPage(res);
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
	 * 新增公众账号
	 * @param gongzhong
	 * @return
	 */
	@RequestMapping(value = "/insertGongzhongZhanghao.do", method = RequestMethod.POST)
	@ResponseBody
	public AjaxJson insertGongzhongZhanghao(Gongzhong gongzhong ){
		AjaxJson ajaxJson = new AjaxJson();
		try {
			gongzhong.setId(UUID.getUID());
			gongzhongZhanghaoService.insertGongzhongZhanghao(gongzhong);
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
	 * 根据id查询公众账号
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/selectGongzhongZhanghaoById.do",method=RequestMethod.POST)
	@ResponseBody
	public Gongzhong selectGongzhongZhanghaoById(String id) {
		try {
			Gongzhong gongzhong = gongzhongZhanghaoService.selectGongzhongZhanghaoById(id);
			return gongzhong;
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e);
			return null;
		}
		
	}
	/**
	 * 修改公众账号
	 * @param gongzhong
	 * @return
	 */
	@RequestMapping(value = "/updateGongzhongZhanghao.do", method = RequestMethod.POST)
	@ResponseBody
	public AjaxJson updateGongzhongZhanghao(Gongzhong gongzhong){ 
		AjaxJson ajaxJson = new AjaxJson();
		try {
			if(null == gongzhong.getId()){
				gongzhong.setId("1");
				gongzhongZhanghaoService.insertGongzhongZhanghao(gongzhong);
			}else{
				gongzhongZhanghaoService.updateGongzhongZhanghao(gongzhong);
			}
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
	 * 删除公众账号
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/deleteGongzhongZhanghao.do", method = RequestMethod.POST)
	@ResponseBody
	public AjaxJson deleteGongzhongZhanghao(String id){ 
		AjaxJson ajaxJson = new AjaxJson();
		try {
			gongzhongZhanghaoService.deleteGongzhongZhanghao(id);
			ajaxJson.setSuccess(true);
			ajaxJson.setMsg("删除成功");
			return ajaxJson;
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e);
			ajaxJson.setSuccess(true);
			ajaxJson.setMsg("删除失败");
			return ajaxJson;
		}
	}
}
