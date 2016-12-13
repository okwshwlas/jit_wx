/**
 * 
 */
package dogo.util;

import java.io.UnsupportedEncodingException;
import java.rmi.RemoteException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.xml.rpc.ServiceException;

import dogo.sdkaxiswebservice.SDKClient;
import dogo.sdkaxiswebservice.SDKService_ServiceLocator;


/**
 * @Project:  短信接口共同类
 * @ClassName: SmsUtils.java
 * @Description: TODO
 * @author zhang
 * @date  2016年01月23日
 */
public class SmsUtils {
	public static final String GBK = "GBK";
	public static final String softwareSerialNo = Constants.SOFTWARESERIALNO;
	public static final String key = Constants.KEY;
	public static final String serialpass = Constants.SERIALPASS;
	/**
	 * post提交方式
	 */
	public static final String POST = "post";
	/**
	 * get提交方式
	 */
	public static final String GET = "get";
	/**
	 * 短信：手机号（多个以“,”号分隔）
	 */
	public static final String SMS_MOBILES="mobiles";
	/**
	 * 短信：短信内容
	 */
	public static final String SMS_CONTENT="smsContent";
	/**
	 * 支付：交易金额 例：221.00
	 */
	public static final String PAY_AMT="amt";
	/**
	 * 支付：费种名称
	 */
	public static final String PAY_CAT_NAME="catName";
	/**
	 * 支付：费种编码
	 */
	public static final String PAY_CAT_CODE="catCode";
	/**
	 * 支付：付款人标识  如身份证号码
	 */
	public static final String PAY_PAYER_NO="payerNo";
	/**
	 * 支付：支付用户在业务系统中的用户名称
	 */
	public static final String PAY_PAYER_NAME="payerName";
	/**
	 * 支付：商户订单号
	 */
	public static final String PAY_BIZ_NO="bizNo";
	/**
	 * 支付：付款人手机号码
	 */
	public static final String PAY_PAYER_MOBILE_NO="payerMobileNo";
	/**
	 * 支付：商品名称
	 */
	public static final String PAY_SETTLE_DESC="settleDesc";
	/**
	 * 支付：前台通知URL
	 */
	public static final String PAY_FRONT_URL="frontUrl";
	/**
	 * 支付：后台通知URL
	 */
	public static final String PAY_BACK_END_URL="backEndUrl";
	/**
	 * 支付：签名信息
	 */
	public static final String PAY_SIGNATURE="signature";
	/**
	 * 支付：订单日期
	 */
	public static final String PAY_BIZ_DATE="bizDate";
	/**
	 * 支付：响应码
	 */
	public static final String PAY_RESP_CODE="respCode";
	/**
	 * 支付：响应消息
	 */
	public static final String PAY_RESP_MSG="respMsg";
	/**
	 * 支付：结算单号
	 */
	public static final String PAY_SETTLE_NO="settleNo";
	

	
	
	// 私有构造子，禁止外部实例化
	private SmsUtils(){}
	
	public static class Singletom{
		private static SmsUtils instances = new SmsUtils();
	}
	
	public static SmsUtils getInstance(){
		return Singletom.instances;
	}
    
