<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="/WEB-INF/tld/c.tld" prefix="c"%>
<%
	String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
    //微信用户唯一标识
   String openid = request.getParameter("openid");
   String sjhm = request.getParameter("sjhm");
   String code = request.getParameter("code");
   //String openid = "123456";
%> 
<!DOCTYPE html>
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">    <meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
    <meta name="format-detection" content="telephone=no,email=no,date=no,address=no">
    <title>用户注册</title>
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
	<script type="text/javascript" src="<%=basePath%>/jsp/proscenium/grzx/js/cookie.js"></script>
	<script type="text/javascript" src="<%=basePath%>/jsp/proscenium/grzx/js/zhuce.js"></script>
	<script type="text/javascript">
     var path= '<%=path%>';
     var openid='<%=openid%>';
     var basePath='<%=basePath%>';
     var code='<%=code%>';
     var sjhm ='<%=sjhm%>'
     //接口地址HOSt
     var host ='';
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
	if(''!=sjhm){
		$("#lxdh").val(sjhm);
		$("#lxdh").attr('readonly','readonly');
	}
});

	
	function submit(){
// 		var els =$('#sfzh').val();
		var str ='';
		var dhhm =$('#lxdh').val();
		var password =$('#password').val();
		if(dhhm.value==""){
			alert("请输入电话号码！");
			return false;
		}else{
			var phonereg = /^(((13[0-9]{1})|(14[0-9]{1})|(17[0-9]{1})|(15[0-3]{1})|(15[5-9]{1})|(18[0-3]{1})|(18[5-9]{1}))+\d{8})$/;
			if(!phonereg.test(dhhm)){
				alert("无效的电话号码！");
				//dhhm.addClass("border_color");
				return false;
			}
		}
		//大平台注册接口
		zhuCeSave(dhhm,password);

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
        <h2 class="login_title">注册</h2>
        <div class="login_margin"> <input type="number" placeholder="请输入手机号码" name="dhhm" id="lxdh" class="login_input" /></div>
        <div class="login_margin"> <input type="password" placeholder="请输入密码" name="password" id ="password" class="login_input" /></div>
        <div><a href="javascript:void(0);" class="login_btn" onClick="submit();">注  册</a></div>
    </div>
</body>
</html>