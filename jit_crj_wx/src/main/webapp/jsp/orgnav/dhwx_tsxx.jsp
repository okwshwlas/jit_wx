<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="/WEB-INF/tld/c.tld" prefix="c"%>
<%
	String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
    //微信用户唯一标识
    String openid = request.getParameter("openid");
    String els = request.getParameter("els");
    String Strid = request.getParameter("Strid");
    //String openid = "123456";
%> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"/>


<title>服务机构导航</title>
    <link href="style/default.css" rel="stylesheet" type="text/css" />
    <link href="style/contents.css" type="text/css"  rel="stylesheet"  />
    <script type="text/javascript" src="<%=basePath%>/jsp/proscenium/js/jquery.1.8.2.min.js"></script>
</head>
<script type="text/javascript">
var path= '<%=path%>';
var openid='<%=openid%>';
var els='<%=els%>';
var Strid='<%=Strid%>';
var basePath='<%=basePath%>';
// 初始化页面
$(function() {
	var url = basePath + "/proscenium/crjRyjbxxController/weixin/WX_Yuyuexangxi.do?random=" + Math.random();
	var listParams = {
			"openid" : openid,
			"Strid" : Strid
 	};
	
	$.ajaxSettings.async = false; 
	$.getJSON(url,listParams, function(json){
		
		var str="";
		var num =0;
		$.each(json.data.jblist, function(i,result) {
		str+='<h2 class="succe_tit">预约信息</h2><ul class="succe_main"><li>';
		str+='<p class="li_p"><span>预约时间：</span>' +  result.dhhm + '</p>';
		str+='<p class="li_p1"><span>网点：</span>' +  result.yywd + '</p>';
		str+='<p class="li_p1"><span>网点地址：</span>' +  result.yywddz + '</p></li>';
		});	
		$.each(json.data.list, function(i,result) {
			num++;
			str+='<li><p><span>身份证号：</span>' +  result.sfzh + '</p>';
			str+='<p><span>预约编号：</span>' +  result.yycode + '</p>';
			str+='<a href="javascript:void(0);" class="btn_appoin btn_cancel" onClick="time_box(\'' +  result.yyId + '\',\'' +  result.yysjId + '\');">取消预约</a></li>';
            
		});	
		if(getCookie('flag') == '1'&&num!=0){
			str+='<p><span  style="color:red">请携带身份证和签注相关材料准时到网点进行办理</span>';
			str+='<a href="javascript:void(0);"  onClick="looktsxx()">查看签注相关材料</a>';
			str+='</p>'
		}else if(num!=0){
			str+='<p><span  style="color:red">请携带身份证准时到网点进行办理</span></p>';
		}
		if(num ==0){
			str+='<a href="javascript:void(0);" class="btn_appoin btn_cancel">已取消</a>';
			
		}
		
// 		str+='<p><span  style="color:red">请携带相关证件准时到网点进行办理</span></p>';
// 		str+='<a href="javascript:void(0);" class="btn_appoin btn_cancel" onClick="time_box(\'' +  result.yyId + '\',\'' +  result.yysjId + '\');">查看业务所需材料</a>';
		str+='</ul><div style="width:50%; margin:0px auto; padding:15px 0;"><a href="javascript:void(0);" onclick="CloseWebPage();" class="btn_confirm btn_width">返回机构导航</a></div>';
		/* if(getCookie('longitude')!=null&&getCookie('newlongitude')!=null){
		str+='<div style="width:50%; margin:0px auto; padding:15px 0;"><a href="javascript:void(0);" onclick="goto();" class="btn_confirm btn_width">到这里去</a></div>';
		} */
		
		
		$('#succe_box').html(str);
	});
	});
function CloseWebPage(){
	window.location.href="dutuyy.jsp"
	}
	function goto(){
	alert(getCookie('longitude'))
	var longitude = getCookie('longitude');
	var latitude = getCookie('latitude');
	var newlongitude = getCookie('newlongitude');
	var newlatitude = getCookie('newlatitude');
	window.location.href="jclx.jsp?longitude="+longitude+"&latitude="+latitude+"&newlongitude="+newlongitude+"&newlatitude="+newlatitude;
	}
function time_box(yyId,yysjId) {
	var url = basePath + "/proscenium/crjRyjbxxController/yuYue/updYuYueByWorktime.do?random=" + Math.random();
	var listParams = {
			"yyId" : yyId,
			"yysjId" : yysjId
 	};
	
	$.ajaxSettings.async = false; 
	$.getJSON(url,listParams, function(json){
		
	});
	var url  = "dhwx_tsxx.jsp?Strid="+Strid+"&openid="+openid;
	window.location.href = url;
}
function getCookie(name)
{
var arr,reg=new RegExp("(^| )"+name+"=([^;]*)(;|$)");
if(arr=document.cookie.match(reg))
return unescape(arr[2]);
else
return null;
}
function looktsxx(){
	
	location ="cailiaots.jsp?Strid="+Strid+"&openid="+openid;
}
</script>
<body>
	<div id="wrap">
    	 <div class="succe_box" id="succe_box">
         	
         </div>
    </div>
</body>
</html>