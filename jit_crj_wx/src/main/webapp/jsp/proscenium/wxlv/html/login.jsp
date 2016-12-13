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
	<script type="text/javascript">
     var path= '<%=path%>';
     var openid='<%=openid%>';
     var basePath='<%=basePath%>';
     var code='<%=code%>';
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
// var url = basePath + "/proscenium/crjRyjbxxController/weixin/WX_YuyueDate.do?random=" + Math.random();
// var listParams = {
// 		"openid" : openid
// 	};


// $.ajaxSettings.async = false; 
// $.getJSON(url,listParams, function(json){
// 	if(json.code=="000002"){

// 		alert(json.msg);
// 		window.location.href="wx_xxlb.jsp?openid="+openid+"&newlatitude="+newlatitude+"&newlongitude="+newlongitude+"&adr="+adr+"&adrcs="+adrcs;
// 	}
	
// });
});
	 
	 
	function jhrcard(jhrcard){
		var sfzflag=false;
		// 身份证号码为15位或者18位，15位时全为数字，18位前17位为数字，最后一位是校验位，可能为数字或字符X  
		 var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;  
		if(reg.test(jhrcard)){
			sfzflag=true;
			
		}
	}
	function jhrcard(jhrcard){
		var sfzflag=false;
		//手机号码正则
		var phonereg = /^(((13[0-9]{1})|(14[0-9]{1})|(17[0-9]{1})|(15[0-3]{1})|(15[5-9]{1})|(18[0-3]{1})|(18[5-9]{1}))+\d{8})$/;
		if(phonereg.test(jhrcard)){
			sfzflag=true;
		}
	}
	
	function submit(){
		var els =$('#sfzh').val();
		var str ='';
		var dhhm =$('#lxdh').val();
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
		var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/; 
		if(els==""){
			alert("请您输入的身份证号！");
			return false;
		}else{
			if(!reg.test(els)){
				alert("您输入的身份证号有误，请重新输入！");
				//els[i].addClass("border_color");
				
				return false;
			}
		}
		if(dhhm !='13843123581'){
			alert('测试中！！！');
			
			return false;
			
			
		}
		
		$.ajax({
			url : "http://221.8.52.247:8445/jit_crj/crj/WxRy/findZj.do",
			data : {
				"sfzh" : els,
				"lxdh" : dhhm
			},
			type : "post",
			dataType:"JSON",
// 			jsonp: "callback",//传递给请求处理程序或页面的，用以获得jsonp回调函数名的参数名(一般默认为:callback)
// 	        jsonpCallback:"flightHandler",//自定义的jsonp回调函数名称，默认为jQuery自动生成的随机函数名，也可以写"?"，jQuery会自动为你处理数据
			success:function(data,textStatus) {
				var gatxz= data.gatxz;
				var twtxz= data.twtxz;
				setCookie('sfzh',els);
				setCookie('lxdh',dhhm);
				setCookie('openid',openid);
				setCookie('gatxz',gatxz);
				setCookie('twtxz',twtxz);
				if(gatxz =='0' && twtxz =='0' ){
					alert('对应身份证下不存在往来港澳通行证和台湾通行证，请申请证件后继续办理');
					location = "personal_info.jsp";
				}else{
					$.ajax({
			 			url : "http://221.8.52.247:8445/jit_crj/crj/WxRy/findRyxx.do",
			 			
			 			data : {
			 				"sfzh" : els,
			 				"lxdh" : dhhm
			 			},
			 			type : "post",
			 			dataType:"JSON",
			// 			jsonp: "callback",//传递给请求处理程序或页面的，用以获得jsonp回调函数名的参数名(一般默认为:callback)
			// 	        jsonpCallback:"flightHandler",//自定义的jsonp回调函数名称，默认为jQuery自动生成的随机函数名，也可以写"?"，jQuery会自动为你处理数据
			 			success:function(data,textStatus) {
			 				if (data.flag== "0") {
			 					//查询出错
			 				}else if(data.flag== "3"){
			 					location="kind_business.jsp";
							
			 				}else {
			 					location="personal_info.jsp";
			 				}
			 			}
			 		});
				}
			}
		});

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
        <h2 class="login_title">二次签注登录</h2>
        <div class="login_margin"> <input type="number" placeholder="请输入手机号码" name="dhhm" id="lxdh" class="login_input" /></div>
        <div class="login_margin"> <input type="text" placeholder="请输入身份证号码" name="number" id ="sfzh" class="login_input" /></div>
        <div><a href="javascript:void(0);" class="login_btn" onClick="submit();">登 录</a></div>
    </div>
</body>
</html>