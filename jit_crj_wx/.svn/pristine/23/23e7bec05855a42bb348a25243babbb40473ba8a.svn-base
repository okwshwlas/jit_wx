package dogo.controller;

import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;

import dogo.model.Gongzhong;
import dogo.model.WeixinGroup;
import dogo.model.WeixinUser;
import dogo.service.GongzhongZhanghaoService;
import dogo.util.Page;
import dogo.util.Params;
import dogo.weixin.core.WeiXinUtil;

@Controller
@RequestMapping("/weixinuserControl")
public class WeixinUserController {
	
	private static final Logger log = Logger.getLogger(UserController.class);
	
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
	 * 
	 * @param wuser
	 * @param page
	 * @return
	 */
	@RequestMapping(value = "/chkAllUser.do")
	@ResponseBody
	public Map<String,Object> chkAllUser(WeixinUser wuser,Page page,String groupid,String nickname) {
		Map<String, Object> res = new HashMap<String, Object>();
		Gongzhong gongzhong = gongzhongZhanghaoService.selectGongzhongZhanghaoById("1");
		String appid = gongzhong.getAccountAppid();
		String appsecret = gongzhong.getAccountAppsecret();
		WeiXinUtil weiXinUtil = new WeiXinUtil();
		String token = 	weiXinUtil.getAccess_token(appid,appsecret);
		res.put("WeixinUser", wuser);
		Map<String, Object> mm=weiXinUtil.getAllWeiXinUser(token);
		if((String)mm.get("message")=="error"||(String)mm.get("msg")=="error"){
			res.put("total", 0);
		}else{
			int total=Integer.valueOf(mm.get("total").toString());
			String json=mm.get("userInfo").toString();
			List<WeixinUser> list = JSON.parseArray(json,WeixinUser.class);
			List<WeixinUser> l=new ArrayList<WeixinUser>();
			int begin=(page.getPage()-1)*page.getRows();
	        List<WeixinUser> subList = new ArrayList<WeixinUser>();
			if((groupid!=null&&!"".equals(groupid))||(nickname!=null&&!"".equals(nickname))){
				for (WeixinUser weixinUser : list) {
					String wg = weixinUser.getGroupid();
					String wn = weixinUser.getNickname();
					if(wg==null||wg.equals("")){
						wg="";
					}
					if(wn==null||wn.equals("")){
						wn="";
					}
					if(nickname==null||"".equals(nickname)){
						if(wg.equals(groupid)){
							l.add(weixinUser);
						}
					}else if(groupid==null||"".equals(groupid)){
						if(wn.indexOf(nickname)>=0){
							l.add(weixinUser);
						}
					}else{
						if(wn.indexOf(nickname)>=0&&wg.equals(groupid)){
							l.add(weixinUser);
						}
					}
				}
				if(l.size()!=0){
					subList=Params.listPage(l.size(), page.getRows(), page.getPage(), l);
					total=l.size();
				}else{
					total=0;
				}
			}else{
				subList=Params.listPage(total, page.getRows(), page.getPage(), list);
			}
			
	        res.put("rows",subList);
			res.put("total", total);
			res.put("page", page.getPage());
		}
		return res;
	}
	/**
	 * 
	 * @param wGroup
	 * @param page
	 * @return
	 */
	@RequestMapping(value = "/chkGroup.do")
	@ResponseBody
	public List<WeixinGroup> chkGroup(WeixinGroup wGroup,Page page) {
		List<WeixinGroup> res = new ArrayList<WeixinGroup>();
		Gongzhong gongzhong = gongzhongZhanghaoService.selectGongzhongZhanghaoById("1");
		String appid = gongzhong.getAccountAppid();
		String appsecret = gongzhong.getAccountAppsecret();
		WeiXinUtil weiXinUtil = new WeiXinUtil();
		String token = 	weiXinUtil.getAccess_token(appid,appsecret);
		String json=weiXinUtil.getUserGroup(token);
		String a="\"groups\":";
		String jo=json.substring(1, json.length()-1).replaceAll(a, "");
		res = JSON.parseArray(jo,WeixinGroup.class);
		return res;
	}
	/**
	 * 导出报告中心信息
	 * @param request
	 * @param response
	 * @param paraVo
	 */
	@RequestMapping(value = "/exportExcel2.do")  
	 public void exportExcel2(HttpServletRequest request, HttpServletResponse response,WeixinUser wuser){  
		 // 生成提示信息，  
	     response.setContentType("application/vnd.ms-excel");  
//	     String codedFileName = new Date().getTime()+".xls";  
	     String codedFileName = Params.systemDate()+"导出文件.xls"; 
	     OutputStream fOut = null;  
	     try  
	     {  
	         response.setHeader("content-disposition", "attachment;filename=" + new String(codedFileName.getBytes("GBK"),"ISO8859-1"));  
	         // 产生工作簿对象  
	         HSSFWorkbook workbook = new HSSFWorkbook();  
	         //产生工作表对象  
	         HSSFSheet sheet = workbook.createSheet("Sheet1");  
	         String[] headers = { "用户标识", "用户昵称","用户性别","用户地区","用户最后关注时间","用户备注"};
	         HSSFRow row = sheet.createRow(0);
	 		for (int i = 0; i < headers.length; i++) {
	 			HSSFCell cell = row.createCell((short) i);
	 			cell.setCellValue(headers[i]);
	 		}
	 		
	 		Map<String,Object> paraMap=new HashMap<String, Object>();
			Gongzhong gongzhong = gongzhongZhanghaoService.selectGongzhongZhanghaoById("1");
			String appid = gongzhong.getAccountAppid();
			String appsecret = gongzhong.getAccountAppsecret();
			WeiXinUtil weiXinUtil = new WeiXinUtil();
			String token = 	weiXinUtil.getAccess_token(appid,appsecret);
			Map<String, Object> mm=weiXinUtil.getAllWeiXinUser(token);
			String json=mm.get("userInfo").toString();
			List<WeixinUser> list = JSON.parseArray(json,WeixinUser.class);
			
			for (WeixinUser weixinUser : list) {
				
				if(weixinUser!=null){
					if(weixinUser.getSex()==null){
						weixinUser.setSex("");
					}
					if(weixinUser.getSex().equals("1")){
						weixinUser.setSex("男");
					}else if(weixinUser.getSex().equals("2")){
						weixinUser.setSex("女");
					}else{
						weixinUser.setSex("未知");
					}
					
					String weixingroup = weixinUser.getGroupid();
					String weixinname = weixinUser.getNickname();
					if(weixingroup==null||weixingroup.equals("")){
						weixinUser.setGroupid("");
					}
					if(weixinname==null||weixinname.equals("")){
						weixinUser.setNickname("");
					}
					
					
					String subscribe_time=weixinUser.getSubscribe_time();
					if(subscribe_time==null){
						subscribe_time="";
					}
		            SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		            String sd = sdf.format(new Date(Long.valueOf(subscribe_time+"000")));
		            weixinUser.setSubscribe_time(sd);
		            
					/*WeixinGroup wGroup=new WeixinGroup();
					String wg=weiXinUtil.getUserGroup(token);
					String g="\"groups\":";
					String ja=wg.substring(1, wg.length()-1).replaceAll(g, "");
					List<WeixinGroup> res = JSON.parseArray(ja,WeixinGroup.class);
					for (WeixinGroup weixinGroup : res) {
						
						if(weixinUser.getGroupid()!=null&&weixinUser.getGroupid().equals(weixinGroup.getId())){
							weixinUser.setGroupid(weixinGroup.getName());
							}
						}*/
					}
					
				}
				
				 
				
				
			for (int i = 0; i < list.size(); i++) {
				WeixinUser wu = (WeixinUser)list.get(i);
				if(wu!=null){
		 			HSSFCell cell1 =  sheet.createRow(i+1).createCell((short) 0);
		 			cell1.setCellValue(wu.getOpenid()+"");//用户标识
		 			HSSFCell cell2 =  sheet.createRow(i+1).createCell((short) 1);
		 			cell2.setCellValue(wu.getNickname()+"");//用户昵称
		 			HSSFCell cell3 =  sheet.createRow(i+1).createCell((short) 2);
		 			cell3.setCellValue(wu.getSex()+"");//用户性别
		 			HSSFCell cell4 =  sheet.createRow(i+1).createCell((short) 3);
		 			cell4.setCellValue(wu.getProvince()+"");//用户地区
		 			HSSFCell cell5 =  sheet.createRow(i+1).createCell((short) 4);
		 			cell5.setCellValue(wu.getSubscribe_time()+"");//用户最后关注时间
		 			HSSFCell cell6 =  sheet.createRow(i+1).createCell((short) 5);
		 			cell6.setCellValue(wu.getRemark()+"");//用户备注
		 			/*HSSFCell cell7 =  sheet.createRow(i+1).createCell((short) 6);
		 			cell7.setCellValue(wu.getGroupid()+"");//用户分组*/	
				}
				 			
	 			
			}
	         fOut = response.getOutputStream();  
	         workbook.write(fOut);  
	         fOut.flush();  
           fOut.close();  
	     }  
	     catch (Exception e)  {
	    	 e.printStackTrace();
	     }  
	 }

}
