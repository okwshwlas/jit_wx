package dogo.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;

import dogo.model.CrjRyjbxx;
import dogo.model.CrjYyxx;
import dogo.model.Gongzhong;
import dogo.model.SysDictionary;
import dogo.model.SysOrganization;
import dogo.model.SysWorkdaySample;
import dogo.model.SysWorktime;
import dogo.model.User;
import dogo.model.Wx_Pc;
import dogo.model.YuYueBean;
import dogo.model.YuYueRiqiBean;
import dogo.model.crjTsxx;
import dogo.modeljson.AjaxJson;
import dogo.modeljson.BaseJson;
import dogo.modeljson.JsonDateValueProcessor;
import dogo.service.CrjRyjbxxServiceI;
import dogo.service.GongzhongZhanghaoService;
import dogo.util.AddressUtils;
import dogo.util.Constants;
import dogo.util.DataUtils;
import dogo.util.Params;
import dogo.util.StringUtil;
import dogo.util.StringUtils;
import dogo.weixin.core.WeiXinUtil;

@Controller
@RequestMapping("/proscenium/crjRyjbxxController")
public class CrjRyjbxxController {
	
	private static final Logger log = Logger.getLogger(CrjRyjbxxController.class);
	
	@Autowired
	private CrjRyjbxxServiceI crjRyjbxxServiceI;
	
