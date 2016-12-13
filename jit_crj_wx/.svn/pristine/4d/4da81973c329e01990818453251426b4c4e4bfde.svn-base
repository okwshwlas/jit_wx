package dogo.service;


import org.springframework.stereotype.Service;

import dogo.weixin.core.WeiXinUtil;

@Service("MessageNotifyServiceI")
public class MessageNotifyServiceImpl implements MessageNotifyServiceI{
	
	public boolean send(String contentJson,String token){
		WeiXinUtil util = new WeiXinUtil();
		return util.createMobanMessage(contentJson, token);
	}
}
