package dogo.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import dogo.model.Huanying;
import dogo.model.HuanyingTuwen;
import dogo.modeljson.AjaxJson;
import dogo.service.HuanyingService;
import dogo.service.HuanyingTuwenService;
import dogo.util.ResourceUtil;


@Controller
@RequestMapping("/huanyingController/*")
public class HuanyingController {
	
	private HuanyingService huanyingService;
	
	private HuanyingTuwenService huanyingTuwenService;

	public HuanyingTuwenService getHuanyingTuwenService() {
		return huanyingTuwenService;
	}
	@Resource
	public void setHuanyingTuwenService(HuanyingTuwenService huanyingTuwenService) {
		this.huanyingTuwenService = huanyingTuwenService;
	}
	public HuanyingService getHuanyingService() {
		return huanyingService;
	}
	@Resource
	public void setHuanyingService(HuanyingService huanyingService) {
		this.huanyingService = huanyingService;
	}

	/**
	 * 根据id查询欢迎文本
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/selectHuanyingById.do", method = RequestMethod.POST)
	@ResponseBody
	public Huanying selectHuanyingById(String id) {
		
		try {
			Huanying huanying = huanyingService.selectHuanyingWenbenById(id);
			return huanying;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	/**
	 * 修改欢迎文本
	 * @param huanying
	 * @return
	 */
	@RequestMapping(value = "/updateHuanyingById.do", method = RequestMethod.POST)
	@ResponseBody
	public AjaxJson updateHuanying(Huanying huanying) {
		AjaxJson ajaxJson = new AjaxJson();
		try {
			huanyingService.updateHuanyingById(huanying);
			ajaxJson.setSuccess(true);
			ajaxJson.setMsg("保存成功");
			return ajaxJson;
		} catch (Exception e) {
			e.printStackTrace();
			ajaxJson.setSuccess(false);
			ajaxJson.setMsg("保存失败");
			return ajaxJson;
		}
	}
	
	/**
	 * 查询欢迎图文
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/selectAllHuanyingtuwenById.do", method = RequestMethod.POST)
	@ResponseBody
	public HuanyingTuwen selectAllHuanyingtuwenById(String id){
		HuanyingTuwen huanyingTuwen;
		try {
			huanyingTuwen = huanyingService.selectAllHuanyingtuwenById(id);
			return huanyingTuwen;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	/**
	 * 修改父欢迎图文
	 * @param huanyingTuwen
	 * @return
	 */
	@RequestMapping(value = "/updateHuanyingTuwenParentById.do", method = RequestMethod.POST)
	@ResponseBody
	public AjaxJson updateHuanyingTuwenParentById(HuanyingTuwen huanyingTuwen,HttpServletRequest request) {
		AjaxJson ajaxJson = new AjaxJson();
		try {
			String neirong = huanyingTuwen.getNeirong();
			if(huanyingTuwen.getLink()==null||huanyingTuwen.getLink().equals("")){
				huanyingTuwen.setLink("");
				if(neirong!=null&&!neirong.equals("")){
					huanyingTuwen.setLink(ResourceUtil.getUrl(request)+"/WeixinZhuanfaServlet?id="+huanyingTuwen.getId()+"&flag=1");
				}
			}
			if(null == huanyingTuwen.getId()||"".equals(huanyingTuwen.getId())){
				huanyingTuwen.setId("aaaaaaaaaa");
				huanyingTuwenService.addHuanyingTuwen(huanyingTuwen);
			}else{
				huanyingTuwenService.updateHuanyingTuwenParentById(huanyingTuwen);
			}
			ajaxJson.setSuccess(true);
			ajaxJson.setMsg("保存成功");
			return ajaxJson;
		} catch (Exception e) {
			e.printStackTrace();
			ajaxJson.setSuccess(false);
			ajaxJson.setMsg("保存失败");
			return ajaxJson;
		}
	}
}
