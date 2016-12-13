package dogo.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JsonConfig;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import dogo.model.CrjLstdYwFjxx;
import dogo.model.CrjLstdYwInfo;
import dogo.model.Gongzhong;
import dogo.modeljson.AjaxJson;
import dogo.modeljson.BaseJson;
import dogo.modeljson.JsonDateValueProcessor;
import dogo.service.CrjLstdYwFjxxServiceI;
import dogo.service.CrjLstdYwInfoServiceI;
import dogo.service.GongzhongZhanghaoService;
import dogo.weixin.core.WeiXinUtil;
import dogo.weixin.core.model.MdlUpload;
import dogo.weixin.core.model.Result;

@Controller
@RequestMapping("/proscenium/crjlstdywinfoController")
public class CrjLstdYwInfoController {

	private static final Logger log = Logger.getLogger(CrjLstdYwInfoController.class);
	
	@Autowired
	private CrjLstdYwInfoServiceI crjLstdYwInfoServiceI;
	@Autowired
	private CrjLstdYwFjxxServiceI crjLstdYwFjxxServiceI;
	@Autowired
	private GongzhongZhanghaoService gongzhongZhanghaoService;
	
	/**
	 * 进入主页前 查询判断是否有历史记录  有查询历史显示，没有进入申请页面
	 * @param response
	 * @param openid
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "/weixin/selectByOpenidPd.do", method = RequestMethod.POST)
	@ResponseBody
	public AjaxJson selectByOpenidPd(HttpServletResponse response,String openid)throws IOException{
		AjaxJson ajaxJson=new AjaxJson();
		try {
			CrjLstdYwInfo crjLstdYwInfo = crjLstdYwInfoServiceI.selectByOpenIdPD(openid);
			if(crjLstdYwInfo==null){
				String data = "1";
				ajaxJson.setObj(data);
			}else{
				List<CrjLstdYwInfo> crjLstdYwInfoList = crjLstdYwInfoServiceI.selectByOpenId(openid);
				SimpleDateFormat dft =  new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				ajaxJson.setObj(crjLstdYwInfoList);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e);		
		}
		System.out.println(ajaxJson);
		return ajaxJson;
	}
	
	/**
	 * 通过业务编号将信息查询
	 * @param response
	 * @param ywbh
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "/weixin/selectByYwbh.do", method = RequestMethod.POST)
	@ResponseBody
	public AjaxJson selectByYwbh(HttpServletResponse response,String ywbh)throws IOException{
		AjaxJson ajaxJson=new AjaxJson();
		try {
			CrjLstdYwInfo crjLstdYwInfo = crjLstdYwInfoServiceI.selectByYwbh(ywbh);
			ajaxJson.setObj(crjLstdYwInfo);
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e);		
		}
		System.out.println(ajaxJson);
		return ajaxJson;
	}
	
	/**
	 * 通过业务编号修改业务信息
	 * @param response
	 * @param ywbh
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "/weixin/editByYwbh.do", method = RequestMethod.GET)
	@ResponseBody
	public AjaxJson editByYwbh(HttpServletResponse response,HttpServletRequest request,String ywbh)throws IOException{
		AjaxJson ajaxJson=new AjaxJson();
		WeiXinUtil weiXinUtil = new WeiXinUtil();
		String baseDir = request.getSession().getServletContext().getRealPath("\\WXImage");
		try {
		    CrjLstdYwInfo crjLstdYwInfo = crjLstdYwInfoServiceI.selectByYwbh(ywbh);
			List<CrjLstdYwFjxx> fjxxList = crjLstdYwFjxxServiceI.selectByYwbh(ywbh);
			if(fjxxList != null && fjxxList.size() > 0 ){
				
				Gongzhong gongzhong = gongzhongZhanghaoService.selectGongzhongZhanghaoById("1");
		        String accessToken=weiXinUtil.getAccess_token(gongzhong.getAccountAppid(), gongzhong.getAccountAppsecret());//获得access_token
		        for(CrjLstdYwFjxx vo : fjxxList){
		        	Result<MdlUpload> result = new Result<MdlUpload>();  
		        	String filePath = baseDir +"\\" + vo.getFilePath();
		        	String fileType = "";
		        	if(vo.getFileType() != null && vo.getFileType().equals("1")){
		        		fileType = "image";
		        	}else if(vo.getFileType() != null && vo.getFileType().equals("2")){
		        		fileType = "voice";
		        	}
		        	result = weiXinUtil.uploadMedia(accessToken,fileType,filePath);
		        	//判断是否上传成功
		        	if(result.getErrcode().equals("0")){
		        		vo.setWxServerID(result.getObj().getMedia_id());
		        	}
		        }
		        crjLstdYwInfo.setFjxxList(fjxxList);
			}
			ajaxJson.setObj(crjLstdYwInfo);
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e);		
		}
		return ajaxJson;
	}
	/**
	 * 将图片  录音  描述 储存
	 * @param response
	 * @param request
	 * @param formVo
	 * @throws IOException
	 */
	@RequestMapping(value = "/weixin/insertCl.do", method = RequestMethod.POST)
	@ResponseBody
	public void insertCl(HttpServletResponse response,HttpServletRequest request,String formVo)throws IOException{
		AjaxJson ajaxJson=new AjaxJson();
		response.setCharacterEncoding("UTF-8"); //设置编码格式
		response.setContentType("text/html");   //设置数据格式
		PrintWriter out = response.getWriter();
		WeiXinUtil weiXinUtil = new WeiXinUtil();
		String baseDir = request.getSession().getServletContext().getRealPath("\\WXImage");
		try {
		    JSONObject json = JSONObject.parseObject(formVo);//
			String wzms = (String) json.get("wzms");//文字描述
			String openid = json.getString("openid");
			String accessToken = json.getString("accessToken");
			String type = json.getString("type");
			Object yyms = json.get("yyms");
			List<Object> list = (List<Object>)json.getJSONArray("zmcl");
			//生成业务编号
			String ywbh = "123";
			CrjLstdYwInfo crjLstdYwInfo = new CrjLstdYwInfo();
			crjLstdYwInfo.setId(UUID.randomUUID().toString());
			crjLstdYwInfo.setRemarks(wzms);
			crjLstdYwInfo.setOpenid(openid);
			crjLstdYwInfo.setYwType(type);
			crjLstdYwInfo.setYwbh(ywbh);
			crjLstdYwInfo.setYwzt("4");
			crjLstdYwInfo.setCreateDate(new Date());
			crjLstdYwInfoServiceI.save(crjLstdYwInfo);
			//图片保存
			for(Object obj :list){
				String imagePathName = weiXinUtil.downloadMedia(accessToken, obj.toString(), baseDir);//微信图片文件下载名称
				CrjLstdYwFjxx crjLstdYwFjxx = new CrjLstdYwFjxx();
				crjLstdYwFjxx.setYwbh(ywbh);
				crjLstdYwFjxx.setCreateDate(new Date());
				crjLstdYwFjxx.setFileType("1");
				crjLstdYwFjxx.setFilePath(imagePathName);
				crjLstdYwFjxx.setId(UUID.randomUUID().toString());
				crjLstdYwFjxxServiceI.save(crjLstdYwFjxx);
			}
			//保存录音
			String yyPathName = weiXinUtil.downloadMedia(accessToken, yyms.toString(), baseDir);//微信语音文件下载名称
			CrjLstdYwFjxx crjLstdYwFjxx = new CrjLstdYwFjxx();
			crjLstdYwFjxx.setYwbh(ywbh);
			crjLstdYwFjxx.setCreateDate(new Date());
			crjLstdYwFjxx.setFileType("2");
			crjLstdYwFjxx.setFilePath(yyPathName);
			crjLstdYwFjxx.setId(UUID.randomUUID().toString());
			crjLstdYwFjxxServiceI.save(crjLstdYwFjxx);
			ajaxJson.setCode("000000");
			ajaxJson.setMsg("操作成功");
			ajaxJson.setObj(ywbh);
			out.print(JSON.toJSONString(ajaxJson));
		} catch (Exception e) {
			e.printStackTrace();
			ajaxJson.setCode("000001");
			ajaxJson.setMsg("操作失败");
			out.print(JSON.toJSONString(ajaxJson));
			log.error(e);		
		}
	}
	
