package dogo.controller;

import com.alibaba.fastjson.JSON;
import dogo.model.CrjPaylog;
import dogo.model.Gongzhong;
import dogo.modeljson.AjaxJson;
import dogo.modeljson.BaseJson;
import dogo.modeljson.JsonDateValueProcessor;
import dogo.service.CrjRyjbxxServiceI;
import dogo.service.CrjWxQzPayServicel;
import dogo.service.GongzhongZhanghaoService;
import dogo.util.DataUtils;
import dogo.util.HttpClientUtil;
import dogo.util.Params;
import dogo.util.UUID;
import dogo.weixin.core.WeiXinUtil;
import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.json.JsonConfig;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import sun.misc.BASE64Decoder;

@Controller
@RequestMapping({ "/crj/wxqz" })
public class WxqzController {
	private static final Logger log = Logger.getLogger(WxqzController.class);

	@Autowired
	private CrjRyjbxxServiceI crjRyjbxxServiceI;

	@Autowired
	private CrjWxQzPayServicel crjWxQzPayServiceI;

	@Autowired
	private GongzhongZhanghaoService gongzhongZhanghaoService;

	public CrjWxQzPayServicel getCrjWxQzPayServiceI() {
		return this.crjWxQzPayServiceI;
	}

	public void setCrjWxQzPayServiceI(CrjWxQzPayServicel crjWxQzPayServiceI) {
		this.crjWxQzPayServiceI = crjWxQzPayServiceI;
	}

	@RequestMapping(value = { "/end.do" }, method = { org.springframework.web.bind.annotation.RequestMethod.POST })
	public void addYuYueByWorktime(HttpServletResponse response, HttpServletRequest request) throws IOException {
		String type = request.getParameter("xxcome");
		String openid = request.getParameter("openid");
		String dwmc = request.getParameter("dwmc");
		String dwdz = request.getParameter("dwdz");
		String reywbh = request.getParameter("reywbh");
		AjaxJson ajaxJson = new AjaxJson();
		String ret = "";
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		BaseJson baseJson = new BaseJson();

		String endywxx = request.getParameter("endywxx");
		String dwxx = "请将:业务信息填写到邮封备注栏中,并根据办理单位信息填写邮寄信息";
		String ywbh = "";
		String yysjfw = "";
		String shijian = "";
		String Strid = Params.getCode();
		try {
			SimpleDateFormat dateFormater = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date();

			shijian = dateFormater.format(date);

			Gongzhong gongzhong = this.gongzhongZhanghaoService.selectGongzhongZhanghaoById("1");
			String appid = gongzhong.getAccountAppid();
			String appsecret = gongzhong.getAccountAppsecret();
			WeiXinUtil util = new WeiXinUtil();

			if ((type != null) && ("2".equals(type))) {
				String token = util.getAccess_token(appid, appsecret);
				String params = "{\"touser\":\"" + openid
						+ "\",\"template_id\":\"h31AWXFqF0k3xxVLAbSjR6idAZpxQCWI90DwaINSqqU\",\"url\":\"\",\"topcolor\":\"#FF0000\",\"data\":{"
						+ "\"first\": {\"value\":\"尊敬的客户，您的业务已受理成功！\",\"color\":\"#173177\"},\"keyword1\":{ \"value\":\""
						+ endywxx + "\", \"color\":\"#173177\" },\"keyword2\": {\"value\":\"" + shijian
						+ "\", \"color\"" + ":\"#173177\" },\"remark\":{\"value\":\"" + dwxx
						+ "\",\"color\":\"#173177\"}}}";

				boolean flag = util.createMobanMessage(params, token);

				String params_csfw = "{\"touser\":\"" + openid
						+ "\",\"template_id\":\"h31AWXFqF0k3xxVLAbSjR6idAZpxQCWI90DwaINSqqU\",\"url\":\"\",\"topcolor\":\"#FF0000\",\"data\":{"
						+ "\"first\": {\"value\":\"尊敬的客户，您的业务已受理成功！\",\"color\":\"#173177\"},\"keyword1\":{ \"value\":\""
						+ endywxx + "\", \"color\":\"#173177\" },\"keyword2\": {\"value\":\"" + shijian
						+ "\", \"color\"" + ":\"#173177\" },\"remark\":{\"value\":\"" + dwxx
						+ "\",\"color\":\"#173177\"}}}";
				String csfw = URLEncoder.encode(params_csfw, "UTF-8");
				csfw = "https://city.weixin.qq.com/cgi-bin/entry?result_data=" + csfw + "#wechat_redirect";
				baseJson.setData(csfw);

				JsonConfig jsonConfig = new JsonConfig();
				jsonConfig.registerJsonValueProcessor(Date.class, new JsonDateValueProcessor());
				net.sf.json.JSONObject aa = net.sf.json.JSONObject.fromObject(baseJson, jsonConfig);
				ret = JSON.toJSONString(aa);

				out = response.getWriter();
				out.print(ret);
			} else if("3".equals(type)) {
				//全流程
				String params = "{\"first\":\"全流程业务申请成功!\",\"keyword1\":\"" + endywxx + "\",\"keyword2\":\""
						+ dwmc + "\",\"keyword3\":\"" + dwdz + "\",\"keyword4\":\"" + request.getParameter("dwxx") + "\",\"remark\":\""
						+ dwxx + "\"}";

				WxqzController wxqzController = new WxqzController();
				wxqzController.sendMbxx(openid, "4", params, request, response);
				out = response.getWriter();
				out.print(ret);
			}
			else if("5".equals(type)) {
				//扫码支付
				String params = "{\"first\":\"尊敬的客户，您的业务已受理成功！\",\"keyword1\":\"" + reywbh + "\",\"keyword2\":\"出入境扫码支付\",\"keyword3\":\"" + shijian
						+ "\",\"keyword4\":\"" + request.getParameter("feiYong") + "元\",\"remark\":\"\"}";

				WxqzController wxqzController = new WxqzController();
				wxqzController.sendMbxx(openid, "5", params, request, response);
				out = response.getWriter();
				out.print(ret);
			}
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			e.printStackTrace();
			ajaxJson.setCode("000001");
			ajaxJson.setMsg("预约失败！");
			out.print(JSON.toJSONString(ajaxJson));
		} finally {
			out.flush();
			out.close();
		}
	}
	/**
	 * @Title: getToken
	
	 * @Description: 获取请求大平台接口权限参数
	
	 * @param: @param response
	 * @param: @param request
	 * @param: @throws IOException   
	
	 * @return: void   
	
	 * @throws
	 */

