package dogo.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import dogo.model.Grregist;
import dogo.modeljson.AjaxJson;
import dogo.service.GrregistServiceI;
import dogo.util.StringUtil;

@Controller
@RequestMapping("/proscenium/grregistController/")
public class GrregistController {
	
	private static final Logger log = Logger.getLogger(GrregistController.class);
	
	@Autowired
	private GrregistServiceI grregistServiceI;
	
	
	/**
	 * 根据身份证电话验证码
	 * @param idcard
	 * @param phonenum
	 * @return
	 */
	@RequestMapping(value = "/vailidLogin.do", method = RequestMethod.POST)
	@ResponseBody
	public AjaxJson vailidLogin(String idcard,String phonenum){
		AjaxJson ajaxJson=new AjaxJson();
		try {
			Grregist grregist = grregistServiceI.selectByCardAndPhone(idcard, phonenum);
			if(grregist==null){
				ajaxJson.setCode("1");
				ajaxJson.setMsg("登录失败，信息不拼配");
				return ajaxJson;
			}else{
				if(!StringUtil.isEmpty(grregist.getPyx())){
					//调到信息补全页
					ajaxJson.setCode("0");
					ajaxJson.setMsg("登录成功");
				}else{
					ajaxJson.setCode("2");
					ajaxJson.setMsg("登录成功,请补全信息");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e);
			ajaxJson.setCode("1");
			ajaxJson.setMsg("登录失败");
			return ajaxJson;
		}
		return ajaxJson;
	}

}
