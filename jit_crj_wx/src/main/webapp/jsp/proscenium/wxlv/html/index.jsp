<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="/WEB-INF/tld/c.tld" prefix="c"%>
<%
	String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
    //微信用户唯一标识
   String openid = request.getParameter("openid");
   String type = request.getParameter("type");
   String code = request.getParameter("code");
   //String openid = "123456";
%> 
<!DOCTYPE html>
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">    <meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
    <meta name="format-detection" content="telephone=no,email=no,date=no,address=no">
    <title>人员信息绑定</title>
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
     var type='<%=type%>';
     setCookie('type',type);
     //接口地址HOSt
     var host ='';
     var userguid='';
     var sjhm='';
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
	$.ajax({
			url : "http://221.8.52.247:8445/jit_crj/crj/WxRy/findWxryxx.do",
			
			data : {
				"openid" : openid
			},
			type : "post",
			dataType:"JSON",
			success:function(data,textStatus) {
				var flag = data.flag;
				
				//未绑定出入境个人信息********start********
				if (flag== "0") {
					//根据openid没有查询到对应人员信息 跳转到人员信息绑定页面
					alert('没有查询该微信号对应的人员信息请先进行信息绑定');
					location="ryxxbd.jsp?openid="+openid;
				}
				
				//未绑定出入境个人信息********end********
				
				
				
				
				//已绑定出入境大平台注册查询接口********start********
				else if(flag== "1"){
					
				//已绑定但是没有进行认证根据返回的sjhm查询大平台接口是否已经注册了认证了
				sjhm=data.sjhm;
		$.ajax({
			//
			url : host+'api/v1/member/memberRegister',
			data : {
				
				"mobile" : sjhm
			},
			type : "post",
			dataType:"JSON",
			success:function(data,textStatus) {
				var succ= data.succ;
				var json =data.json
				//未注册跳转注册页面
				if(code =='100001'){
					alert('检测尚未注册请先注册并实名认证进行办理');
					location ='zhuce.jsp?sjhm='+sjhm;
				}
				else if(code =='100002'){
					//已经注册但没有认证
					location ='renzheng.jsp?sjhm='+sjhm;
				}
				else if(code =='100003'){
					//注册并认证则取查询注册接口返回值中的sfzh,户籍地进行出入境人员信息的update
					//接口还没有提供 暂定json
					
					$.ajax({
			 			url : "http://221.8.52.247:8445/jit_crj/crj/WxRy/WxryxxUpdate.do",
			 			data : {
			 				"sfzh" : json.sfzh,
			 				"openid":openid,
			 				"hjszd" : json.hjszd
			 			},
			 			type : "post",
			 			dataType:"JSON",
			 			success:function(data,textStatus) {
			 				if (data.flag== "0") {
			 					//修改成功判断是否有详细信息
			 					$.ajax({
						 			url : "http://221.8.52.247:8445/jit_crj/crj/WxRy/findRyxx.do",
						 			data : {
						 				"sfzh" : json.sfzh,
						 				"lxdh" :  sjhm
						 			},
						 			type : "post",
						 			dataType:"JSON",
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
			 					
			 					
			 				}else{
			 					alert('系统出错请稍后返回重试');
			 				}
			 			}
			 		});
				}
			}
			});
		//已绑定出入境大平台注册查询接口********end********
				}
				
				
				
				//已经进行绑定并已经通过认证查询返回标示提供前台查询是否有详细人员信息********start********
				else if(flag == '2') {
					//已经进行绑定并已经通过认证查询返回标示提供前台查询是否有详细人员信息
					$.ajax({
			 			url : "http://221.8.52.247:8445/jit_crj/crj/WxRy/findRyxx.do",
			 			data : {
			 				"sfzh" : data.wxryxx.sfzh,
			 				"lxdh" :  data.wxryxx.sjhm
			 			},
			 			type : "post",
			 			dataType:"JSON",
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
				//已经进行绑定并已经通过认证查询返回标示提供前台查询是否有详细人员信息********end********
			}
		});


});
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
        <h2 class="login_title">人员信息绑定</h2>
        <div class="center width font_size">系统检测到该微信公众号没有绑定人员信息请输入手机号码或者输入吉林"互联网+公安"综合服务平台已注册的手机号码</div>
        <div class="login_margin"> <input type="number" placeholder="请输入手机号码" name="sjhm" id="sjhm" class="login_input" /></div>
<!--         <div class="login_margin"> <input type="text" placeholder="请输入真实姓名" name="xm" id ="xm" class="login_input" /></div> -->
        <div><a href="javascript:void(0);" class="login_btn" onClick="submit();">绑定人员信息</a></div>
    </div>
</body>
</html>