	/**
	 * 将偕行人信息保存
	 * @param response
	 * @param ywbh
	 * @param xxr
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "/weixin/updateXxr.do", method = RequestMethod.POST)
	@ResponseBody
	public AjaxJson updateXxr(HttpServletResponse response,String ywbh,String xxr,String jgdwid)throws IOException{
		AjaxJson ajaxJson=new AjaxJson();
		try {
			 CrjLstdYwInfo crjLstdYwInfo = new CrjLstdYwInfo();
			 if(xxr!=null&&xxr!=""){
				 String[] xxrList = xxr.split(",");
		         if(xxrList.length==1){
		        	 crjLstdYwInfo.setXxr1(xxrList[0]);
		         }else if(xxrList.length==2){
		        	 crjLstdYwInfo.setXxr1(xxrList[0]);
		        	 crjLstdYwInfo.setXxr2(xxrList[1]);
		         }else if(xxrList.length==3){
		        	 crjLstdYwInfo.setXxr1(xxrList[0]);
		        	 crjLstdYwInfo.setXxr2(xxrList[1]);
		        	 crjLstdYwInfo.setXxr3(xxrList[2]);
		         } 
			 }
	         crjLstdYwInfo.setYwzt("0");
	         crjLstdYwInfo.setJgbh(jgdwid);
	         crjLstdYwInfo.setYwbh(ywbh);
	         crjLstdYwInfoServiceI.updateByYwbh(crjLstdYwInfo);
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e);		
		}
		System.out.println(ajaxJson);
		return ajaxJson;
	}
	
}
