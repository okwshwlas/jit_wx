package dogo.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import dogo.model.Sfxm;

@Service
public class SfxmServiceImpl implements SfxmServiceI{

	public List<Sfxm> getSfxmByWhbh(String ywbh,String jyh) { 
		String sql="";
			//设定数据库驱动，数据库连接地址、端口、名称，用户名，密码
		String driverName="oracle.jdbc.driver.OracleDriver";
		String url="jdbc:oracle:thin:@(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=192.168.2.242)(PORT=1521))(ADDRESS=(PROTOCOL=TCP)(HOST=192.168.2.243)(PORT=1521))(LOAD_BALANCE=yes))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=crjdb)(FAILOVER_MODE=(TYPE=SELECT)(METHOD=BASIC)(RETRIES=180)(DELAY=5))))";	//test为数据库名称，1521为连接数据库的默认端口
		String user="crj_business";	//aa为用户名
		String password="crj_business_2016";	//123为密码
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		//Sfxm sfxm = new Sfxm();
		List<Sfxm> list = new ArrayList<Sfxm>();
		//数据库连接对象
		Connection conn = null;
		try {
			//反射Oracle数据库驱动程序类
			Class.forName(driverName);
			//获取数据库连接
			conn = DriverManager.getConnection(url, user, password);
			//定制sql命令
			sql = "SELECT id,rowid,ywbh,jyh,ywlb,ywlbmc,stflb,stflbmc,stfje,sfrq,sfdw,sfry,tfrq,tfdw,tfry,stfbs,sfrs FROM t_tj_sfxm where ywbh='" + ywbh + "' and jyh ='"+jyh+"'";
			//创建该连接下的PreparedStatement对象
			pstmt = conn.prepareStatement(sql);
			//执行查询语句，将数据保存到ResultSet对象中
			rs = pstmt.executeQuery();
			//将指针移到下一行，判断rs中是否有数据
			while(rs.next()){
				Sfxm sfxm = new Sfxm();
				sfxm.setYwlbmc(rs.getString("stflbmc"));
				sfxm.setYwbh(rs.getString("ywbh"));
				sfxm.setStfje(rs.getString("stfje"));
				list.add(sfxm);
			}
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
		return list;
	}

	@Override
	public String getSfjf(String ywbh) {
		String sql="";
		String saomaType="";
		//设定数据库驱动，数据库连接地址、端口、名称，用户名，密码
	String driverName="oracle.jdbc.driver.OracleDriver";
	String url="jdbc:oracle:thin:@(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=192.168.2.242)(PORT=1521))(ADDRESS=(PROTOCOL=TCP)(HOST=192.168.2.243)(PORT=1521))(LOAD_BALANCE=yes))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=crjdb)(FAILOVER_MODE=(TYPE=SELECT)(METHOD=BASIC)(RETRIES=180)(DELAY=5))))";	//test为数据库名称，1521为连接数据库的默认端口
	String user="crj_business";	//aa为用户名
	String password="crj_business_2016";	//123为密码
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	//数据库连接对象
	Connection conn = null;
	try {
		//反射Oracle数据库驱动程序类
		Class.forName(driverName);
		//获取数据库连接
		conn = DriverManager.getConnection(url, user, password);
		//定制sql命令
		sql = "SELECT saoma_type FROM t_wx_smsf where ywbh='" + ywbh + "'";
		//创建该连接下的PreparedStatement对象
		pstmt = conn.prepareStatement(sql);
		//执行查询语句，将数据保存到ResultSet对象中
		rs = pstmt.executeQuery();
		//将指针移到下一行，判断rs中是否有数据
		if(rs.next()){
			saomaType = rs.getString("saoma_type");
		}
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
	return saomaType;
	}

	@Override
	public Map<String, Object> getSfRyxxByWhbh(String ywbh) {
		String sql="";
		String saomaType="";
		//设定数据库驱动，数据库连接地址、端口、名称，用户名，密码
	String driverName="oracle.jdbc.driver.OracleDriver";
	String url="jdbc:oracle:thin:@(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=192.168.2.242)(PORT=1521))(ADDRESS=(PROTOCOL=TCP)(HOST=192.168.2.243)(PORT=1521))(LOAD_BALANCE=yes))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=crjdb)(FAILOVER_MODE=(TYPE=SELECT)(METHOD=BASIC)(RETRIES=180)(DELAY=5))))";	//test为数据库名称，1521为连接数据库的默认端口
	String user="crj_business";	//aa为用户名
	String password="crj_business_2016";	//123为密码
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	 Map<String,Object> remap=new HashMap<String,Object>();
	//数据库连接对象
	Connection conn = null;
	try {
		//反射Oracle数据库驱动程序类
		Class.forName(driverName);
		//获取数据库连接
		conn = DriverManager.getConnection(url, user, password);
		//定制sql命令
		sql = "SELECT zwxm,sfzh FROM t_tj_stfxx where ywbh='" + ywbh + "'";
		//创建该连接下的PreparedStatement对象
		pstmt = conn.prepareStatement(sql);
		//执行查询语句，将数据保存到ResultSet对象中
		rs = pstmt.executeQuery();
		//将指针移到下一行，判断rs中是否有数据
		if(rs.next()){
			remap.put("zwxm", rs.getString("zwxm"));
			remap.put("sfzh", rs.getString("sfzh"));
			
		}
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
	return remap;
	}
}
