package dogo.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import dogo.modeljson.AjaxJson;
import dogo.util.SmsUtils;
import dogo.util.StringUtils;

/**
 * 发送短信
 * @Project:  jit_crj
 * @ClassName: SendCodeCommonAction.java
 * @Company: JIT Northeast R & D 
 * @Description: TODO
 * @author  Administrator
 * @date  2016年1月25日
 */
@Controller
public class SendCodeCommonController {
	
	/**
	 * 发送验证码
	 * @param response
	 * @param request
	 * @throws Exception
	 */
	@RequestMapping(value = "/proscenium/sendCodeCommon/sendCodeCommon.do", method = RequestMethod.POST)
	@ResponseBody
	public AjaxJson sendCodeCommon(String phone,HttpServletResponse response,HttpServletRequest request) {
		AjaxJson ajaxJson = new AjaxJson();
		//生成四位验证码
		String code = StringUtils.randomCode();
		Map<String,Object> sendMap=new HashMap<String,Object>();
		String[] mobiles = new String[1];
		mobiles[0] = phone;
		sendMap.put("sendTime", "");
		sendMap.put("mobiles", mobiles);
		sendMap.put("smsContent", "【吉大正元】您的验证码是："+ code +"。请不要把验证码泄露给其他人。");
		sendMap.put("smsPriority", 5);
		SmsUtils.getInstance();
		String reportStatus = "0";
//		String reportStatus = SmsUtils.sendSMS(sendMap);
		Map<String,Object> returnMap = new HashMap<String,Object>();
		returnMap.put("code", code);
		returnMap.put("reportStatus", reportStatus);
//		System.out.println("发送状态:"+reportStatus+",,,,验证码:"+code);
//		JSONObject object = JSONObject.fromObject(returnMap);
//		renderJson(response, object.toString(), "encoding:UTF-8");
		if ("0".equals(reportStatus)) {
			ajaxJson.setCode(code);
			ajaxJson.setMsg("发送成功！");
			System.out.println(",,,,验证码:" + code);
			return ajaxJson;
		} else {
			ajaxJson.setCode("000001");
			ajaxJson.setMsg("发送失败！请重新发送！");
			return ajaxJson;
		}
		
	}
}