	@RequestMapping(value = { "/getToken.do" }, method = { org.springframework.web.bind.annotation.RequestMethod.POST })
	public void getToken(HttpServletResponse response, HttpServletRequest request) throws IOException {
		AjaxJson ajaxJson = new AjaxJson();
		String ret = "";
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		BaseJson baseJson = new BaseJson();
		String returnString = "";
		try {
			String url = "http://192.168.2.114:80/mc/api/console/token";

			String data = "{\"appId\":\"100081\",\"secrectKey\":\"KbaHD6Rrs9DVr3mX\"}";
			System.out.println(data);
			returnString = HttpClientUtil.getFeiInfo(url, data);
		} catch (Exception localException) {
		}

		baseJson.setData(returnString);

		JsonConfig jsonConfig = new JsonConfig();

		net.sf.json.JSONObject aa = net.sf.json.JSONObject.fromObject(baseJson, jsonConfig);
		ret = JSON.toJSONString(aa);

		out = response.getWriter();
		out.print(ret);
	}
	/**
	 * 
	
	 * @Title: getTokenTime
	
	 * @Description: 获取请求大平台接口权限参数时限
	
	 * @param: @param response
	 * @param: @param request
	 * @param: @throws IOException   
	
	 * @return: void   
	
	 * @throws
	 */

	@RequestMapping(value = { "/getTokenTime.do" }, method = {
			org.springframework.web.bind.annotation.RequestMethod.GET })
	public void getTokenTime(HttpServletResponse response, HttpServletRequest request) throws IOException {
		String returnString = "";
		String ret = "";
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		BaseJson baseJson = new BaseJson();
		try {
			String url = "http://192.168.2.114:80/mc/api/console/token/ttl";

			String data = request.getParameter("token");

			returnString = HttpClientUtil.sendGet(url, data);
		} catch (Exception localException) {
		}
		baseJson.setData(returnString);

		JsonConfig jsonConfig = new JsonConfig();

		net.sf.json.JSONObject aa = net.sf.json.JSONObject.fromObject(baseJson, jsonConfig);
		ret = JSON.toJSONString(aa);

		out = response.getWriter();
		out.print(ret);
	}
	/**
	 * 
	
	 * @Title: getZhuCe
	
	 * @Description: 获取大平台注册信息
	
	 * @param: @param response
	 * @param: @param request
	 * @param: @throws IOException   
	
	 * @return: void   
	
	 * @throws
	 */

