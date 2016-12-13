<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="/WEB-INF/tld/c.tld" prefix="c"%>
<%
	String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
    //微信用户唯一标识
    String openid = request.getParameter("openid");
    String els = request.getParameter("els");
    String code = request.getParameter("code");
    //String openid = "123456";
%> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"/>
<title>服务机构导航</title>
    <link href="<%=basePath%>/jsp/proscenium/style/default.css" rel="stylesheet" type="text/css" />
    <link href="<%=basePath%>/jsp/proscenium/style/contents.css" type="text/css"  rel="stylesheet"  />
    <script type="text/javascript" src="js/jquery.1.8.2.min.js"></script> 
    <script type="text/javascript" src="<%=basePath%>/jsp/proscenium/js/cookie.js"></script> 
    <script type="text/javascript">
var path= '<%=path%>';
var openid='<%=openid%>';
var code='<%=code%>';
var els='<%=els%>';
var basePath='<%=basePath%>';

function time_box() {
	var url  = "dhwx_tsxx.jsp";
	window.location.href = url;
}

</script> 
</head>
  <script type="text/javascript">

	// 初始化页面
	$(function() {
		if('null'!=code){
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
		}else{
			
			code=getCookie('code');
			
		}
		if('null'==openid ||null==openid){
			
			openid =getCookie('openid');
		}
		if('null'==openid ||null==openid){
			alert("您的微信认证已失效，请重新进入！");
		}else{
			var url = basePath + "/proscenium/crjRyjbxxController/weixin/WX_Yuyue.do?random=" + Math.random();
			var listParams = {
					"openid" : openid
		 	};
			$.ajaxSettings.async = false; 
			$.getJSON(url,listParams, function(json){
				if(json.code=="000002"){

					alert(json.msg);
					location ="yuyue.jsp?code="+code+"&openid="+openid;
				}else{
					var str="";
					str+='<ul class="lise_box">';
					$.each(json.data, function(i,result) {
						str+='<li><span>' +  result.yywd + '</span><span>' +  result.yysj + '</span><a href="javascript:void(0);" class="btn_appoin" onClick="time_box(\'' +  result.yybhs + '\');">查看详情</a></li>';
					});	
					str+='</ul>';
					$('#lise_box').html(str);
				}
			});
		}
	
	
	});
	function time_box(yybhs){
		window.location.href="dhwx_tsxx.jsp?openid="+openid+"&Strid="+yybhs;
	  }
	function submit(){
		window.location.href="dhyuyue.jsp?openid="+openid;
	  }
	function dh(){
		window.location.href="dutuyy.jsp";
	  }
	function dogo(){
		
		location = 'dhyuyue.jsp?code='+code;
		
	}
	</script>
<body>
	<div id="wrap">
        <div class="aui-tab bg_opi" >
            <div class="aui-tab-item font_size_16 aui-active">预约查询</div>
        </div>
    	
        <section id="" style="padding-bottom:65px;">
             <!-- 列表 -->
             <div class="list_wrap" id="lise_box">
             <!-- 	<ul class="lise_box">
                	<li><span>长春市出入境管理局南关区分局</span><span> 2016-4-20 9:00-10:00</span><a href="javascript:void(0);" class="btn_appoin" onClick="time_box();">已过期</a></li>
                    <li><span>长春市出入境管理局办证大厅</span><span> 2016-4-21 10:30-11:30</span><a href="javascript:void(0);" class="btn_appoin" onClick="time_box();">已过期</a></li>
                    <li><span>长春市出入境管理局南关区分局</span><span> 2016-4-22 13:00-14:00</span><a href="javascript:void(0);" class="btn_appoin" onClick="time_box();">查看详情</a></li>
                    
                </ul> -->
             </div>
        </section>
        <section style="">
          <!-- <div style="width:100%; text-align:center;"><a href="javascript:void(0);" class="btn_confirm btn_width" onClick="submit();">再次预约</a></div> -->
            <div style="width:100%; text-align:center;"><a href="javascript:void(0);" class="btn_confirm btn_width" onClick="dh();">返回机构导航</a></div>
        </section>
        
    </div>
</body>
</html>