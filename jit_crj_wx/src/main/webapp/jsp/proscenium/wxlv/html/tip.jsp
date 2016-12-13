<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="/WEB-INF/tld/c.tld" prefix="c"%>
<%
	String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
    //微信用户唯一标识
   String openid = request.getParameter("openid");
   String code = request.getParameter("code");
   //String openid = "123456";
   String lvtype = request.getParameter("type");
    String qwert = request.getParameter("qwert");
%> 
<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
    <meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
    <meta name="format-detection" content="telephone=no,email=no,date=no,address=no">
    <title>提 示</title>
    <link rel="stylesheet" type="text/css" href="../css/aui.2.0.css" />
    <script type="text/javascript" src="<%=basePath%>/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/jweixin-1.0.0.js"></script>
<script type="text/javascript" src="<%=basePath%>/jsp/proscenium/lib/Validform_v5.3.2/demo/js/Validform_v5.3.2.js"></script>
<script type="text/javascript" src="<%=basePath%>/jsp/proscenium/lib/layer-v2.1/layer/layer.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/My97Date/WdatePicker.js" charset="utf-8"></script>
	<script type="text/javascript" src="<%=basePath%>/jsp/proscenium/wxlv/js/cookie.js"></script>
    <style>
        body {}
        .center { text-align: center;}
        .center img { width: 30%;}
        .width { width: 100%;}
        .font_size { font-size: 0.9rem; color: #33acfb;}
        .aui-btn-block { color: #626262; padding: 0.5rem; font-size: 0.8rem;}
        .main_box { margin: 0 auto; padding: 25px 0; width: 85%; background-color: #fff; border-radius: 10px;}
    </style>
    <script type ="text/javascript">
    var lvtype= <%=lvtype%>;
	 var qwert = <%=qwert%>;
    function tiaozhuan(type){
    	if(type == '0'){
    		location="kind_business.jsp?qwert="+qwert;
    		
    	}
        if(type == '1'){
        	return history.go(-1);
    	}
    }
    </script>
</head>
<body>
<div >
    <div style="margin-top: 30%;" class="main_box">
       <p class="center"><img src="../image/icon_tip1.jpg"></p>
        <div class="">
            <div class="center width font_size">温馨提示:您是国家工作人员</div>
            <div class="center width" style="color: #626262; font-size: 0.7rem; width: 85%; margin: 0 auto; line-height: 30px;">需提交单位意见或上级主管单位按照人事管理权限审批后出具的同意办理出入境证件的函  </div>
        </div>
       <div style="width: 70%; margin: 30px auto;">
           <div class="aui-btn aui-btn-block aui-btn-info" style="color: #fff; margin-bottom: 15px;" onclick="tiaozhuan('0')">已有单位出具的意见或函 </div>
           <div class="aui-btn aui-btn-block" onclick="tiaozhuan('1')">无单位出具的意见或函 </div>
       </div>
    </div>
</div>
</body>
<script type="text/javascript" src="../script/api.js" ></script>
</html>