	@RequestMapping(value = { "/getZhuCe.do" }, method = { org.springframework.web.bind.annotation.RequestMethod.POST })
	public void getZhuCe(HttpServletResponse response, HttpServletRequest request) throws IOException {
		String ret = "";
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		BaseJson baseJson = new BaseJson();
		String returnString = "";
		String token = request.getParameter("token");
		//手机号码
		String userName = request.getParameter("userName");
		try {
			String url = "http://gaapi.jl.gov.cn/MicroService/api/v1/member/getmemberinfo";

			String data = "userName=" + userName;
			System.out.println(data);
			returnString = HttpClientUtil.post(url, data, token);
		} catch (Exception localException) {
		}
		baseJson.setData(returnString);
		JsonConfig jsonConfig = new JsonConfig();
		net.sf.json.JSONObject aa = net.sf.json.JSONObject.fromObject(baseJson, jsonConfig);
		ret = JSON.toJSONString(aa);
		out = response.getWriter();
		out.print(ret);
	}
	/**
	 * 
	
	 * @Title: sendMbxx
	
	 * @Description: 发送模板消息接口
	
	 * @param: @param opneid 吉林公安公众号openid
	 * @param: @param type  模板标识
	 * @param: @param parmas 模板参数
	 * @param: @param request
	 * @param: @param response
	 * @param: @throws IOException   
	
	 * @return: void   
	
	 * @throws
	 */

	@RequestMapping(value = { "/sendMbxx.do" }, method = { org.springframework.web.bind.annotation.RequestMethod.POST })
	public void sendMbxx(String opneid, String type, String parmas, HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String ret = "";
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		BaseJson baseJson = new BaseJson();
		String returnString = "";

		String tokenurl = " http://192.168.2.114:80/mc/api/console/token";

		String tokendata = "{\"appId\":\"100081\",\"secrectKey\":\"KbaHD6Rrs9DVr3mX\"}";
		String token = HttpClientUtil.getFeiInfo(tokenurl, tokendata);
		token = (String) JSON.parseObject(token).get("data");
		try {
			String url = "http://gaapi.jl.gov.cn/MicroService/api/v1/wxsms/send";

			String data = "{\"openid\":\"";
			data = data + opneid;
			data = data + "\",";
			data = data + "\"type\":\"";
			data = data + type;
			data = data + "\",";
			data = data + "\"param\":";
			data = data + parmas;
			data = data + "}";

			returnString = HttpClientUtil.mbpost(url, data, token);
		} catch (Exception localException) {
		}
		baseJson.setData(returnString);
		JsonConfig jsonConfig = new JsonConfig();
		net.sf.json.JSONObject aa = net.sf.json.JSONObject.fromObject(baseJson, jsonConfig);
		ret = JSON.toJSONString(aa);
		out = response.getWriter();
		out.print(ret);
	}

	@RequestMapping(value = { "/zhuCeSave.do" }, method = {
			org.springframework.web.bind.annotation.RequestMethod.POST })
	public void zhuCeSave(HttpServletResponse response, HttpServletRequest request) throws IOException {
		String ret = "";
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		BaseJson baseJson = new BaseJson();
		String returnString = "";
		String token = request.getParameter("token");
		String mobile = request.getParameter("mobile");
		String userType = request.getParameter("userType");
		String passwd = request.getParameter("passwd");
		String src = request.getParameter("src");
		try {
			String url = "http://gaapi.jl.gov.cn/MicroService/api/v1/member/memberregister";

			String data = "";
			data = data + "mobile=" + mobile;
			data = data + "&userType=" + userType;
			data = data + "&passwd=" + passwd;
			data = data + "&src=" + src;
			System.out.println(data);
			returnString = HttpClientUtil.post(url, data, token);
		} catch (Exception localException) {
		}
		baseJson.setData(returnString);
		JsonConfig jsonConfig = new JsonConfig();
		net.sf.json.JSONObject aa = net.sf.json.JSONObject.fromObject(baseJson, jsonConfig);
		ret = JSON.toJSONString(aa);
		System.out.println(returnString);
		out = response.getWriter();
		out.print(ret);
	}

