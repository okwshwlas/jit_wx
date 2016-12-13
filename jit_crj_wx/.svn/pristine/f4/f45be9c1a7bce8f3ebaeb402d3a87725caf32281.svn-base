<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="/WEB-INF/tld/c.tld" prefix="c"%>
<%
	String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
    //微信用户唯一标识
//    String openid = request.getParameter("openid");
   String code = request.getParameter("code");
   String sjhm = request.getParameter("sjhm");
//    sjhm = "13843123581";
   String openid = "33333";
%> 
<!DOCTYPE html>
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">    <meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
    <meta name="format-detection" content="telephone=no,email=no,date=no,address=no">
    <title>二次签注登录</title>
    <link rel="stylesheet" type="text/css" href="../css/aui.2.0.css" />
    <link rel="stylesheet" type="text/css" href="../css/commont.css" />
    <style>
        body { background:#cbd3e0 url("../image/login_bg.jpg") no-repeat left top; background-size: 100%;}
    </style>
<script type="text/javascript" src="<%=basePath%>/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/jweixin-1.0.0.js"></script>
<script type="text/javascript" src="<%=basePath%>/jsp/proscenium/lib/Validform_v5.3.2/demo/js/Validform_v5.3.2.js"></script>
<script type="text/javascript" src="<%=basePath%>/jsp/proscenium/lib/layer-v2.1/layer/layer.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/My97Date/WdatePicker.js" charset="utf-8"></script>
	<script type="text/javascript" src="<%=basePath%>/jsp/proscenium/wxlv/js/cookie.js"></script>
	<script type="text/javascript" src="<%=basePath%>/jsp/proscenium/wxlv/js/smrz.js"></script>
	<script type="text/javascript">
     var path= '<%=path%>';
     var openid='<%=openid%>';
     var basePath='<%=basePath%>';
     var code='<%=code%>';
     //接口地址HOSt
     var host ='';
     var userguid='';
     var sjhm='<%=sjhm%>';
     </script>
	
	
	 <script type="text/javascript">
	 
		$(function() {
	if(null!=code){
		var url = basePath + "/proscenium/crjRyjbxxController/weixin/Get_Openid.do?random=" + Math.random();
		var listParams = {
				"code" : code
	 	};
		$.ajaxSettings.async = false; 
		$.getJSON(url,listParams, function(json){
			if(json.code=="000000"){
				openid=json.data;
			}
		});
	}
	if(sjhm =='null'){
		
		sjhm=findSjhmByOpenid(openid);
		
		
	}
	
});
	 

	
	function submit(){
		var str ='';
		var gmsfhm =$('#gmsfhm').val();
		var xm =$('#xm').val();
		var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/; 
		if(gmsfhm==""){
			alert("请您输入的身份证号！");
			return false;
		}else{
			if(!reg.test(gmsfhm)){
				alert("您输入的身份证号有误，请重新输入！");
				//els[i].addClass("border_color");
				
				return false;
			}
		}
		smrz(sjhm,gmsfhm,xm);
	}
	
	
	
	//安卓地部兼容
	window.onresize = function() {
        var top = $("#footer").offset().top;
        var user_message_box = $('#footer');
        top > 600 ? user_message_box.hide() : user_message_box.show();
    };
    </script>
</head>
<body>
    <div id="login_wrap">
        <p class="login_logo"><img src="../image/login_logo.png" alt="" width="80"></p>
        <h2 class="login_title">实名认证</h2>
        <div class="login_margin"> <input type="text" placeholder="请输入身份证号码" name="gmsfhm" id="gmsfhm" class="login_input" /></div>
        <div class="login_margin"> <input type="text" placeholder="请输入真实姓名" name="xm" id ="xm" class="login_input" /></div>
        <div><a href="javascript:void(0);" class="login_btn" onClick="submit();">提交认证</a></div>
    </div>
</body>
</html>