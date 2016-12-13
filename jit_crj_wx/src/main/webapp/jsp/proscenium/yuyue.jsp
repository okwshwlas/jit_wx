<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="/WEB-INF/tld/c.tld" prefix="c"%>
<%
	String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
    //微信用户唯一标识
   String openid = request.getParameter("openid");
   String code = request.getParameter("code");
    String codes = request.getParameter("codes");

//hwl****satrt
   String longitude = request.getParameter("longitude");
   String latitude = request.getParameter("latitude");
   //hwl ****end
   //String openid = "123456";
%> 
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
    <meta name="format-detection" content="telephone=no,email=no,date=no,address=no">
    <title>快速预约</title>
        <script type="text/javascript">
var path= '<%=path%>';
var code='<%=code%>';
var codes='<%=codes%>';
var openid='<%=openid%>';
var basePath='<%=basePath%>';
</script>
    
    <script type="text/javascript" src="<%=basePath%>/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/jweixin-1.0.0.js"></script>
<script type="text/javascript" src="<%=basePath%>/jsp/proscenium/lib/Validform_v5.3.2/demo/js/Validform_v5.3.2.js"></script>
<script type="text/javascript" src="<%=basePath%>/jsp/proscenium/lib/layer-v2.1/layer/layer.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/cookie.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/aui-dialog.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/api.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/My97Date/WdatePicker.js" charset="utf-8"></script>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=KWe2TezxgWBDms0PYjeXBZWt"></script>
    <link href="css/aui.2.0.css" rel="stylesheet" type="text/css" />
    <style>
        html { background:#091e66 url("image/wrap_bg.png") no-repeat top left; background-size: 100%;}
        #login_wrap { position: relative; margin: 80px auto 50px; padding:40px 5%; width: 85%; background-color: rgba(255,255,255,0.8); border-radius: 5px;}
        .login_title { padding: 5% 0 10% 0; text-align: center; font-size: 0.9rem; color: #5e5e5d;}
        .login_input { width: 100%!important;; background-color: #fff!important; border-radius: 5px!important;; padding: 3%!important; }
        .login_margin { margin-bottom: 7%; position: relative;}
        .login_btn { display: block; width: 100%;padding: 3% 0; background-color: #359df6; border-radius: 5px; color: #fff; text-align: center;}
        .login_logo { position: absolute; top: -40px; left: 50%; margin-left: -40px;}
        .padding_top { padding-top: 0.7rem;}
        .delete_box { position: absolute; right: -10px; top: -6px;}
    </style>
    <script type="text/javascript" src="js/jquery.1.8.2.min.js"></script>
    <script type="text/javascript">
        function appendli()
        {
            var suibian ='  <div class="login_margin" id="id_main">';
            suibian =suibian + ' <input type="text" ype="number" name="number" placeholder="请输入身份证号码" class="login_input" />';
            suibian =suibian + '  <a href="#this" onclick="deleteRow(this)" class="delete_box"><img src="image/icon_close.png" alt="" width="24" height="24"  /></a>';
            suibian =suibian + '</div>';
            jQuery("#id_box").append(suibian);
            $("#tianjiatext").hide();
            $("#tianjia").hide();
        }
        function deleteRow(cor){
        	 $(cor).parents(".login_margin").remove();
             $("#tianjia").show();
             $("#tianjiatext").show();
        }
        
        
        var dialog = new auiDialog({});

    </script>
     <script type="text/javascript">
    
     
    
   //hwl ***start
     var longitude='<%=longitude%>';
     var latitude='<%=latitude%>';
     //hwl ***end
    

	// 初始化页面
	var strNum=0;
	var newlatitude = "43.872200";
	var newlongitude = "125.328480";
	var adr = "未获取到您的位置";
	var adrcs= "长春市";
	var adrxq= "";
	$(function() {
				navigator.geolocation.getCurrentPosition( // 该函数有如下三个参数
		            function(pos){ // 如果成果则执行该回调函数
//	 	                alert(
//	 	                    '  经度：' + pos.coords.latitude +
//	 	                    '  纬度：' + pos.coords.longitude
//	 	                );
		            	newlatitude = pos.coords.latitude+0.0072;
		            	newlongitude = pos.coords.longitude+0.013;
		            	map = new BMap.Map("allmap");
		            	var gc = new BMap.Geocoder();
		            	var pointA = new BMap.Point(newlongitude,newlatitude); 
 		                gc.getLocation(pointA, function(rs){
 		            		var addComp = rs.addressComponents;
 		            		/* var adr="位于: "+addComp.province + ", " + addComp.city + ", "
 		            			+ addComp.district + ", " + addComp.street + ", " + addComp.streetNumber; */
 		            		adr=addComp.district + addComp.street +  addComp.streetNumber+"附近"
							adrcs=addComp.city;
							adrxq=addComp.district;
 		            		//创建信息窗口，点击标注时显示标注对应的车牌号码以及当前地址 
 //		             		var infoWindow1 = new BMap.InfoWindow(adr);
 //		             		marker.addEventListener("click", function(){this.openInfoWindow(infoWindow1);});
 						});
		            }, function(err){ // 如果失败则执行该回调函数
		            	//alert("因为不能够获取到您的坐标，默认定位为长春市！");
		                //alert(err.message);
		            }, { // 附带参数
		                enableHighAccuracy: false, // 提高精度(耗费资源)
		                timeout: 5000, // 超过timeout则调用失败的回调函数
		                maximumAge: 1000 // 获取到的地理信息的有效期，超过有效期则重新获取一次位置信息
		            }
		        );
			
				
		if('null'!=code){
			var url = basePath + "/proscenium/crjRyjbxxController/weixin/Get_Openid.do?random=" + Math.random();
			var listParams = {
					"code" : code
		 	};
			$.ajaxSettings.async = false; 
			$.getJSON(url,listParams, function(json){
				if(json.code=="000000"){
					openid=json.data;
                  setCookie('openid',openid);
				  setCookie('code',code);
				}
			});
		}
		
		
	if('null'!=openid)	{
	var url = basePath + "/proscenium/crjRyjbxxController/weixin/WX_YuyueDate.do?random=" + Math.random();
	var listParams = {
			"openid" : openid
 	};

	
	$.ajaxSettings.async = false; 
	$.getJSON(url,listParams, function(json){
		if(json.code=="000002"){
		 dialog.alert({
	                   title:"提示",
	                    msg:json.msg,
	                  buttons:['确定']
	               },function(ret){
					window.location.href="wx_xxlb.jsp?openid="+openid+"&newlatitude="+newlatitude+"&newlongitude="+newlongitude+"&adr="+adr+"&adrcs="+adrcs;
	                })

			//alert(json.msg);
		//window.location.href="wx_xxlb.jsp?openid="+openid+"&newlatitude="+newlatitude+"&newlongitude="+newlongitude+"&adr="+adr+"&adrcs="+adrcs;
		}
		
	});
	}
	
	if('null'!=codes){
	var openids = getCookie('openid')
	var url = basePath + "/proscenium/crjRyjbxxController/weixin/WX_YuyueDate.do?random=" + Math.random();
	var listParams = {
			"openid" : openids
 	};

	
	$.ajaxSettings.async = false; 
	$.getJSON(url,listParams, function(json){
		if(json.code=="000002"){
		 dialog.alert({
	                   title:"提示",
	                    msg:json.msg,
	                  buttons:['确定']
	               },function(ret){
					window.location.href="wx_xxlb.jsp?openid="+openid+"&newlatitude="+newlatitude+"&newlongitude="+newlongitude+"&adr="+adr+"&adrcs="+adrcs;
	                })

			//alert(json.msg);
		//window.location.href="wx_xxlb.jsp?openid="+openid+"&newlatitude="+newlatitude+"&newlongitude="+newlongitude+"&adr="+adr+"&adrcs="+adrcs;
		}
		
	});
	
	
	
	
	
	
	
}
		

	});
//     function appendli()
//        {
//     	if(strNum==0){
    		
//     		strNum=strNum+1;
//     		 var suibian ='<dl class="id_main">';
//     			suibian =suibian + '<dt><img src="image/icon/ID_code.png" alt=""  width="20" height="20" /> <span style=" vertical-align:middle;">身份证号</span>';
//     			suibian =suibian + ' <a href="javascript:void(0);" class="delete_icon" onclick="deleteRow(this)"><img src="image/icon/delete_icon.png" alt="删 除" width="18" height="18" /></a></dt>';
//     			suibian =suibian + '<dd><input type="number" name="number" placeholder="请输入身份证号码"  class="input_sty"/></dd></dl>	';
//     	       jQuery("#id_box").append(suibian);
//     	       $("#add_box").slideUp();
//     	}else{
//     		dialet("您只能添加一个携行人！");
//     	}
//         }
// 	function deleteRow(cor){
// 		$("#add_box").slideDown();
// 		strNum=strNum-1;
// 	 	 $(cor).parents(".id_main").remove();
// 	  }
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
		var dhhm =document.getElementById("dhhm");
		if(dhhm.value==""){
			dialet("请输入电话号码！");
			return false;
		}else{
			var phonereg = /^(((13[0-9]{1})|(14[0-9]{1})|(17[0-9]{1})|(15[0-3]{1})|(15[5-9]{1})|(18[0-3]{1})|(18[5-9]{1}))+\d{8})$/;
			if(!phonereg.test(dhhm.value)){
				dialet("无效的电话号码！");
				//dhhm.addClass("border_color");
				return false;
			}
		}
		
		for (var i = 0, j = els.length; i < j; i++){
			
			
			 var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;  
			 if(els[i].value==""){
				 dialet("请您输入的身份证号！");
					return false;
				}else{
					if(!reg.test(els[i].value)){
						dialet("您输入的身份证号有误，请重新输入！");
						//els[i].addClass("border_color");
						
						return false;
					}
					str+=els[i].value+',';
				}
			 var urlsfzh = basePath + "/proscenium/crjRyjbxxController/weixin/PC_YuyueDate.do?random=" + Math.random();
				var listParams = {
						"sfzh" : els[0].value
			 	};
				$.ajaxSettings.async = false; 
				$.getJSON(urlsfzh,listParams, function(json){
					if(json.code=="000002"){
					 dialog.alert({
				                   title:"提示",
				                    msg:json.msg,
				                  buttons:['确定']
				               },function(ret){
				                })

					}
					
				});
		}
		
		
		//hwl *****stat
		//window.location.href="wx_ywxx.jsp?els="+str+"&openid="+openid+"&dhhm="+dhhm.value+"&adrxq="+adrxq+"&newlatitude="+newlatitude+"&newlongitude="+newlongitude+"&adr="+adr+"&adrcs="+adrcs+"&latitude="+latitude+"&longitude="+longitude;
		//hwl *****end
		//window.location.href="wx_ywxx.jsp?els="+str+"&openid="+openid+"&dhhm="+dhhm.value+"&adrxq="+adrxq+"&newlatitude="+newlatitude+"&newlongitude="+newlongitude+"&adr="+adr+"&adrcs="+adrcs;
	  }
	//安卓地部兼容
	window.onresize = function() {
        var top = $("#footer").offset().top;
        var user_message_box = $('#footer');
        top > 600 ? user_message_box.hide() : user_message_box.show();
    };
	 function dogo(){
    	location = "wx_xxlb.jsp?code="+code+"&openid="+openid;
    	
    	
    }
	 function dialet(str){
		 
		 dialog.alert({
	         title:"提示",
	          msg:str,
	        buttons:['确定']
	     },function(ret){
	      })
		 
		 
	 }
    </script>
</head>
<body>
    <div>
        <div class="aui-tab bg_opi" >
            <div class="aui-tab-item  aui-active font_size_16">快速预约</div>
            <div class="aui-tab-item font_size_16"  onclick="dogo()">预约查询</div>
        </div>
        <div id="login_wrap">
            <p class="login_logo"><img src="<%=basePath%>/jsp/proscenium/wxlv/image/login_logo.png" alt="" width="80"></p>
            <h2 class="login_title">快速预约</h2>
            <div id="id_box">
                <div class="login_margin"> <input type="number" placeholder="请输入手机号码" class="login_input"  name="dhhm" id="dhhm"/></div>
                <div class="login_margin"> <input type="text" placeholder="请输入身份证号码" class="login_input" name="number" /></div>
            </div>
            <div class="">
                <p class="aui-text-fff">可点击添加一位携行人进行快速预约</p>
                <p><div id="tianjia"  class="aui-btn aui-btn-primary aui-btn-block" onclick="appendli();">添加携行人</div></p>
                <p class="padding_top"><div class="aui-btn aui-btn-blue aui-btn-block" onClick="submit();">确 定</div></p>
            </div>
        </div>
    </div>
</body>
<script type="text/javascript" src="js/api.js"></script>
<script type="text/javascript" src="js/aui-tab.js"></script>
<script type="text/javascript">
    apiready = function(){
        api.parseTapmode();
    }
    var tab = new auiTab({
        element:document.getElementById("tab"),
        // callback:function(o,dom){
        //     console.log(o);
        // }
    },function(ret){
        console.log(ret)
    });
</script>
</html>