	@Autowired
	private GongzhongZhanghaoService gongzhongZhanghaoService;
	
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
			CrjRyjbxx crjRyjbxx = crjRyjbxxServiceI.selectByCardAndPhone(idcard, phonenum);
			if(crjRyjbxx == null){
				ajaxJson.setCode("1");
				ajaxJson.setMsg("登录失败，信息不拼配");
				return ajaxJson;
			}else{
				if(!StringUtil.isEmpty(crjRyjbxx.getPyX())){
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
	
	/**
	 * 根据微信查询预约列表
	 * @param idcard
	 * @param phonenum
	 * @return
	 */
	@RequestMapping(value = "/weixin/WX_Yuyue.do", method = RequestMethod.GET)
	public void WX_Yuyue(HttpServletResponse response,String openid) throws IOException {

		AjaxJson ajaxJson=new AjaxJson();
		
		String ret = "";
		response.setCharacterEncoding("UTF-8"); //设置编码格式
		response.setContentType("text/html");   //设置数据格式
		PrintWriter out = response.getWriter();
		try {
			List list = crjRyjbxxServiceI.listWx_yuyue(openid,null);
			BaseJson baseJson = new BaseJson();
			if (list.size()>0){
				baseJson.setCode("000000");
				baseJson.setMsg("成功");
				baseJson.setData(list);
			}else{
				baseJson.setCode("000002");
				baseJson.setMsg("没有您的预约记录！");
				baseJson.setData("");
			}
			

			JSONObject json = JSONObject.fromObject(baseJson);
			ret = JSON.toJSONString(json);
			
			out = response.getWriter(); //获取写入对象
			out.print(ret); //将json数据写入流中
			
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			e.printStackTrace();
			ajaxJson.setCode("000001");
			ajaxJson.setMsg("操作失败");
			out.print(JSON.toJSONString(ajaxJson));
//			return JSON.toJSONString(ajaxJson);
			
		} finally {
			out.flush();
			out.close();
		}
	}
	/**
	 * 根据微信查询预约时间判定
	 * @param idcard
	 * @param phonenum
	 * @return
	 */
	@RequestMapping(value = "/weixin/WX_YuyueDate.do", method = RequestMethod.GET)
	public void WX_YuyueDate(HttpServletResponse response,String openid) throws IOException {

		AjaxJson ajaxJson=new AjaxJson();
		SimpleDateFormat dateFormater = new SimpleDateFormat("yyyy-MM-dd");
		Date date=new Date();
		String ret = "";
		response.setCharacterEncoding("UTF-8"); //设置编码格式
		response.setContentType("text/html");   //设置数据格式
		PrintWriter out = response.getWriter();
		try {
			List list = crjRyjbxxServiceI.listWx_yuyue(openid,dateFormater.format(date));
			BaseJson baseJson = new BaseJson();
			if (list.size()>0){
				baseJson.setCode("000002");
				baseJson.setMsg("您今天已经进行了预约，一天只能预约一次，不能再次预约了！");
				baseJson.setData("");
			}else{
				baseJson.setCode("000000");
				baseJson.setMsg("成功");
				baseJson.setData("");
			}

			JSONObject json = JSONObject.fromObject(baseJson);
			ret = JSON.toJSONString(json);
			
			out = response.getWriter(); //获取写入对象
			out.print(ret); //将json数据写入流中
			
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			e.printStackTrace();
			ajaxJson.setCode("000001");
			ajaxJson.setMsg("操作失败");
			out.print(JSON.toJSONString(ajaxJson));
//			return JSON.toJSONString(ajaxJson);
			
		} finally {
			out.flush();
			out.close();
		}
	}
	//根据机构id 查询经纬度和提示业务信息（出入境）
	@RequestMapping(value = "/yuyue/findJgdwById.do", method = RequestMethod.GET)
	public void findJgdwById(HttpServletResponse response,String jgdwid) throws IOException {
		AjaxJson ajaxJson=new AjaxJson();
		String ret = "";
		response.setCharacterEncoding("UTF-8"); //设置编码格式
		response.setContentType("text/html");   //设置数据格式
		PrintWriter out = response.getWriter();
			try {
				crjTsxx crjTsxx=crjRyjbxxServiceI.selectByPrimaryKey(jgdwid);
				BaseJson baseJson = new BaseJson();
					if(!"".equals(crjTsxx)){
						baseJson.setCode("000000");
						baseJson.setMsg("成功");
						baseJson.setData(crjTsxx);
					}

				JSONObject json = JSONObject.fromObject(baseJson);
				ret = JSON.toJSONString(json);
				out = response.getWriter(); //获取写入对象
				out.print(ret); //将json数据写入流中
				
			} catch (Exception e) {
				log.error(e.getMessage(), e);
				e.printStackTrace();
				ajaxJson.setCode("000001");
				ajaxJson.setMsg("操作失败");
				out.print(JSON.toJSONString(ajaxJson));
//				return JSON.toJSONString(ajaxJson);
				
			} finally {
				out.flush();
				out.close();
			}
		}
	
	/**
	 * 城市服务跳转页
	 * @return
	 */
	@RequestMapping(value = "/weixin/WX_csfw.do", method = RequestMethod.GET)
	public void WX_csfw(HttpServletResponse response,String csfw) throws IOException {

		AjaxJson ajaxJson=new AjaxJson();
		String ret = "";
		response.setCharacterEncoding("UTF-8"); //设置编码格式
		response.setContentType("text/html");   //设置数据格式
		PrintWriter out = response.getWriter();
		Gongzhong gongzhong = gongzhongZhanghaoService.selectGongzhongZhanghaoById("1");
		String appid = gongzhong.getAccountAppid();
		//Strid="20160424200845363";
		try {

			BaseJson baseJson = new BaseJson();
			baseJson.setCode("000000");
			baseJson.setMsg("成功");
			String str="";
			if(csfw.equals("cx")){
				str = "https://open.weixin.qq.com/connect/oauth2/authorize?appid="+appid+"&redirect_uri="+Constants.CSFW_CX_URL+"&response_type=code&scope=snsapi_base&state=1#wechat_redirect";
			}else{
				str = "https://open.weixin.qq.com/connect/oauth2/authorize?appid="+appid+"&redirect_uri="+Constants.CSFW_URL+"&response_type=code&scope=snsapi_base&state=1#wechat_redirect";
			}
			baseJson.setData(str);
			ret = JSON.toJSONString(baseJson);
			out = response.getWriter(); //获取写入对象
			out.print(ret); //将json数据写入流中
			
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			e.printStackTrace();
			ajaxJson.setCode("000001");
			ajaxJson.setMsg("操作失败");
			out.print(JSON.toJSONString(ajaxJson));
//				return JSON.toJSONString(ajaxJson);
			
		} finally {
			out.flush();
			out.close();
		}
	}
	
	//根据code 获取openid
	@RequestMapping(value = "/weixin/Get_Openid.do", method = RequestMethod.GET)
	public void Get_Openid(HttpServletResponse response,String code) throws IOException {
		AjaxJson ajaxJson=new AjaxJson();
		String ret = "";
		response.setCharacterEncoding("UTF-8"); //设置编码格式
		response.setContentType("text/html");   //设置数据格式
		PrintWriter out = response.getWriter();
			try {
				Gongzhong gongzhong = gongzhongZhanghaoService.selectGongzhongZhanghaoById("1");
				String appid = gongzhong.getAccountAppid();
				String appsecret = gongzhong.getAccountAppsecret();
				WeiXinUtil util = new WeiXinUtil();
				String openid = util.getOpenid(appid, appsecret, code);
				BaseJson baseJson = new BaseJson();
					if(!"".equals(openid)){
						baseJson.setCode("000000");
						baseJson.setMsg("成功");
						baseJson.setData(openid);
					}

				JSONObject json = JSONObject.fromObject(baseJson);
				ret = JSON.toJSONString(json);
				out = response.getWriter(); //获取写入对象
				out.print(ret); //将json数据写入流中
				
			} catch (Exception e) {
				log.error(e.getMessage(), e);
				e.printStackTrace();
				ajaxJson.setCode("000001");
				ajaxJson.setMsg("操作失败");
				out.print(JSON.toJSONString(ajaxJson));
//				return JSON.toJSONString(ajaxJson);
				
			} finally {
				out.flush();
				out.close();
			}
		}
	@RequestMapping(value = "/weixin/WX_findTimeJgdwById.do", method = RequestMethod.GET)
	public void WX_findTimeJgdwById(HttpServletResponse response,String riqi,String jgid) throws IOException {

		AjaxJson ajaxJson=new AjaxJson();
		SimpleDateFormat dateFormater = new SimpleDateFormat("yyyy-MM-dd");
		Date date=new Date();
		String ret = "";
		response.setCharacterEncoding("UTF-8"); //设置编码格式
		response.setContentType("text/html");   //设置数据格式
		PrintWriter out = response.getWriter();
		try {
			List list = crjRyjbxxServiceI.WX_findJgdwById(riqi, jgid);
			BaseJson baseJson = new BaseJson();
			if (list.size()>0){
				baseJson.setCode("000000");
				baseJson.setMsg("成功");
				baseJson.setData(list);
			}else{
				baseJson.setCode("000002");
				baseJson.setMsg("您选择的日期，是该办理大厅非工作日。请先选择其他日期！");
				baseJson.setData("");
			}

			JSONObject json = JSONObject.fromObject(baseJson);
			ret = JSON.toJSONString(json);
			out = response.getWriter(); //获取写入对象
			out.print(ret); //将json数据写入流中
			
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			e.printStackTrace();
			ajaxJson.setCode("000001");
			ajaxJson.setMsg("操作失败");
			out.print(JSON.toJSONString(ajaxJson));
//			return JSON.toJSONString(ajaxJson);
			
		} finally {
			out.flush();
			out.close();
		}
	}
	/**
	 * 根据微信查询预约详细信息
	 * @param idcard
	 * @param phonenum
	 * @return
	 */

	@RequestMapping(value = "/weixin/WX_Yuyuexangxi.do", method = RequestMethod.GET)
	public void WX_Yuyuexangxi(HttpServletResponse response,String Strid) throws IOException {

			AjaxJson ajaxJson=new AjaxJson();
			String ret = "";
			response.setCharacterEncoding("UTF-8"); //设置编码格式
			response.setContentType("text/html");   //设置数据格式
			PrintWriter out = response.getWriter();
			Map map = new HashMap();
			//Strid="20160424200845363";
			try {
				List list1 = crjRyjbxxServiceI.listWx_yuyueId(Strid);
				List list = crjRyjbxxServiceI.listWx_yuyuexiangxi(Strid);

				BaseJson baseJson = new BaseJson();
				baseJson.setCode("000000");
				baseJson.setMsg("成功");
				map.put("list", list);
				map.put("jblist",list1);
				
				baseJson.setData(map);
				
//				JsonConfig jsonConfig = new JsonConfig();
//				jsonConfig.registerJsonValueProcessor(Date.class,
//						new JsonDateValueProcessor());
//				JSONObject json = JSONObject.fromObject(baseJson, jsonConfig);

				ret = JSON.toJSONString(baseJson);
				
				out = response.getWriter(); //获取写入对象
				out.print(ret); //将json数据写入流中
				
			} catch (Exception e) {
				log.error(e.getMessage(), e);
				e.printStackTrace();
				ajaxJson.setCode("000001");
				ajaxJson.setMsg("操作失败");
				out.print(JSON.toJSONString(ajaxJson));
//				return JSON.toJSONString(ajaxJson);
				
			} finally {
				out.flush();
				out.close();
			}
		}
	/**
	 * 初始化受理所在地赋值(根据1.:p2:上次预约地点3:户籍所在地4:默认长春)
	 * 
	 * @return
	 * @throws 
	 */
	@RequestMapping(value = "/yuyue/initYuyueSls.do", method = RequestMethod.GET)
	public void initYuyueSls(HttpServletResponse response) throws IOException {
		AjaxJson ajaxJson=new AjaxJson();
		String ret = "";
		response.setCharacterEncoding("UTF-8"); //设置编码格式
		response.setContentType("text/html");   //设置数据格式
		PrintWriter out = response.getWriter();
		// 获取客户端id
		String ip = "122.139.143.120";
		// TODO String ip = getIpAddr(request);
		List<String> addressList = new ArrayList<String>();
		// 初始化受理所在地赋值(1:ip 2:上次预约地点 3:户籍所在地 4:默认长春)
		String address = "";
		AddressUtils addressUtils = new AddressUtils();
		try {
			addressList = addressUtils.getAddress("ip=" + ip, "utf-8");
			if (addressList != null && addressList.size() > 0) {
				if (addressList.size() > 1) {
					if ("吉林省".equals(addressList.get(0))) {
						address = addressList.get(1);
					} else {
						address = addressList.get(1);
					}
				} else {
					address = Constants.HQSJSB;
				}
			} else {
				address = Constants.HQSJSB;
			}
			if ((Constants.HQSJSB).equals(address)) {
				// TODO 根据用户信息查询上次预约地点
			}
			if ((Constants.HQSJSB).equals(address) || "".equals(address)) {
				// 默认长春
				address = "长春市";
			}
			BaseJson baseJson = new BaseJson();
			baseJson.setCode("000000");
			baseJson.setMsg("成功");
			baseJson.setData(address);

			//JavaBean转JSON  
			JSONObject json = JSONObject.fromObject(baseJson);
			ret = JSON.toJSONString(json);
			
			out = response.getWriter(); //获取写入对象
			out.print(ret); //将json数据写入流中
			
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			e.printStackTrace();
			ajaxJson.setCode("000001");
			ajaxJson.setMsg("操作失败");
			out.print(JSON.toJSONString(ajaxJson));
//			return JSON.toJSONString(ajaxJson);
			
		} finally {
			out.flush();
			out.close();
		}
	}

	/**
	 * 初始化预约日期
	 * 
	 * @return
	 * @throws 
	 */
	@RequestMapping(value = "/yuyue/initYuyueRiqi.do", method = RequestMethod.GET)
	public void initYuyueRiqi(HttpServletResponse response, String pid) throws IOException {
		AjaxJson ajaxJson=new AjaxJson();
		String ret = "";
		response.setCharacterEncoding("UTF-8"); //设置编码格式
		response.setContentType("text/html");   //设置数据格式
		PrintWriter out = response.getWriter();
		try {
			// 查询可以预约时间
			StringBuilder sql = new StringBuilder();
			String dataTime = DataUtils.systemDate();
//			List<SysWorkdaySample> list = (List<SysWorkdaySample>) crjRyjbxxServiceI.findYuYueByRiqi(dataTime,Constants.YUYUENUM);
//			List<YuYueRiqiBean> voList = findYuYueByRiqiChange(list);
			List<YuYueRiqiBean> voList = new ArrayList<YuYueRiqiBean>();
			YuYueRiqiBean bean = new YuYueRiqiBean();
			bean.setRiqi(dataTime);
			voList.add(bean);
			//return voList;
			//List<YuYueRiqiBean> list = crjRyjbxxServiceI.findYuYueByRiqi();
			BaseJson baseJson = new BaseJson();
			baseJson.setCode("000000");
			baseJson.setMsg("成功");
			baseJson.setData(voList);

			//JavaBean转JSON  
			JSONObject json = JSONObject.fromObject(baseJson);
			ret = JSON.toJSONString(json);
			
			out = response.getWriter(); //获取写入对象
			out.print(ret); //将json数据写入流中
			
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			e.printStackTrace();
			ajaxJson.setCode("000001");
			ajaxJson.setMsg("操作失败");
			out.print(JSON.toJSONString(ajaxJson));
//			return JSON.toJSONString(ajaxJson);
			
		} finally {
			out.flush();
			out.close();
		}
	}
	/**
	 * 查询可以预约信息
	 * 
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping(value = "/yuYue/findYuYueByRJ.do", method = RequestMethod.GET)
	public void findYuYueByRJ(HttpServletResponse response, String riqi, String sls, String slx,String count, String shijian) throws IOException {
		
		AjaxJson ajaxJson=new AjaxJson();
		String ret = "";
		response.setCharacterEncoding("UTF-8"); //设置编码格式
		response.setContentType("text/html");   //设置数据格式
		PrintWriter out = response.getWriter();
		try {
			Map<String,Object> param = new HashMap<String,Object>();
			
			/**
			 * 获取用户在该应用下的皮肤
			 */
			String str=sls.substring(0,4);
			//if (str.equals("2202")||str.equals("2201")||str.equals("2203")){
				if ((slx == null || "".equals(slx))) {
					// 根据受理地所在市查询受理地所在县(区)：
					List<SysDictionary> list = (List<SysDictionary>) crjRyjbxxServiceI.listSysDictionaryByType(sls,"1",count);
					for (int i = 0; i < list.size(); i++) {
						if (i == 0) {
							slx += "'" + list.get(i).getId() + "'";
						} else {
							slx += "," + "'" + list.get(i).getId() + "'";
						}
					}
				}
				BaseJson baseJson = new BaseJson();
				
					// 时间
					// TODO String shijian = StringUtils.objectToString(map.get("shijian"));
					// 日期
					param.put("riqi", riqi);
					// 受理地所在市：
				if (count.equals("0")) {
					param.put("slx", slx);
				}else if(slx.contains("22016700")){
					param.put("slx", "22016700"); //长春市本级
				}else if(slx.contains("22028500")){
					param.put("slx", "22028500"); //吉林市本级
				}else if(slx.contains("22038300")){
					param.put("slx", "22038300"); //四平市本级
				}else if(slx.contains("22047300")){
					param.put("slx", "22047300"); //辽源市本级
				}else if(slx.contains("22058300")){
					param.put("slx", "22058300"); //通化市本级
				}else if(slx.contains("22069600")){
					param.put("slx", "22069600"); //白山市本级
				}else if(slx.contains("22088300")){
					param.put("slx", "22088300"); //白城市本级
				}else if(slx.contains("22243900")){
					param.put("slx", "22243900"); //延边州本级
				}else if(slx.contains("22038100")){
					param.put("slx", "22038100"); //公主岭市本级
				}else if(slx.contains("22058100")){
					param.put("slx", "22058100"); //梅河口市本级
				}else if(slx.contains("22302100")){
					param.put("slx", "22302100"); //珲春市本级
				}else if(slx.contains("22072500")){
					param.put("slx", "22072500"); //松原市本级
				}else{
					param.put("slx", "00000000");
				}
					List<SysOrganization> list =crjRyjbxxServiceI.findtimYuYueByRJ(param);
					List<YuYueBean> voList = findYuYueByRJChange(list);
					
					baseJson.setCode("000000");
					baseJson.setMsg("成功");
					baseJson.setData(voList);
				
				
				//return voList;
				//List<YuYueBean> list = yyxxService.findYuYueByRJ(param);
				
				JsonConfig jsonConfig = new JsonConfig();  
				jsonConfig.registerJsonValueProcessor(Date.class, new JsonDateValueProcessor());
				JSONObject aa = JSONObject.fromObject(baseJson, jsonConfig);
				ret = JSON.toJSONString(aa);
				
				out = response.getWriter(); //获取写入对象
				out.print(ret); //将json数据写入流中
				
//			}else{
//				BaseJson baseJson = new BaseJson();
//				baseJson.setCode("000000");
//				baseJson.setMsg("无数据");
//				baseJson.setData("");
//				JsonConfig jsonConfig = new JsonConfig();  
//				jsonConfig.registerJsonValueProcessor(Date.class, new JsonDateValueProcessor());
//				JSONObject aa = JSONObject.fromObject(baseJson, jsonConfig);
//				ret = JSON.toJSONString(aa);
//				
//				out = response.getWriter(); //获取写入对象
//				out.print(ret); //将json数据写入流中
//			}
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			e.printStackTrace();
			ajaxJson.setCode("000001");
			ajaxJson.setMsg("操作失败");
			out.print(JSON.toJSONString(ajaxJson));
//			return JSON.toJSONString(ajaxJson);
			
		} finally {
			out.flush();
			out.close();
		}
	}
	/**
	 * 添加预约基本信息(预约状态设置为预约中)
	 * @param worktimeId 预约时间id
	 * @param jgdwName 预约机关单位名称
	 * @param sqId 申请id
	 * @throws IOException
	 */
	@RequestMapping(value = "/yuYue/addYuYueByWorktime.do", method = RequestMethod.POST)
	public void addYuYueByWorktime(HttpServletResponse response, HttpServletRequest request,
			String worktimeId, String sqId, String jgdwName, String openid, String els,String dhhm,String jgdwywdwdz,String type) throws IOException {
		
		AjaxJson ajaxJson=new AjaxJson();
		String ret = "";
		response.setCharacterEncoding("UTF-8"); //设置编码格式
		response.setContentType("text/html");   //设置数据格式
		PrintWriter out = response.getWriter();
		els=els.substring(0,els.length()-1);
		String[] arr = els.trim().split(",");
		
		//身份号码加密*
		String regex = "(\\w{3})(\\w+)(\\w{3})";
		String jmsfzh="";
		String  xx = "";
		for(int n=0;n<arr.length;n++){
			
			for(int m=0;m<arr[n].length()-6;m++){
				xx+="*";
			}
			jmsfzh +=arr[n].replaceAll(regex, "$1"+xx+"$3");
			jmsfzh +=",";
			 xx = "";
			
		}
		jmsfzh =jmsfzh.substring(0,jmsfzh.length()-1);
		
		// 返回集bean
		BaseJson baseJson = new BaseJson();
		CrjYyxx crjYyxx = new CrjYyxx();
		String Sysday="";
		String ywbh="";
		String yysjfw=""; //预约时间范围
		String shijian="";
		String Strid=Params.getCode();
		try {
			for (int i = 0; i < arr.length; i++) {
				// 根据ID查询工作日时间配置信息
				SysWorktime sysWorktime = crjRyjbxxServiceI.selectSysWorktimeById(worktimeId);
				// 根据用户名获取用户信息
				String sfzh = arr[i];
				
				// String sfzh = "220122198807051111";
				//CrjRyjbxx crjRyjbxx = crjRyjbxxService.findBySfzjhm(sfzh);
				if (sysWorktime != null) {
					if (StringUtils.stringToInteger(sysWorktime.getSysl()) > 0) {
						
						crjYyxx.setYyId(Params.getCode());
						crjYyxx.setYysjId(worktimeId);
						crjYyxx.setJgdwId(sysWorktime.getJgwdId());
						crjYyxx.setSqId(sqId);
						crjYyxx.setYyzt("1");
						crjYyxx.setSfzh(sfzh);
						//if (crjRyjbxx != null) {
						crjYyxx.setSjhm(dhhm);
						crjYyxx.setOpenid(Strid);
							//crjYyxx.setName(crjRyjbxx.getZwx() + crjRyjbxx.getZwm());
						String yuyueCode = crjRyjbxxServiceI.getYuyueCode(sysWorktime.getRiqi().replaceAll("-", ""));
						if("".equals(ywbh)){
							ywbh=yuyueCode;
							yysjfw=sysWorktime.getRiqi()+" "+sysWorktime.getStartTime()+"-"+sysWorktime.getEndTime();
						}else{
							ywbh=ywbh+","+yuyueCode;
						}
						
						crjYyxx.setYycode(yuyueCode);
						//}
						shijian=sysWorktime.getRiqi()+"  "+sysWorktime.getStartTime()+"-"+sysWorktime.getEndTime();
						crjYyxx.setYysjQs(sysWorktime.getStartTime());
						crjYyxx.setYysjZz(sysWorktime.getEndTime());
						crjYyxx.setYyrq(sysWorktime.getRiqi());
						crjYyxx.setYyszd(jgdwName);
						crjYyxx.setCreateTime(new Date());
						crjYyxx.setUpdateTime(new Date());
						crjYyxx.setBeiyong1(type);
						crjRyjbxxServiceI.addYuyue(crjYyxx);
						// 修改工作日时间配置中预约数量信息
						crjYyxx.setYyId(Params.getCode());
						
						sysWorktime.setYysl((StringUtils.stringToInteger(sysWorktime.getYysl()) + 1) + "");
						sysWorktime.setSysl((StringUtils.stringToInteger(sysWorktime.getSysl()) - 1) + "");
						crjRyjbxxServiceI.updateByPrimaryKeySelective(sysWorktime);
						
						baseJson.setCode("000000");
						baseJson.setMsg(Strid);
						baseJson.setData(crjYyxx.getYyId());
						JsonConfig jsonConfig = new JsonConfig();  
						jsonConfig.registerJsonValueProcessor(Date.class, new JsonDateValueProcessor());
						JSONObject aa = JSONObject.fromObject(baseJson, jsonConfig);
						ret = JSON.toJSONString(aa);
					} else {
						baseJson.setCode("000002");
						baseJson.setMsg("此时间段预约已满！");
						ret = JSON.toJSONString(baseJson);
					}
				}
			}
			//String sqId, String jgdwName, String openid, String els
			
			SimpleDateFormat dateFormater = new SimpleDateFormat("yyyy-MM-dd");
			Date date=new Date();
			Wx_Pc pc = new Wx_Pc();
			pc.setOpenid(openid);
			pc.setYywd(jgdwName);
			pc.setYywddz(jgdwywdwdz);
			pc.setYybhs(Strid);
			pc.setDhhm(yysjfw);
			pc.setYysj(dateFormater.format(date));
			crjRyjbxxServiceI.insertSelective(pc);
			Gongzhong gongzhong = gongzhongZhanghaoService.selectGongzhongZhanghaoById("1");
			String appid = gongzhong.getAccountAppid();
			String appsecret = gongzhong.getAccountAppsecret();
			WeiXinUtil util = new WeiXinUtil();
//			String token = util.getAccess_token("wxf1fd8f1419f114b6", "f07db3f88b45786377687dc19eca3fd1");
			//模板ID    hOxfDtm9nqdxjwpbe2-TKuBOdDNzoeRyrFzzV5ISXAA
			if (type != null && "2".equals(type)) {
				String token = util.getAccess_token(appid,appsecret);
				String params = "{\"touser\":\""+openid+"\",\"template_id\":\"OOr6BH1RmS3vnZkwNOhOT2Qsm61d6skgNE4rrOqTHCA\",\"url\":\"\",\"topcolor\":\"#FF0000\",\"data\":{"
						+ "\"first\": {\"value\":\"您已预约成功！\",\"color\":\"#173177\"},\"keyword1\":{ \"value\":\""+ywbh+"\", \"color\":\"#173177\" },\"keyword2\": {\"value\":\""+shijian+"\", \"color\""
						+ ":\"#173177\" },\"keyword3\": {\"value\":\""+jgdwName+"\",\"color\":\"#173177\"},\"keyword4\": {\"value\":\""+jgdwywdwdz+"\",\"color\":\"#173177\"},\"remark\":{\"value\":\"请携带"+"申请人的身份证("+jmsfzh+")前去办理！\",\"color\":\"#173177\"}}}";
				
				boolean flag = util.createMobanMessage(params, token);
				//out = response.getWriter(); //获取写入对象
				//out.print(ret); //将json数据写入流中
				
				
				String params_csfw = "{\"touser\":\""+openid+"\",\"template_id\":\"OOr6BH1RmS3vnZkwNOhOT2Qsm61d6skgNE4rrOqTHCA\",\"url\":\"\",\"topcolor\":\"#FF0000\",\"data\":{"
						+ "\"first\": {\"value\":\"您已预约成功！\",\"color\":\"#173177\"},\"keyword1\":{\"value\":\""+ywbh+"\", \"color\":\"#173177\" },\"keyword2\": {\"value\":\""+shijian+"\", \"color\""
						+ ":\"#173177\" },\"keyword3\": {\"value\":\""+jgdwName+"\",\"color\":\"#173177\"},\"keyword4\": {\"value\":\""+jgdwywdwdz+"\",\"color\":\"#173177\"},\"remark\":{\"value\":\"请携带"+"申请人的身份证("+jmsfzh+")前去办理！\",\"color\":\"#173177\"}}}";
				String csfw = URLEncoder.encode(params_csfw,"UTF-8");
				csfw = "https://city.weixin.qq.com/cgi-bin/entry?result_data="+csfw+"#wechat_redirect";
				baseJson.setData(csfw);
				JsonConfig jsonConfig = new JsonConfig();  
				jsonConfig.registerJsonValueProcessor(Date.class, new JsonDateValueProcessor());
				JSONObject aa = JSONObject.fromObject(baseJson, jsonConfig);
				ret = JSON.toJSONString(aa);
				
				
				
				out = response.getWriter(); //获取写入对象
				out.print(ret);
				//util.yuYueCityServer(URLEncoder.encode(params,"UTF-8").toLowerCase());
			} else if( "3".equals(type)){
				
				String params_ga = "{\"first\": \"您已预约成功！\",\"keyword1\":\""+ywbh+"\",\"keyword2\":\""+shijian+"\",\"keyword3\": \""+jgdwName+"\",\"keyword4\":\""+jgdwywdwdz+"\",\"remark\":\"请携带"+"申请人的身份证("+jmsfzh+")前去办理！\"}";
				WxqzController wxqzController =new WxqzController();
				wxqzController.sendMbxx(openid,"1",params_ga, request, response);
				out = response.getWriter(); //获取写入对象
				out.print(ret); //将json数据写入流中
				
			}else {
				String token = util.getAccess_token(appid,appsecret);
				String params = "{\"touser\":\""+openid+"\",\"template_id\":\"OOr6BH1RmS3vnZkwNOhOT2Qsm61d6skgNE4rrOqTHCA\",\"url\":\"\",\"topcolor\":\"#FF0000\",\"data\":{"
						+ "\"first\": {\"value\":\"您已预约成功！\",\"color\":\"#173177\"},\"keyword1\":{ \"value\":\""+ywbh+"\", \"color\":\"#173177\" },\"keyword2\": {\"value\":\""+shijian+"\", \"color\""
						+ ":\"#173177\" },\"keyword3\": {\"value\":\""+jgdwName+"\",\"color\":\"#173177\"},\"keyword4\": {\"value\":\""+jgdwywdwdz+"\",\"color\":\"#173177\"},\"remark\":{\"value\":\"请携带"+"申请人的身份证("+jmsfzh+")前去办理！\",\"color\":\"#173177\"}}}";
				
				boolean flag = util.createMobanMessage(params, token);
				out = response.getWriter(); //获取写入对象
				out.print(ret); //将json数据写入流中
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
	 * 添加预约基本信息(预约状态设置为预约中)
	 * @param worktimeId 预约时间id
	 * @param jgdwName 预约机关单位名称
	 * @param sqId 申请
	 * @throws IOException
	 */
	@RequestMapping(value = "/yuYue/updYuYueByWorktime.do", method = RequestMethod.GET)
	public void updYuYueByWorktime(HttpServletResponse response, HttpServletRequest request,
			String yyId, String yysjId, String shijian, String ywbh, String jgdwName, String jgdwywdwdz, String openid) throws IOException {
		
		AjaxJson ajaxJson=new AjaxJson();
		String ret = "";
		response.setCharacterEncoding("UTF-8"); //设置编码格式
		response.setContentType("text/html");   //设置数据格式
		PrintWriter out = response.getWriter();
		// 返回集bean
		BaseJson baseJson = new BaseJson();
		CrjYyxx crjYyxx = new CrjYyxx();
		try {
				// 根据ID查询工作日时间配置信息
				SysWorktime sysWorktime = crjRyjbxxServiceI.selectSysWorktimeById(yysjId);
				// 根据用户名获取用户信息
				
				// String sfzh = "220122198807051111";
				//CrjRyjbxx crjRyjbxx = crjRyjbxxService.findBySfzjhm(sfzh);
				if (sysWorktime != null) {
					if (StringUtils.stringToInteger(sysWorktime.getSysl()) > 0) {
						
						crjYyxx.setYyId(yyId);
						crjYyxx.setJgdwId(sysWorktime.getJgwdId());
						crjYyxx.setYyzt("2");
							//crjYyxx.setName(crjRyjbxx.getZwx() + crjRyjbxx.getZwm());
							
						//}
						crjYyxx.setUpdateTime(new Date());
						//crjRyjbxxServiceI.addYuyue(crjYyxx);
						crjRyjbxxServiceI.updateByPrimaryKeySelective(crjYyxx);
						// 修改工作日时间配置中预约数量信息
						crjYyxx.setYyId(Params.getCode());
						sysWorktime.setYysl((StringUtils.stringToInteger(sysWorktime.getYysl()) - 1) + "");
						sysWorktime.setSysl((StringUtils.stringToInteger(sysWorktime.getSysl()) + 1) + "");
						crjRyjbxxServiceI.updateByPrimaryKeySelective(sysWorktime);
						
						baseJson.setCode("000000");
						baseJson.setMsg("撤销预约成功！");
						baseJson.setData(crjYyxx.getYyId());
						Gongzhong gongzhong = gongzhongZhanghaoService.selectGongzhongZhanghaoById("1");
						String appid = gongzhong.getAccountAppid();
						String appsecret = gongzhong.getAccountAppsecret();
						WeiXinUtil util = new WeiXinUtil();
						String token = util.getAccess_token(appid,appsecret);
//						String token = util.getAccess_token("wxf1fd8f1419f114b6", "f07db3f88b45786377687dc19eca3fd1");
						//模板ID    hOxfDtm9nqdxjwpbe2-TKuBOdDNzoeRyrFzzV5ISXAA
						String params = "{\"touser\":\""+openid+"\",\"template_id\":\"rPRKk3e9m1tQe36Ci3qelbPPlUJ9BePH3zDNlJXEF9M\",\"url\":\"\",\"topcolor\":\"#FF0000\",\"data\":{"
								+ "\"businessType\": {\"value\":\"业务类型\"},\"business\": {\"value\":\"出入境预约\",\"color\":\"#173177\"},\"first\": {\"value\":\"您的预约已撤销\",\"color\":\"#173177\"},\"order\":{ \"value\":\""+ywbh+"\", \"color\":\"#173177\" },\"time\": {\"value\":\""+shijian+"\", \"color\""
								+ ":\"#173177\" },\"address\": {\"value\":\""+jgdwName+"\",\"color\":\"#173177\"},\"remark\":{\"value\":\"感谢您的使用。\",\"color\":\"#173177\"}}}";
						boolean flag = util.createMobanMessage(params, token);
						JsonConfig jsonConfig = new JsonConfig();  
						jsonConfig.registerJsonValueProcessor(Date.class, new JsonDateValueProcessor());
						JSONObject aa = JSONObject.fromObject(baseJson, jsonConfig);
						ret = JSON.toJSONString(aa);
					} else {
						baseJson.setCode("000002");
						baseJson.setMsg("此时间段预约已满！");
						ret = JSON.toJSONString(baseJson);
					}
				}
			
			out = response.getWriter(); //获取写入对象
			out.print(ret); //将json数据写入流中
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
	 * 取消预约
	 * @param worktimeId 预约时间id
	 * @param jgdwName 预约机关单位名称
	 * @param yybh  预约编号
	 * @throws IOException
	 */
	@RequestMapping(value = "/yuYue/updYuYueGG.do", method = RequestMethod.GET)
	public void updYuYueGG(HttpServletResponse response, HttpServletRequest request,
			String yybh) throws IOException {
		
		AjaxJson ajaxJson=new AjaxJson();
		String ret = "";
		response.setCharacterEncoding("UTF-8"); //设置编码格式
		response.setContentType("text/html");   //设置数据格式
		PrintWriter out = response.getWriter();
		// 返回集bean
		BaseJson baseJson = new BaseJson();
		CrjYyxx crjYyxx = new CrjYyxx();
		try {
			List list = crjRyjbxxServiceI.listWx_yuyuexiangxi_yycode(yybh);
			if (list.size() >0) {
				crjYyxx=(CrjYyxx)list.get(0);
			}
				// 根据ID查询工作日时间配置信息
				SysWorktime sysWorktime = crjRyjbxxServiceI.selectSysWorktimeById(crjYyxx.getYysjId());
				// 根据用户名获取用户信息
				
				// String sfzh = "220122198807051111";
				//CrjRyjbxx crjRyjbxx = crjRyjbxxService.findBySfzjhm(sfzh);
				if (sysWorktime != null) {
					if (StringUtils.stringToInteger(sysWorktime.getSysl()) > 0) {
						
						
						crjYyxx.setJgdwId(sysWorktime.getJgwdId());
						crjYyxx.setYyzt("2");
							//crjYyxx.setName(crjRyjbxx.getZwx() + crjRyjbxx.getZwm());
							
						//}
						crjYyxx.setUpdateTime(new Date());
						//crjRyjbxxServiceI.addYuyue(crjYyxx);
						crjRyjbxxServiceI.updateByPrimaryKeySelective(crjYyxx);
						// 修改工作日时间配置中预约数量信息
						crjYyxx.setYyId(Params.getCode());
						sysWorktime.setYysl((StringUtils.stringToInteger(sysWorktime.getYysl()) - 1) + "");
						sysWorktime.setSysl((StringUtils.stringToInteger(sysWorktime.getSysl()) + 1) + "");
						crjRyjbxxServiceI.updateByPrimaryKeySelective(sysWorktime);
						
						baseJson.setCode("000000");
						baseJson.setMsg("撤销预约成功！");
						baseJson.setData(crjYyxx.getYyId());
						JsonConfig jsonConfig = new JsonConfig();  
						jsonConfig.registerJsonValueProcessor(Date.class, new JsonDateValueProcessor());
						JSONObject aa = JSONObject.fromObject(baseJson, jsonConfig);
						ret = JSON.toJSONString(aa);
					} else {
						baseJson.setCode("000002");
						baseJson.setMsg("此时间段预约已满！");
						ret = JSON.toJSONString(baseJson);
					}
				}
			
			out = response.getWriter(); //获取写入对象
			out.print(ret); //将json数据写入流中
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
	 * 查询受理所在地
	 * 
	 * @return
	 * @throws 
	 */
	@RequestMapping(value = "/webProtal/findDictionaryByType.do", method = RequestMethod.GET)
	public void findDictionaryByType(HttpServletRequest request,HttpServletResponse response, String pid) throws IOException {
		AjaxJson ajaxJson=new AjaxJson();
		String ret = "";
		response.setCharacterEncoding("UTF-8"); //设置编码格式
		response.setContentType("text/html");   //设置数据格式
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		session.setAttribute("shiPid",pid);
		try {
			// 查询受理所在地
			List<SysDictionary> list = (List<SysDictionary>) crjRyjbxxServiceI.listSysDictionaryByType( pid,"1","0");
			BaseJson baseJson = new BaseJson();
			baseJson.setCode("000000");
			baseJson.setMsg("成功");
			baseJson.setData(list);
//			JsonConfig jsonConfig = new JsonConfig();  
//			jsonConfig.registerJsonValueProcessor(Date.class, new JsonDateValueProcessor());

			//JavaBean转JSON  
			JSONObject json = JSONObject.fromObject(baseJson);
			ret = JSON.toJSONString(json);
			
			out = response.getWriter(); //获取写入对象
			out.print(ret); //将json数据写入流中
			
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			e.printStackTrace();
			ajaxJson.setCode("000001");
			ajaxJson.setMsg("操作失败");
			out.print(JSON.toJSONString(ajaxJson));
//			return JSON.toJSONString(ajaxJson);
			
		} finally {
			out.flush();
			out.close();
		}
	}
	/**
	 * 根据数据字典项进行查询
	 * 
	 * @return
	 * @throws 
	 */
	@RequestMapping(value = "/webProtal/findDictionaryByType1.do", method = RequestMethod.GET)
	public void findDictionaryByType1(HttpServletRequest request,HttpServletResponse response, String type) throws IOException {
		AjaxJson ajaxJson=new AjaxJson();
		String ret = "";
		response.setCharacterEncoding("UTF-8"); //设置编码格式
		response.setContentType("text/html");   //设置数据格式
		PrintWriter out = response.getWriter();
		try {
			// 查询受理所在地
			List<SysDictionary> list = (List<SysDictionary>) crjRyjbxxServiceI.listSysDictionaryByType(null,type,"0");
			BaseJson baseJson = new BaseJson();
			baseJson.setCode("000000");
			baseJson.setMsg("成功");
			baseJson.setData(list);
//			JsonConfig jsonConfig = new JsonConfig();  
//			jsonConfig.registerJsonValueProcessor(Date.class, new JsonDateValueProcessor());

			//JavaBean转JSON  
			JSONObject json = JSONObject.fromObject(baseJson);
			ret = JSON.toJSONString(json);
			
			out = response.getWriter(); //获取写入对象
			out.print(ret); //将json数据写入流中
			
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			e.printStackTrace();
			ajaxJson.setCode("000001");
			ajaxJson.setMsg("操作失败");
			out.print(JSON.toJSONString(ajaxJson));
//			return JSON.toJSONString(ajaxJson);
			
		} finally {
			out.flush();
			out.close();
		}
	}
	// 将list转换
	private List<YuYueRiqiBean> findYuYueByRiqiChange(List<?> list) {
		List<YuYueRiqiBean> hdcsList = new ArrayList<YuYueRiqiBean>();
		for (int i = 0; i < list.size(); i++) {
			SysWorkdaySample obj = (SysWorkdaySample) list.get(i);
			YuYueRiqiBean bean = new YuYueRiqiBean();
			bean.setId(obj.getId());
			bean.setRiqi(obj.getYear());
			bean.setWeek(obj.getWeek());
			hdcsList.add(bean);
		}
		return hdcsList;
	}
	// 将list转换
	private List<YuYueBean> findYuYueByRJChange(List<SysOrganization> list) {
		List<YuYueBean> hdcsList = new ArrayList<YuYueBean>();
		List<SysWorktime> listSysWorktime = new ArrayList<SysWorktime>();
		
		String jgdwId = "";
		String jgdwName = "";
		String latitude = "";
		String longitude = "";
		for (int i = 0; i < list.size(); i++) {
			SysOrganization obj = list.get(i);
			YuYueBean bean = new YuYueBean();
			SysWorktime sysWorktime = new SysWorktime();
			
			// select so.id as jgdwId, so.jgdw_name as jgdwName, so.jgdw_latitude as latitude, so.jgdw_longitude as longitude,  
			 //  wt.id as wtid, wt.start_time as startTime, wt.end_time as endTime, wt.yyzl, wt.yysl, wt.sysl, wt.riqi, wt.week  
			if (i == 0) {
				jgdwId = obj.getJgdwId();
				jgdwName = obj.getJgdwName();
				latitude = obj.getLatitude();
				longitude = obj.getLongitude();
			}
			if (obj.getJgdwId().equals(jgdwId)) {
				sysWorktime.setId(obj.getWtid());
				sysWorktime.setStartTime(obj.getStartTime());
				sysWorktime.setEndTime(obj.getEndTime());
				sysWorktime.setYyzl(obj.getYyzl());
				sysWorktime.setYysl(obj.getYysl());
				sysWorktime.setSysl(obj.getSysl());
				sysWorktime.setRiqi(obj.getRiqi());
				sysWorktime.setWeek(obj.getWeek());
				listSysWorktime.add(sysWorktime);
				if (i == list.size() - 1) {
					bean.setJgdwId(obj.getJgdwId());
					bean.setJgdwName(obj.getJgdwName());
					bean.setLatitude(obj.getLatitude());
					bean.setLongitude(obj.getLongitude());
					bean.setListSysWorktime(listSysWorktime);
					hdcsList.add(bean);
				}
			} else {
				if (i == list.size() - 1) {
					bean.setJgdwId(obj.getJgdwId());
					bean.setJgdwName(obj.getJgdwName());
					bean.setLatitude(obj.getLatitude());
					bean.setLongitude(obj.getLongitude());
					sysWorktime.setId(obj.getWtid());
					sysWorktime.setStartTime(obj.getStartTime());
					sysWorktime.setEndTime(obj.getEndTime());
					sysWorktime.setYyzl(obj.getYyzl());
					sysWorktime.setYysl(obj.getYysl());
					sysWorktime.setSysl(obj.getSysl());
					sysWorktime.setRiqi(obj.getRiqi());
					sysWorktime.setWeek(obj.getWeek());
					listSysWorktime.add(sysWorktime);
					bean.setListSysWorktime(listSysWorktime);
					hdcsList.add(bean);
				} else {
					bean.setJgdwId(jgdwId);
					bean.setJgdwName(jgdwName);
					bean.setLatitude(latitude);
					bean.setLongitude(longitude);
					bean.setListSysWorktime(listSysWorktime);
					listSysWorktime = new ArrayList<SysWorktime>();
					hdcsList.add(bean);
					jgdwId = obj.getJgdwId();
					jgdwName = obj.getJgdwName();
					latitude = obj.getLatitude();
					longitude = obj.getLongitude();
					sysWorktime.setId(obj.getWtid());
					sysWorktime.setStartTime(obj.getStartTime());
					sysWorktime.setEndTime(obj.getEndTime());
					sysWorktime.setYyzl(obj.getYyzl());
					sysWorktime.setYysl(obj.getYysl());
					sysWorktime.setSysl(obj.getSysl());
					sysWorktime.setRiqi(obj.getRiqi());
					sysWorktime.setWeek(obj.getWeek());
					listSysWorktime.add(sysWorktime);
				}
			}
		}
		return hdcsList;
	}
	
	
	/**
	 * 
	 * @param response
	 * @param request
	 * @throws IOException
	 */
	@RequestMapping(value = "/weixin/WX_YuyueLogin.do", method = RequestMethod.GET)
	public void WX_YuyueLogin(HttpServletResponse response, HttpServletRequest request) throws IOException {
		User user = new User();
		user.setWeixinlogin(true);
		request.getSession().setAttribute("loginUser", user);
		AjaxJson ajaxJson=new AjaxJson();
		String ret = "";
		response.setCharacterEncoding("UTF-8"); //设置编码格式
		response.setContentType("text/html");   //设置数据格式
		PrintWriter out = response.getWriter();
		try {
			
			BaseJson baseJson = new BaseJson();
			baseJson.setCode("000000");
			baseJson.setMsg("成功");
			baseJson.setData("");
			JSONObject json = JSONObject.fromObject(baseJson);
			ret = JSON.toJSONString(json);
			out = response.getWriter(); //获取写入对象
			out.print(ret); //将json数据写入流中
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			e.printStackTrace();
			ajaxJson.setCode("000001");
			ajaxJson.setMsg("操作失败");
			out.print(JSON.toJSONString(ajaxJson));
//			return JSON.toJSONString(ajaxJson);
		} finally {
			out.flush();
			out.close();
		}
	}

	/**
	 * 查询可以预约信息
	 * 
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping(value = "/yuYue/findYuYueByRJNew.do", method = RequestMethod.GET)
	public void findYuYueByRJNew(HttpServletResponse response, String sls, String slx,String count) throws IOException {
		
		AjaxJson ajaxJson=new AjaxJson();
		String ret = "";
		response.setCharacterEncoding("UTF-8"); //设置编码格式
		response.setContentType("text/html");   //设置数据格式
		PrintWriter out = response.getWriter();
		try {
			Map<String,Object> param = new HashMap<String,Object>();
			
			/**
			 * 获取用户在该应用下的皮肤
			 */
			String str=sls.substring(0,4);
			
				if ((slx == null || "".equals(slx))) {
					// 根据受理地所在市查询受理地所在县(区)：
					List<SysDictionary> list = (List<SysDictionary>) crjRyjbxxServiceI.listSysDictionaryByType(sls,"1",count);
					for (int i = 0; i < list.size(); i++) {
						if (i == 0) {
							slx += "'" + list.get(i).getId() + "'";
						} else {
							slx += "," + "'" + list.get(i).getId() + "'";
						}
					}
				}
				BaseJson baseJson = new BaseJson();
				
				if (count.equals("0")) {
					param.put("slx", slx);
				}else if(slx.contains("22016700")){
					param.put("slx", "22016700"); //长春市本级
				}else if(slx.contains("22028500")){
					param.put("slx", "22028500"); //吉林市本级
				}else if(slx.contains("22038300")){
					param.put("slx", "22038300"); //四平市本级
				}else if(slx.contains("22047300")){
					param.put("slx", "22047300"); //辽源市本级
				}else if(slx.contains("22058300")){
					param.put("slx", "22058300"); //通化市本级
				}else if(slx.contains("22069600")){
					param.put("slx", "22069600"); //白山市本级
				}else if(slx.contains("22088300")){
					param.put("slx", "22088300"); //白城市本级
				}else if(slx.contains("22243900")){
					param.put("slx", "22243900"); //延边州本级
				}else if(slx.contains("22038100")){
					param.put("slx", "22038100"); //公主岭市本级
				}else if(slx.contains("22058100")){
					param.put("slx", "22058100"); //梅河口市本级
				}else if(slx.contains("22302100")){
					param.put("slx", "22302100"); //珲春市本级
				}else if(slx.contains("22072500")){
					param.put("slx", "22072500"); //松原市本级
				}else{
					param.put("slx", "00000000");
				}
					List<SysOrganization> list =crjRyjbxxServiceI.selectByXzqh(param);
					List<YuYueBean> voList = findYuYueByRJChange(list);
					
					baseJson.setCode("000000");
					baseJson.setMsg("成功");
					baseJson.setData(voList);
				
				
				//return voList;
				//List<YuYueBean> list = yyxxService.findYuYueByRJ(param);
				
				JsonConfig jsonConfig = new JsonConfig();  
				jsonConfig.registerJsonValueProcessor(Date.class, new JsonDateValueProcessor());
				JSONObject aa = JSONObject.fromObject(baseJson, jsonConfig);
				ret = JSON.toJSONString(aa);
				
				out = response.getWriter(); //获取写入对象
				out.print(ret); //将json数据写入流中
				
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			e.printStackTrace();
			ajaxJson.setCode("000001");
			ajaxJson.setMsg("操作失败");
			out.print(JSON.toJSONString(ajaxJson));
//			return JSON.toJSONString(ajaxJson);
			
		} finally {
			out.flush();
			out.close();
		}
	}
	
	/**
	 * 根据微信查询预约时间判定
	 * @param idcard
	 * @param phonenum
	 * @return
	 */
	@RequestMapping(value = "/weixin/PC_YuyueDate.do", method = RequestMethod.GET)
	public void findYyxxBysfzh(HttpServletResponse response,String sfzh) throws IOException {

		AjaxJson ajaxJson=new AjaxJson();
		SimpleDateFormat dateFormater = new SimpleDateFormat("yyyy-MM-dd");
		Date date=new Date();
		String ret = "";
		
		response.setCharacterEncoding("UTF-8"); //设置编码格式
		response.setContentType("text/html");   //设置数据格式
		PrintWriter out = response.getWriter();
		try {
			List list = crjRyjbxxServiceI.findYyxxBySfzh(sfzh,dateFormater.format(date));
			BaseJson baseJson = new BaseJson();
			if (list.size()>0){
				baseJson.setCode("000002");
				baseJson.setMsg("您今天已经进行了预约，一天只能预约一次，不能再次预约了！");
				baseJson.setData("");
			}else{
				baseJson.setCode("000000");
				baseJson.setMsg("成功");
				baseJson.setData("");
			}

			JSONObject json = JSONObject.fromObject(baseJson);
			ret = JSON.toJSONString(json);
			
			out = response.getWriter(); //获取写入对象
			out.print(ret); //将json数据写入流中
			
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			e.printStackTrace();
			ajaxJson.setCode("000001");
			ajaxJson.setMsg("操作失败");
			out.print(JSON.toJSONString(ajaxJson));
//			return JSON.toJSONString(ajaxJson);
			
		} finally {
			out.flush();
			out.close();
		}
	}
	
	
	public static void main(String[] args) {
		WeiXinUtil util = new WeiXinUtil();
		String token = util.getAccess_token("wxf1fd8f1419f114b6", "f07db3f88b45786377687dc19eca3fd1");
		System.out.println(token);

	}
	
}
