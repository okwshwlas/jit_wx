package dogo.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.druid.sql.dialect.oracle.ast.clause.SubqueryFactoringClause.Entry;
import com.alibaba.fastjson.JSON;

import dogo.model.CrjPaylog;
import dogo.model.CrjYyxx;
import dogo.model.Gongzhong;
import dogo.model.SysWorktime;
import dogo.model.Wx_Pc;
import dogo.modeljson.AjaxJson;
import dogo.modeljson.BaseJson;
import dogo.modeljson.JsonDateValueProcessor;
import dogo.service.CrjRyjbxxServiceI;
import dogo.service.CrjWxQzPayServiceImpl;
import dogo.service.CrjWxQzPayServicel;
import dogo.service.GongzhongZhanghaoService;
import dogo.util.DataUtils;
import dogo.util.HttpClientUtil;
import dogo.util.Params;
import dogo.util.SmsUtils;
import dogo.util.StringUtils;
import dogo.util.UUID;
import dogo.weixin.core.WeiXinUtil;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import sun.misc.BASE64Decoder;


@Controller
@RequestMapping("/crj/wxsfzf")
public class WxsmzfController {
	  private static final Logger log = Logger.getLogger(WxsmzfController.class);

	  @Autowired
	  private CrjRyjbxxServiceI crjRyjbxxServiceI;
		@Autowired
	  private CrjWxQzPayServicel crjWxQzPayServiceI;
	  
	  public CrjWxQzPayServicel getCrjWxQzPayServiceI() {
			return crjWxQzPayServiceI;
		}

		public void setCrjWxQzPayServiceI(CrjWxQzPayServicel crjWxQzPayServiceI) {
			this.crjWxQzPayServiceI = crjWxQzPayServiceI;
		}


	  @Autowired
	  private GongzhongZhanghaoService gongzhongZhanghaoService;
	
	 
	 @RequestMapping(value={"/savesfzf.do"}, method={org.springframework.web.bind.annotation.RequestMethod.POST})
	 public  void saveSfzf(HttpServletResponse response, HttpServletRequest request)
			    throws IOException, ParseException{
		   AjaxJson ajaxJson = new AjaxJson();
		    String ret = "";
		    response.setCharacterEncoding("UTF-8");
		    response.setContentType("text/html");
		    PrintWriter out = response.getWriter();
		    BaseJson baseJson = new BaseJson();
		    String ywbh =request.getParameter("ywbh");
		    String openid =request.getParameter("openid");
		    String returnString = "";
		    //type 标示是save 还是update操作
		    String sql="";
			//设定数据库驱动，数据库连接地址、端口、名称，用户名，密码
				String driverName="oracle.jdbc.driver.OracleDriver";
				String url="jdbc:oracle:thin:@(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=192.168.2.242)(PORT=1521))(ADDRESS=(PROTOCOL=TCP)(HOST=192.168.2.243)(PORT=1521))(LOAD_BALANCE=yes))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=crjdb)(FAILOVER_MODE=(TYPE=SELECT)(METHOD=BASIC)(RETRIES=180)(DELAY=5))))";	//test为数据库名称，1521为连接数据库的默认端口
				String user="crj_business";	//aa为用户名
				String password="crj_business_2016";	//123为密码
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				ResultSet rs1 = null;
				PreparedStatement pstmt1 = null;
				
				//数据库连接对象
				Connection conn = null;
				int a=0,b=0;
				
				try {
					//反射Oracle数据库驱动程序类
					Class.forName(driverName); 
					
					//获取数据库连接
					conn = DriverManager.getConnection(url, user, password);
					
					pstmt1=conn.prepareStatement("select result from t_wx_smsf where ywbh = '"+ywbh+"' ");
					//创建该连接下的PreparedStatement对象
					//执行查询语句，将数据保存到ResultSet对象中
					rs1 = pstmt1.executeQuery();
					if(rs1.next()){
						String result = rs1.getString("result");
						if("03".equals(result)){
							returnString = "03";
						}else if ("10".equals(result)){
							returnString = "10";
						}else{
							returnString="0000";
						}
						}


						else{
						//System.out.println("结果集为空!");
							pstmt=conn.prepareStatement("insert into t_wx_smsf (ywbh,jyh,jylx,jyfs,stfje,data_type,openid,saoma_type) values(?,?,?,?,?,?,?,?)");
							pstmt.setString(1,ywbh);
							pstmt.setString(2,"001");
							pstmt.setString(3,"C");
							pstmt.setString(4,"P");
							pstmt.setString(5,"0");
							pstmt.setString(6,"1");
							pstmt.setString(7,openid);
							pstmt.setString(8,"0");
							b=pstmt.executeUpdate();
							returnString="0000";

						}
					//输出数据库连接
				//	System.out.println(conn);
					Date date = new Date();
//					SimpleDateFormat format = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss[.fffffffff]");
//					String  sqsj = format.format(date);
//					 java.sql.Timestamp buydate=java.sql.Timestamp.valueOf(sqsj);
					
				
					//将指针移到下一行，判断rs中是否有数据
					
					
				} catch (ClassNotFoundException e) {
					e.printStackTrace();
				} catch (SQLException e) {
					e.printStackTrace();
				}finally{
					try{
						if(rs != null){
							rs.close();
						}
						if(pstmt != null){
							pstmt.close();
						}
						if(conn != null){
							conn.close();
						}
					} catch (SQLException e) {
						e.printStackTrace();
					}	
				}
//		  return returnString;
		   baseJson.setData(returnString);
	        JsonConfig jsonConfig = new JsonConfig();
//	        jsonConfig.registerJsonValueProcessor(Date.class, new JsonDateValueProcessor());
	        JSONObject aa = JSONObject.fromObject(baseJson, jsonConfig);
	        ret = JSON.toJSONString(aa);
	        out = response.getWriter();
	        out.print(ret);
		 
		 
	 }
	
	 
	 public static void main(String[] args) throws IOException{
			
//		 
//		 String urlencode=URLDecoder.decode("b3BlbklkPW9kQV9Sc29kOHk5MGdidjJISFA1QklVOTRjYmsmc2pobT0xNzcxMjY4MjY1NiZzZnpoPTIyMjQwMzE5NzIwNTIwNjY0WCZ4eGNvbWU9MSZoa3N6ZHBjcz0yMjI0MDMzMTUmbmFtZT3ojaPoibPkuL0%3D","utf-8");
//	        BASE64Decoder decoder=new BASE64Decoder();
//	        String urlend=new String(decoder.decodeBuffer(urlencode),"utf-8");
//	        System.out.println(urlend);
		 String token ="b3BlbklkJTNEb2RBX1JzaU12UGx1Rkd6LXR0SHVKVTZoSGh6SSUyNnNqaG0lM0QxMzg0MzEyMzU4MSUyNnNmemglM0QyMjAxMDQxOTg0MDQyNDE1MjAlMjZ4eGNvbWUlM0QxJTI2aGtzemRwY3MlM0QyMjAxMDY2NjElMjZuYW1lJTNEJUU1JUFFJThCJUU1JUJFJUFFJUU1JUJFJUFF";
		 
//		 token = "{code=011NoP}";
		 BASE64Decoder decoder=new BASE64Decoder();
	        String urlend=new String(decoder.decodeBuffer(token),"utf-8");
	        String returnString=URLDecoder.decode(urlend,"utf-8");
	        System.out.println(returnString);
	 }

	
}