    /**
     * 发送短信类
     * @param map
     * sendTime延时发送，为空时即时发送,mobiles手机号，字符串数组,smsContent短信内容,smsPriority优先级1-5，越高越优先(int)
     * @return 0是成功
     */
    public static String sendSMS(Map<String, Object> map) {
    	
    	String addSerial = "";//扩展号码 (长度小于15的字符串) 用户可通过附加码自定义短信类别扩展号码的功能，需另外申请，当未申请扩展号码功能时，该参数默认为空值即可。
    	long smsID = 0;//短信ID，自定义唯一的消息ID，数字位数最大19位，与状态报告ID一一对应，需用户自定义ID规则确保ID的唯一性。如果smsID为0将获取不到相应的状态报告信息。
    	/**
    	 * 定时短信的定时时间，格式为:年年年年月月日日时时分分秒秒,例如:20090504111010 
    	 * sendTime值为空时，为即时发送短信;sendTime值不为空时，为定时发送短信
    	 */
    	String sendTime = (String)map.get("sendTime");
    	String[] mobiles = (String[])map.get("mobiles");//手机号码(字符串数组,最多为200个手机号码)
    	String smsContent = (String)map.get("smsContent");//短信内容(最多500个汉字或1000个纯英文）
    	int smsPriority = (Integer)map.get("smsPriority");//短信等级，范围1~5，数值越高优先级越高
    	String reportStatus = "1";

    	try {
	    	
			SDKClient _SDKClient = new SDKService_ServiceLocator().getSDKService();
			
			reportStatus =  _SDKClient.sendSMS(softwareSerialNo, key, sendTime, mobiles, smsContent, addSerial, GBK, smsPriority, smsID)+"";
			
		} catch (ServiceException e) {
			System.out.println(e);
			e.printStackTrace();
		} catch (RemoteException e) {
			System.out.println("发送短信异常："+e +"异常号码："+mobiles.toString());
			e.printStackTrace();
		}
			
    	return reportStatus;
    }
    
    
    /**
     * 注册短息序列号类
     * @return 0是成功
     */
    public static String registEx(){
    	
    	String reportStatus = "1";
    	SDKClient _SDKClient;
    	
		try {
			
			_SDKClient = new SDKService_ServiceLocator().getSDKService();
			
			reportStatus = _SDKClient.registEx(softwareSerialNo, key, serialpass)+"";
			
		} catch (ServiceException e) {
			System.out.println(e);
			e.printStackTrace();
		} catch (RemoteException e) {
			System.out.println("注册序列号异常："+e);
			e.printStackTrace();
		}
    	
    	return reportStatus;
    }
    /**
     * 发送支付请求返回MD5加密后的签名信息
     * @throws UnsupportedEncodingException 
     */
    public static String payRequest(Map<String,Object> params) throws UnsupportedEncodingException{
//    	Map params =new HashMap();
//    	params.put("catName", "出入境缴费");
//        params.put("catCode", "0106001");           //业务编号  ?(出入境规则/厅平台规则)
//        params.put("payerNo", "22030219890611081X");//付款人身份证号
//        params.put("payerName", "测试");				//付款人姓名
//        params.put("bizNo", (new Date()).getTime());//业务单号
//        params.put("settleDesc", "华为mate8");		//
//        params.put("amt", "0.01");
//        params.put("payerMobileNo", "13843123581");//支付人电话号码
//        params.put("frontUrl", "http://localhost:8445/jit_crj/basics/jsp/paySuccess.jsp");//前台页面
//        params.put("backEndUrl", "http://localhost:8445/jit_crj/crj/test/Test.do");//后台跳转
//        params.put("bizDate", (new Date()).getTime());
    	
    	//拼接参数字符串
    	StringBuilder signature=new StringBuilder();
    	//所有的参数名称
    	List<String> keys=new ArrayList<String>();
    	//获取所有的参数名称
    	//Set<String> keySet=map.keySet();`
    	Set<String> keySet=params.keySet();
    	//将所有的参数名称添加到集合中（用来排序）
    	for(String key:keySet){
    		keys.add(key);
    	}
    	//将参数名称排序（默认升序）
    	Collections.sort(keys);
    	//拼接所有的参数
    	for(String key:keys){
    		signature.append(key);
    		signature.append("=");
    		signature.append(params.get(key));
    		signature.append("&");
    	}
    	//System.out.println(signature);
    	//移除最后一位多余的“&”
    	signature.deleteCharAt(signature.length()-1);
    	//参数和KEY根据指定规则MD5加密	  
//    	第一次加密**************************************
    	String paySignautureKeyString = md5Hex(Constants.PAY_SIGNATURE_KEY.toLowerCase().getBytes());
		String secondString = String.format("%s&%s",signature.toString(),paySignautureKeyString);
		byte[] contentByte = new byte[1024];
		contentByte = secondString.getBytes("UTF-8");
//        String seString= new String(contentByte,"UTF-8");
		String paraKeyMD5= md5Hex(contentByte);
		//System.out.println(paraKeyMD5);
		//singuate= Md5(key=value&key1&value+&+md5(privateKey))
//    	signature.append("&");
//    	signature.append("signature");
//    	signature.append("=");
//    	signature.append(paraKeyMD5);
//    	System.out.println("一级加密:"+paySignautureKeyString);
//    	System.out.println("最后签名:"+paraKeyMD5);
    	//生成发送支付请求的页面
//    	String url=Constants.PAY_URL+"?"+signature.toString();
//    	System.out.println(url);
    	return paraKeyMD5;
    }
  
    /**
     * 生成请求参数签名信息
     *
     * @param data 请求参数(JSON)
     * @return hash
     */
    public static String md5Hex(byte[] data) {
        return new String(encodeHex(getDigest("MD5").digest(data)));
    }
    public static char[] encodeHex(byte[] data) {
        int l = data.length;
        char[] out = new char[l << 1];
        int i = 0;
        for (int j = 0; i < l; ++i) {
            out[j++] = DIGITS[(240 & data[i]) >>> 4];
            out[j++] = DIGITS[15 & data[i]];
        }
        return out;
    }

    private static final char[] DIGITS = new char[]{'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'};

    static MessageDigest getDigest(String algorithm) {
        try {
            return MessageDigest.getInstance(algorithm);
        } catch (NoSuchAlgorithmException var2) {
            throw new RuntimeException(var2.getMessage());
        }
    }

}
