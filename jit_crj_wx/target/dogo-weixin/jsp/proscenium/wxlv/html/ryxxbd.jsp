<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="/WEB-INF/tld/c.tld" prefix="c"%>
<%
	String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
    //微信用户唯一标识
   String openid = request.getParameter("openid");
   String code = request.getParameter("code");
    openid = "33333";
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
		<script type="text/javascript" src="<%=basePath%>/jsp/proscenium/wxlv/js/token.js"></script>
		<script type="text/javascript" src="<%=basePath%>/jsp/proscenium/wxlv/js/zhuce.js"></script>
		<script type="text/javascript" src="<%=basePath%>/jsp/proscenium/wxlv/js/bdryxx.js"></script>
		<script type="text/javascript" src="<%=basePath%>/jsp/proscenium/wxlv/js/smrz.js"></script>
	<script type="text/javascript">
     var path= '<%=path%>';
     var openid='<%=openid%>';
     var basePath='<%=basePath%>';
     var code='<%=code%>';
     //接口地址HOSt
     var host ='';
     var userguid='';
     var token;
     var tokenTime;
     var idCard;
     var hjszd;
		//户口所在地派出所
		 var belongAddr;
		//户口所在地code UserHjPcsCode截取前6位未户口所在地行政区划
		 var belongAddrCode;
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
// 	$.ajax({
// 			url : "http://127.0.0.1:8445/jit_crj/crj/WxRy/findWxryxx.do",
			
// 			data : {
// 				"openid" : openid
// 			},
// 			type : "post",
// 			dataType:"JSON",
// 			success:function(data,textStatus) {
// 				var flag = data.flag;
// 				if (flag== "0") {
// 					//根据openid没有查询到对应人员信息
					
					
					
					
// 				}else if(flag== "3"){
// 					location="kind_business.jsp";
			
