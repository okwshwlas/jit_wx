package dogo.service;


public interface MessageNotifyServiceI {
	
	/*
	 * 发送模版消息
	 * param
	 * 	contentJson:模版消息的JSON
	 *  token
	 */
	boolean send(String contentJson,String token);
}
