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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"/>
<script type="text/javascript">
var path= '<%=path%>';
var code='<%=code%>';
var openid='<%=openid%>';
var basePath='<%=basePath%>';
</script>
<title>吉林省公安出入境微信平台</title>
<link href="<%=basePath%>/jsp/proscenium/lib/style/default.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>/jsp/proscenium/lib/style/index3.css">
<link rel="stylesheet" href="<%=basePath%>/jsp/proscenium/lib/Validform_v5.3.2/demo/css/style.css" type="text/css" media="all" />
<script type="text/javascript" src="<%=basePath%>/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/jweixin-1.0.0.js"></script>
<script type="text/javascript" src="<%=basePath%>/jsp/proscenium/lib/Validform_v5.3.2/demo/js/Validform_v5.3.2.js"></script>
<script type="text/javascript" src="<%=basePath%>/jsp/proscenium/lib/layer-v2.1/layer/layer.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/My97Date/WdatePicker.js" charset="utf-8"></script>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=KWe2TezxgWBDms0PYjeXBZWt"></script>
	<script type="text/javascript" src="<%=basePath%>/jsp/proscenium/wxlv/js/cookie.js"></script>
	<link href="<%=basePath%>/jsp/proscenium/style/default.css" rel="stylesheet" type="text/css" />
	<style type="text/css">
	body, html,#allmap {width: 100%;height: 100%;overflow: hidden;margin:0;font-family:"微软雅黑";}
	</style>
    <link href="<%=basePath%>/jsp/proscenium/style/contents.css" type="text/css"  rel="stylesheet"  />
	<script>var basePath= "<%=basePath%>";</script>
	<script>var sqid = "2200";</script>
    <script type="text/javascript">
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
		
		
		$.ajax({
			url : "http://192.168.1.113:8445/jit_crj/crj/WxRy/findZj.do",
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
				setCookie('gatxz',gatxz);
				setCookie('twtxz',twtxz);
				if(gatxz =='0' && twtxz =='0' ){
					alert('对应身份证下不存在往来港澳通行证和台湾通行证，请申请后继续办理');
				}else{
					$.ajax({
			 			url : "http://192.168.1.113:8445/jit_crj/crj/WxRy/findRyxx.do",
			 			
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
			 					//有详细人员信息跳转到办理页面
							
			 				}else {
			 					location="complete_regist.jsp";
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
	<div id="wrap">
    	<header id="header">全流程:个人旅游签注</header>
        <section id="section">
        	<div id="id_box">
            	<dl class="id_main">
                	<dt>
                    	<img src="../image/icon/icon_tel.png" alt=""  width="13" height="16" />
                        <span style=" vertical-align:middle;">手机号码</span>
                   	</dt>
                    <dd>
                    <input type="text" name="dhhm" id="lxdh" placeholder="请输入手机号码" class="input_sty" />
                   </dd>
                    <dt>
                    	<img src="../image/icon/ID_code.png" alt=""  width="20" height="20" />
                        <span style=" vertical-align:middle;">身份证号</span>
                       
                   	</dt>
                    <dd>
                    <input type="text" name="number" id ="sfzh" placeholder="请输入身份证号码"  class="input_sty"/>
                    </dd>
                </dl>
            </div>
        </section>
        <section id="footer">
            <div style="width:100%; text-align:center; padding-top:15px;"><a href="javascript:void(0);" class="btn_confirm btn_width" onClick="submit();">确 定</a></div>
        </section>
    </div>
</body>
</html>