	@RequestMapping(value = { "/smrzSave.do" }, method = { org.springframework.web.bind.annotation.RequestMethod.POST })
	public void smrzSave(HttpServletResponse response, HttpServletRequest request) throws IOException {
		String ret = "";
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		BaseJson baseJson = new BaseJson();
		String returnString = "";
		String token = request.getParameter("token");
		String gmsfhm = request.getParameter("gmsfhm");
		String xm = request.getParameter("xm");
		String guid = request.getParameter("guid");
		try {
			String url = "http://gaapi.jl.gov.cn/MicroService/api/v1/member/memberinforz";
			String data = "";
			data = data + "userguid=" + guid;
			data = data + "&gmsfhm=" + gmsfhm;
			data = data + "&xm=" + xm;
			returnString = HttpClientUtil.post(url, data, token);
		} catch (Exception localException) {
		}
		baseJson.setData(returnString);
		JsonConfig jsonConfig = new JsonConfig();
		net.sf.json.JSONObject aa = net.sf.json.JSONObject.fromObject(baseJson, jsonConfig);
		ret = JSON.toJSONString(aa);
		out = response.getWriter();
		out.print(ret);
	}

	@RequestMapping(value = { "/getzhucexx.do" }, method = {
			org.springframework.web.bind.annotation.RequestMethod.POST })
	public void getzhucexx(HttpServletResponse response, HttpServletRequest request) throws IOException {
		String ret = "";
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		BaseJson baseJson = new BaseJson();
		String returnString = "";
		String token = request.getParameter("token");
		String gmsfhm = request.getParameter("gmsfhm");
		String xm = request.getParameter("xm");
		String guid = request.getParameter("guid");
		try {
			String url = "http://gaapi.jl.gov.cn/MicroService/api/v1/member/memberinforz";
			String data = "";
			data = data + "userguid=" + guid;
			data = data + "&gmsfhm=" + gmsfhm;
			data = data + "&xm=" + xm;
			returnString = HttpClientUtil.post(url, data, token);
		} catch (Exception localException) {
		}
		baseJson.setData(returnString);
		JsonConfig jsonConfig = new JsonConfig();
		net.sf.json.JSONObject aa = net.sf.json.JSONObject.fromObject(baseJson, jsonConfig);
		ret = JSON.toJSONString(aa);
		out = response.getWriter();
		out.print(ret);
	}

	@RequestMapping(value = { "/findRzResult.do" }, method = {
			org.springframework.web.bind.annotation.RequestMethod.POST })
	public void findRzResult(HttpServletResponse response, HttpServletRequest request) throws IOException {
		String returnString = "";
		String ret = "";
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		BaseJson baseJson = new BaseJson();
		try {
			String sn = request.getParameter("sn");
			String url = "http://gaapi.jl.gov.cn/MicroService/api/v1/member/memberinforzquery?sn=" + sn;

			String token = request.getParameter("token");

			returnString = HttpClientUtil.sendGetToken(url, "", token);
		} catch (Exception localException) {
		}
		baseJson.setData(returnString);

		JsonConfig jsonConfig = new JsonConfig();

		net.sf.json.JSONObject aa = net.sf.json.JSONObject.fromObject(baseJson, jsonConfig);
		ret = JSON.toJSONString(aa);

		out = response.getWriter();
		out.print(ret);
	}

