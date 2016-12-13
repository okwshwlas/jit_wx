package dogo.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import dogo.modeljson.AjaxJson;
import dogo.util.Pinyin4jUtil;
@Controller
@RequestMapping("/proscenium/pinyinCommonController/*")
public class PinyinCommonController{
	
	private static final Logger log = Logger.getLogger(PinyinCommonController.class);
	
	
	/**
	 * 根据汉字获取拼音
	 * @param name 汉字
	 * @return
	 */
	@RequestMapping(value = "/getPinyin.do", method = RequestMethod.POST)
	@ResponseBody
	public AjaxJson vailidLogin(String name){
		AjaxJson ajaxJson=new AjaxJson();
		try {
			name = name.replaceAll(" ", "");
			String rstr = Pinyin4jUtil.getPinyinToLowerCase(name);
			ajaxJson.setCode("0");
			ajaxJson.setMsg(rstr);
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e);
			ajaxJson.setCode("1");
			ajaxJson.setMsg("获取拼音失败");
			return ajaxJson;
		}
		return ajaxJson;
	}
	

}