// 				}else {
// // 					location="personal_info.jsp";
// 				}
// 			}
// 		});
	token = getToken();
	setCookie('token',token);
	if(token !=false){
		tokenTime(token);
	}
	


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
// 		var els =$('#sfzh').val();
		var str ='';
		var sjhm =$('#sjhm').val();
		var xm =$('#xm').val();
		if(sjhm==""){
			alert("请输入电话号码！");
			return false;
		}else{
			var phonereg = /^(((13[0-9]{1})|(14[0-9]{1})|(17[0-9]{1})|(15[0-3]{1})|(15[5-9]{1})|(18[0-3]{1})|(18[5-9]{1}))+\d{8})$/;
			if(!phonereg.test(sjhm)){
				alert("无效的电话号码！");
				//dhhm.addClass("border_color");
				return false;
			}
		}
		//大平台查询是否已经注册接口。如果已经注册成功未认证跳到认证页面（保存openid和sjhm到信息表中）。已经认证（保存身份证信息和户籍信息，手机号码到信息表中 ）
		$.ajax({
			url :"http://127.0.0.1:8445/jit_crj/crj/WxRy/WxryxxSave.do",
			data : {
				"sjhm" : sjhm,
				"openid":openid
			},
			type : "post",
			dataType:"JSON",
			success:function(data) {
// 				address String 地址
// 				aliasName String 真实姓名
// 				dateCreated String 创建时间
// 				guid String 用户guid 主键
// 				identityStatus String 实名认证 0:暂未认证，1:认证通过，­9,认证不通过
// 				openid String 微信openid
// 				userName String 用户账号及手机号
// 				userType String 用户类型 0：企业用户      1：个人用户
// 				idCard String 身份证号

				var flag = data.flag;
				var code= data.code;
				var succ= data.succ;
				//没有绑定出入境微信公众号*********satrt*************
				if(flag =='0'){
					//没有查询到人员信息需要大平台查询是否注册和认证
					var zhuce_data = checkZhuce(sjhm,token);
					//已经注册了
					if(zhuce_data !=false){
						//通过实名认证
						if(zhuce_data.identityStatus == '1'){
							var idCard = zhuce_data.idCard;
							//接口暂未提供
							var hjszd = '220000';
							//出入境微信人员信息进行修改并查询是否有详细信息  ****start*****
						$.ajax({
			             url :"http://127.0.0.1:8445/jit_crj/crj/WxRy/WxryxxUpdate.do",
			             data : {
				         "sfzh" : idCard,
				          "openid":openid,
				          "hjszd":hjszd
			                    },
			             type : "post",
			             dataType:"JSON",
			             success:function(data) {
			            	 var flag = data.flag;
			            	 if(flag == '1'){
			            		 
			            		 alert('绑定个人信息成功');
			            		 //查询是否有详细信息 *******start
			            		 $.ajax({
			 			 			url : "http://127.0.0.1:8445/jit_crj/crj/WxRy/findRyxx.do",
			 			 			
			 			 			data : {
			 			 				"sfzh" : idCard,
			 			 				"lxdh" : ''
			 			 			},
			 			 			type : "post",
			 			 			dataType:"JSON",
			 			// 			jsonp: "callback",//传递给请求处理程序或页面的，用以获得jsonp回调函数名的参数名(一般默认为:callback)
			 			// 	        jsonpCallback:"flightHandler",//自定义的jsonp回调函数名称，默认为jQuery自动生成的随机函数名，也可以写"?"，jQuery会自动为你处理数据
			 			 			success:function(data,textStatus) {
			 			 				if (data.flag== "0") {
			 			 					//查询出错
			 			 				}else if(data.flag== "3"){
			 			 					alert('系统检测到你已经注册并通过实名认证');
			 			 					location="kind_business.jsp";
			 							
			 			 				}else {
			 			 					alert('系统检测到你已经注册并通过实名认证,但没有补全详细信息,请进行补全信息');
			 			 					location="personal_info.jsp?idCard="+idCard+"&hjszd="+hjszd;
			 			 				}
			 			 			}
			 			 		});
			            		 
			            		 
			            		//查询是否有详细信息 *******end****** 
			            		 
			             }else{
			            	 alert('绑定个人信息失败');
			            	 //重新进行绑定
			             }
			             }
				
				
				
					})
					
					
					//出入境微信人员信息进行修改并查询是否有详细信息  ****end*****
						}
					
					
				}
					//未注册
                     else{
                    	 alert('系统检测到您尚未注册，请先注册');
                    	 //未注册的先绑定出入境微信 在进行注册和实名认证
// 						bdyrxx(openid,sjhm);
						location = "zhuce.jsp?openid="+openid
						
					}
				}
				//没有绑定出入境微信公众号*********end*************
				
				
				//已经与出入境微信号绑定了 但是无身份证号码 需认证*********satrt*************
					else if(flag =='1'){
						//没有查询到人员信息需要大平台查询是否注册和认证
						var zhuce_data = checkZhuce(sjhm,token);
						//已经注册了
						if(zhuce_data !=false ){
							//通过实名认证
							if(zhuce_data.identityStatus == '1'){
								
								 idCard = zhuce_data.idCard;
								//接口暂未提供
								 hjszd = '220000';
								//户口所在地派出所
								 belongAddr =zhuce_data.belongAddr;
								//户口所在地code UserHjPcsCode截取前6位未户口所在地行政区划
								 belongAddrCode = zhuce_data.belongAddrCode;
								//出入境微信人员信息进行修改并查询是否有详细信息  ****start*****
							$.ajax({
				             url :"http://127.0.0.1:8445/jit_crj/crj/WxRy/WxryxxUpdate.do",
				             data : {
					         "sfzh" : idCard,
					          "openid":openid,
					          "UserHjPcsCode":belongAddrCode
				                    },
				             type : "post",
				             async:false,
				             dataType:"JSON",
				             success:function(data) {
				            	
				            	 var flag = data.flag;
				            	 if(flag == '1'){
				            		 
				            		 alert('绑定个人信息成功');
				            		 //查询是否有详细信息 *******start
				            		 $.ajax({
				 			 			url : "http://221.8.52.247:8445/jit_crj/crj/WxRy/findRyxx.do",
				 			 			
				 			 			data : {
				 			 				"sfzh" : idCard,
				 			 				"lxdh" : ''
				 			 			},
				 			 			type : "post",
				 			 			dataType:"JSON",
				 			// 			jsonp: "callback",//传递给请求处理程序或页面的，用以获得jsonp回调函数名的参数名(一般默认为:callback)
				 			// 	        jsonpCallback:"flightHandler",//自定义的jsonp回调函数名称，默认为jQuery自动生成的随机函数名，也可以写"?"，jQuery会自动为你处理数据
				 			 			success:function(data,textStatus) {
				 			 				if (data.flag== "0") {
				 			 					//查询出错
				 			 				}else if(data.flag== "3"){
				 			 					alert('系统检测到你已经注册并通过实名认证');
				 			 					location="kind_business.jsp";
				 							
				 			 				}else {
				 			 					alert('系统检测到你已经注册并通过实名认证,但没有补全详细信息,请进行补全信息');
				 			 					location="personal_info.jsp?idCard="+idCard+"&hjszd="+belongAddrCode;
				 			 				}
				 			 			}
				 			 		});
				            		 
				            		 
				            		//查询是否有详细信息 *******end****** 
				            		 
				             }else{
				            	 alert('绑定个人信息失败');
				            	 //重新进行绑定
				             }
				             }
					
					
					
						})
						
						
						//出入境微信人员信息进行修改并查询是否有详细信息  ****end*****
							}else{
								//进行实名认证
								alert('进行实名认证');
								location = 'renzheng.jsp';
								
								
							}
						
						
					}
						//未注册
	                     else{
	                    	 alert('系统检测该手机号码未进行注册请先注册');
							location = "zhuce.jsp?openid="+openid+"&sjhm="+sjhm;
							
						}	
							
						
					
// 					location = "renzheng.jsp?sjhm="+sjhm;
					
					
				}
				
				
				//已经与出入境微信号绑定了 但是无身份证号码 需认证*********end *************
				
				
				
				//已经进行绑定并已经通过认证查询返回标示提供前台查询是否有详细人员信息********satrt***
					else if(flag =='2'){
					
						 //查询是否有详细信息 *******start*******
	            		 $.ajax({
	 			 			url : "http://221.8.52.247:8445/jit_crj/crj/WxRy/findRyxx.do",
	 			 			data : {
	 			 				"sfzh" : idCard,
	 			 				"lxdh" : ''
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
	            		 
	            		 
	            		//查询是否有详细信息 *******end****** 
					
					
				}
				
				//已经进行绑定并已经通过认证查询返回标示提供前台查询是否有详细人员信息********end ***

		}
		})
	}

	
	
	
	//安卓地部兼容
	
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