	@RequestMapping(value = { "pay.do" }, method = { org.springframework.web.bind.annotation.RequestMethod.POST })
	public void crjPayment(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map map = new HashMap();
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path
				+ "/";

		double amt = Double.parseDouble(request.getParameter("amt"));
		String payno = request.getParameter("payno");
		String personName = request.getParameter("name");
		String phoneNum = request.getParameter("sjhm");

//		String settleDesc = "测试商品";
		String settleDesc = request.getParameter("settleDesc");
		//String payedurl = request.getParameter("payedurl");
		String bizNo = request.getParameter("bizNo");
		String ywbh = request.getParameter("ywbh");

		String catName = "出入境缴费";
		String catCode = "1170010";

		String code = "";
		DataUtils.getInstance();
		String dateLong = String.valueOf(DataUtils.dateToDateTimeZoneLong(new Date()));
		try {
			CrjPaylog getcrjPayLog = this.crjWxQzPayServiceI.selectByBizNo(bizNo);
			if (getcrjPayLog == null) {
				CrjPaylog crjPay = new CrjPaylog();
				crjPay.setId(UUID.getUID());
				crjPay.setBizNo(bizNo);
				crjPay.setAmt(amt);
				crjPay.setCatName(catName);
				crjPay.setCatCode(catCode);
				crjPay.setPayerName(personName);
				crjPay.setBizDate(dateLong.substring(0, dateLong.length() - 3));
				crjPay.setBizNo(bizNo);
				crjPay.setPaytime(new Date());
				crjPay.setPayerNo(payno);
				crjPay.setSettleDesc(settleDesc);
				crjPay.setPayerMobileNo(phoneNum);
				crjPay.setYwbh(ywbh);
				crjPay.setPayStatus("0");

				this.crjWxQzPayServiceI.insert(crjPay);
			} else {
				this.crjWxQzPayServiceI.updateByPrimaryKey(getcrjPayLog);
			}
			code = "1";
		} catch (Exception e) {
			System.out.println("数据库访问异常");
			code = "0";
		}
		String ret = "";
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		BaseJson baseJson = new BaseJson();
		baseJson.setData(code);

		JsonConfig jsonConfig = new JsonConfig();

		net.sf.json.JSONObject aa = net.sf.json.JSONObject.fromObject(baseJson, jsonConfig);
		ret = JSON.toJSONString(aa);

		out = response.getWriter();
		out.print(ret);
	}

	@RequestMapping(value = { "/getGaToken.do" }, method = {
			org.springframework.web.bind.annotation.RequestMethod.POST })
	public void getGaToken(HttpServletResponse response, HttpServletRequest request) throws IOException {
		String ret = "";
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		BaseJson baseJson = new BaseJson();
		String token = request.getParameter("token");
		Map reMap = new HashMap();

		BASE64Decoder decoder = new BASE64Decoder();
		String urlend = new String(decoder.decodeBuffer(token), "utf-8");
		String returnString = URLDecoder.decode(urlend, "utf-8");

		baseJson.setCode("1");
		reMap = URLRequest(returnString);
		baseJson.setData(reMap);
		JsonConfig jsonConfig = new JsonConfig();
		net.sf.json.JSONObject aa = net.sf.json.JSONObject.fromObject(baseJson, jsonConfig);
		ret = JSON.toJSONString(aa);
		out = response.getWriter();
		out.print(ret);
	}

	public static Map<String, String> URLRequest(String data) {
		Map mapRequest = new HashMap();
		String[] arrSplit = null;

		arrSplit = data.split("[&]");
		for (String strSplit : arrSplit) {
			String[] arrSplitEqual = null;
			arrSplitEqual = strSplit.split("[=]");

			if (arrSplitEqual.length > 1) {
				mapRequest.put(arrSplitEqual[0], arrSplitEqual[1]);
			} else {
				if (arrSplitEqual[0] == "") {
					continue;
				}
				mapRequest.put(arrSplitEqual[0], "");
			}
		}

		return mapRequest;
	}
//	"http://221.8.52.247:8445/jit_crj/crj/WxQz/findbzjdxx.do"
	@RequestMapping(value = { "/findbzjdxx.do" }, method = {
			org.springframework.web.bind.annotation.RequestMethod.POST })
	public void findbzjdxx(HttpServletResponse response, HttpServletRequest request) throws IOException {
		String returnString = "";
		String ret = "";
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		BaseJson baseJson = new BaseJson();
		try {
			String sfzh = request.getParameter("sfzh");
			String url = "http://192.168.2.154:8445/jit_crj/crj/WxRy/findbzjdxx.do";
			String param = "sfzh="+sfzh;
			returnString = HttpClientUtil.sendPost(url, param);
		} catch (Exception localException) {
			System.out.println(localException);
		}
		baseJson.setCode("1");
		
		baseJson.setData(returnString);

		JsonConfig jsonConfig = new JsonConfig();

		net.sf.json.JSONObject aa = net.sf.json.JSONObject.fromObject(baseJson, jsonConfig);
		ret = JSON.toJSONString(aa);

		out = response.getWriter();
		out.print(ret);
		
	}
	
