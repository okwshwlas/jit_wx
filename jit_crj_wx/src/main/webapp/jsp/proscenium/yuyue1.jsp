<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="/WEB-INF/tld/c.tld" prefix="c"%>
<%
	String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
    //微信用户唯一标识
   String openid = request.getParameter("openid");
   //String openid = "123456";
    System.out.println(openid);
%> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"/>
<script type="text/javascript">
var path= '<%=path%>';
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
	<link href="<%=basePath%>/jsp/proscenium/style/default.css" rel="stylesheet" type="text/css" />
	<style type="text/css">
	body, html,#allmap {width: 100%;height: 100%;overflow: hidden;margin:0;font-family:"微软雅黑";}
	</style>
    <link href="<%=basePath%>/jsp/proscenium/style/contents.css" type="text/css"  rel="stylesheet"  />
	<script>var basePath= "<%=basePath%>";</script>
	<script>var sqid = "2200";</script>
    <script type="text/javascript">
    
    
    
    wx.getLocation({
        type: 'wgs84', // 默认为wgs84的gps坐标，如果要返回直接给openLocation用的火星坐标，可传入'gcj02'
        success: function (res) {
            var latitude = res.latitude; // 纬度，浮点数，范围为90 ~ -90
            var longitude = res.longitude; // 经度，浮点数，范围为180 ~ -180。
            var speed = res.speed; // 速度，以米/每秒计
            var accuracy = res.accuracy; // 位置精度
            
            alert(latitude);
        }
    });
    
    

	// 初始化页面
	var strNum=0;
	$(function() {
	var url = basePath + "/proscenium/crjRyjbxxController/weixin/WX_YuyueDate.do?random=" + Math.random();
	var listParams = {
			"openid" : openid
 	};
	
	$.ajaxSettings.async = false; 
	$.getJSON(url,listParams, function(json){
		if(json.code=="000002"){

			alert(json.msg);
			window.location.href="wx_xxlb.jsp?openid="+openid;
		}
		
	});
	});
    function appendli()
       {
    	if(strNum==0){
    		strNum=strNum+1;
    		 var suibian ='<dl class="id_main">';
    			suibian =suibian + '<dt><img src="image/icon/ID_code.png" alt=""  width="20" height="20" /> <span style=" vertical-align:middle;">身份证号</span>';
    			suibian =suibian + ' <a href="javascript:void(0);" class="delete_icon" onclick="deleteRow(this)"><img src="image/icon/delete_icon.png" alt="删 除" width="18" height="18" /></a></dt>';
    			suibian =suibian + '<dd><input type="number" name="number" placeholder="请输入身份证号码"  class="input_sty"/></dd></dl>	';
    	       jQuery("#id_box").append(suibian);
    	}else{
    		alert("您只能添加一个携行人！");
    	}
        }
	function deleteRow(cor){
		strNum==0;
	 	 $(cor).parents(".id_main").remove();
	  }
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
		var els =document.getElementsByName("number");
		var str ='';
		var dhhm =document.getElementById("dhhm").value;
		
		
		for (var i = 0, j = els.length; i < j; i++){
			
			
			 var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;  
			 alert(reg.test(els[i].value));
				if(!reg.test(els[i].value)){
					alert("您输入的身份证号有误，请重新输入！");
					return false;
				}
			str+=els[i].value+',';
		}
		if(dhhm==""){
			alert("请输入电话号码！");
			
		}else{
			var phonereg = /^(((13[0-9]{1})|(14[0-9]{1})|(17[0-9]{1})|(15[0-3]{1})|(15[5-9]{1})|(18[0-3]{1})|(18[5-9]{1}))+\d{8})$/;
			if(!phonereg.test(dhhm)){
				alert("无效的电话号码！");
				return false;
			}
		}
		window.location.href="dutuyy.jsp?els="+str+"&openid="+openid+"&dhhm="+dhhm;
	  }
    </script>
</head>
<body>
	<div id="wrap">
    	<header id="header">预约申请</header>
        <section id="section">
        	<div id="id_box">
            	<dl class="id_main">
                	<dt>
                    	<img src="image/icon/ID_code.png" alt=""  width="20" height="20" />
                        <span style=" vertical-align:middle;">手机号码</span>
                   	</dt>
                    <dd>
                    <input type="number" name="dhhm" id="dhhm" placeholder="请输入手机号码"  class="input_sty"/>
                   </dd>
                    <dt>
                    	<img src="image/icon/ID_code.png" alt=""  width="20" height="20" />
                        <span style=" vertical-align:middle;">身份证号</span>
                       
                   	</dt>
                    <dd>
                    <input type="number" name="number" placeholder="请输入身份证号码"  class="input_sty"/>
                    <input type="hidden" name="number_hidden" placeholder="请输入身份证号码"  class="input_sty"/>
                    </dd>
                </dl>
            </div>
        </section>
        <section style="position:fixed; bottom:20px; left:0; width:100%;">
        	<div class="add_box"><a href="javascript:void(0);" onClick="appendli();"><img src="image/icon/add_btn.png" alt=""  width="50" height="50"/><span style="display:block; line-height:30px;">添加协行人</span></a></div>
            <div><a href="javascript:void(0);" class="btn_confirm" onClick="submit();">确 定</a></div>
        </section>
    </div>
</body>
</html>