	@RequestMapping(value = { "/returnhide.do" }, method = {
			org.springframework.web.bind.annotation.RequestMethod.POST })
	public void returnhide(HttpServletResponse response, HttpServletRequest request) throws IOException {
		String returnString = "";
		String ret = "";
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		BaseJson baseJson = new BaseJson();
		try {
			String sfzh = request.getParameter("sfzh");
			String url = "http://192.168.2.154:8445/jit_crj/crj/WxRy/returnhide.do";
			String param = "sfzh="+sfzh;


			returnString = HttpClientUtil.sendPost(url, param);
		} catch (Exception localException) {
		}
		baseJson.setData(returnString);

		JsonConfig jsonConfig = new JsonConfig();

		net.sf.json.JSONObject aa = net.sf.json.JSONObject.fromObject(baseJson, jsonConfig);
		ret = JSON.toJSONString(aa);

		out = response.getWriter();
		out.print(ret);
		
	}

	@RequestMapping(value = { "/lstdmbsend.do" }, method = { org.springframework.web.bind.annotation.RequestMethod.POST })
	public void lstdmbsend(HttpServletResponse response, HttpServletRequest request) throws IOException {
		response.addHeader("Access-Control-Allow-Origin", "*");
		//业务来源 0吉林公安  1出入境
		String xxcome =  request.getParameter("ywly");
		String type = request.getParameter("type");
		String openid = request.getParameter("openid");
		AjaxJson ajaxJson = new AjaxJson();
		String ret = "";
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		BaseJson baseJson = new BaseJson();

		try {
			Gongzhong gongzhong = this.gongzhongZhanghaoService.selectGongzhongZhanghaoById("1");
			String appid = gongzhong.getAccountAppid();
			String appsecret = gongzhong.getAccountAppsecret();
			WeiXinUtil util = new WeiXinUtil();
			if("0".equals(xxcome)){
				if("0".equals(type)){
					String sfirst =request.getParameter("first");
					String skeyword1   =request.getParameter("keyword1");
					String skeyword2 =request.getParameter("keyword2");
					String skeyword3 =request.getParameter("keyword3");
					String skeyword4 =request.getParameter("keyword4");
					String skeyword5 =request.getParameter("keyword5");
					String sremark =request.getParameter("remark");
					//绿色通道成功
					String params = "{\"first\":\""+sfirst+"\",\"keyword1\":\"" + skeyword1 + "\",\"keyword2\":\""+skeyword3+"\",\"keyword3\":\"" + skeyword4
							+ "\",\"keyword4\":\"" + skeyword4 + "\",\"skeyword5\":\"" + skeyword5 + "\",\"remark\":\""+sremark+"\"}";

					WxqzController wxqzController = new WxqzController();
					wxqzController.sendMbxx(openid, "5", params, request, response);
					out = response.getWriter();
					out.print(ret);
				}
				if("1".equals(type)){
					String ffirst =request.getParameter("first");
					String fkeyword1   =request.getParameter("keyword1");
					String fkeyword2 =request.getParameter("keyword2");
					String fremark =request.getParameter("remark");
					//绿色通道审核未通过
					String params = "{\"first\":\""+ffirst+"\",\"keyword1\":\"" + fkeyword1 + "\",\"keyword2\":\""+fkeyword2+"\",\"remark\":\""+fremark+"\"}";
					WxqzController wxqzController = new WxqzController();
					wxqzController.sendMbxx(openid, "5", params, request, response);
					out = response.getWriter();
					out.print(ret);
				}
				
				
			}else if("1".equals(xxcome)){
				
				if("0".equals(type)){
					String token = util.getAccess_token(appid, appsecret);
					String sfirst =request.getParameter("first");
					String skeyword1   =request.getParameter("keyword1");
					String skeyword2 =request.getParameter("keyword2");
					String skeyword3 =request.getParameter("keyword3");
					String skeyword4 =request.getParameter("keyword4");
					String skeyword5 =request.getParameter("keyword5");
					String sremark =request.getParameter("remark");
					String params = "{\"touser\":\"" + openid
							+ "\",\"template_id\":\"4K27muZQ_7Ddve7zl5RZR0pGUHVaaOSmlFu1MjwuqUw\",\"url\":\"\",\"topcolor\":\"#FF0000\",\"data\":{"
							+ "\"first\": {\"value\":\""+sfirst+"\",\"color\":\"#173177\"},\"keyword1\":{ \"value\":\""
							+ skeyword1 + "\", \"color\":\"#173177\" },\"keyword2\": {\"value\":\"" + skeyword2
							+ "\", \"color\"" + ":\"#173177\" },\"keyword3\": {\"value\":\"" + skeyword3
							+ "\", \"color\"" + ":\"#173177\" },\"keyword4\": {\"value\":\"" + skeyword4
							+ "\", \"color\"" + ":\"#173177\" },\"keyword5\": {\"value\":\"" + skeyword5
							+ "\", \"color\"" + ":\"#173177\" },\"remark\":{\"value\":\"" + sremark
							+ "\",\"color\":\"#173177\"}}}";
					boolean flag = util.createMobanMessage(params, token);
					JsonConfig jsonConfig = new JsonConfig();
					jsonConfig.registerJsonValueProcessor(Date.class, new JsonDateValueProcessor());
					net.sf.json.JSONObject aa = net.sf.json.JSONObject.fromObject(baseJson, jsonConfig);
					ret = JSON.toJSONString(aa);
					out = response.getWriter();
					out.print(ret);
				}
				if("1".equals(type)){
					String token = util.getAccess_token(appid, appsecret);
					String ffirst =request.getParameter("first");
					String fkeyword1   =request.getParameter("keyword1");
					String fkeyword2 =request.getParameter("keyword2");
					String fremark =request.getParameter("remark");
					String params = "{\"touser\":\"" + openid
							+ "\",\"template_id\":\"hJPHb6TGBd8n1sERqnkorSnx2FkA7Qf0yEuDTsbDkKo\",\"url\":\"\",\"topcolor\":\"#FF0000\",\"data\":{"
							+ "\"first\": {\"value\":\""+ffirst+"\",\"color\":\"#173177\"},\"keyword1\":{ \"value\":\""
							+ fkeyword1 + "\", \"color\":\"#173177\" },\"keyword2\": {\"value\":\"" + fkeyword2
							+ "\", \"color\"" + ":\"#173177\" },\"remark\":{\"value\":\"" + fremark
							+ "\",\"color\":\"#173177\"}}}";

					boolean flag = util.createMobanMessage(params, token);
					JsonConfig jsonConfig = new JsonConfig();
					jsonConfig.registerJsonValueProcessor(Date.class, new JsonDateValueProcessor());
					net.sf.json.JSONObject aa = net.sf.json.JSONObject.fromObject(baseJson, jsonConfig);
					ret = JSON.toJSONString(aa);
					out = response.getWriter();
					out.print(ret);
				}
				
				
				
			}

		} catch (Exception e) {
			log.error(e.getMessage(), e);
			e.printStackTrace();
			ajaxJson.setCode("000001");
			ajaxJson.setMsg("预约失败！");
			out.print(JSON.toJSONString(ajaxJson));
		} finally {
			out.flush();
			out.close();
		}
	}

	public static void main(String[] args) throws IOException {
		String token = "b3BlbklkJTNEb2RBX1JzcWNxQ3dhZEV4aDVNQXZKVk9KdjZmWSUyNnNqaG0lM0QxNTc1NDM3MDY2MCUyNnNmemglM0QlMjZ4eGNvbWUlM0QxJTI2aGtzemRwY3MlM0QyMjAxMTA0MzAlMjZuYW1lJTNEJUU0JUJBJThFJUU1JTg3JUFG";

		BASE64Decoder decoder = new BASE64Decoder();
		String urlend = new String(decoder.decodeBuffer(token), "utf-8");
		String returnString = URLDecoder.decode(urlend, "utf-8");
		System.out.println(returnString);
	}
}