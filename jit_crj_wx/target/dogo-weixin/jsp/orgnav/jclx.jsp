<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="/WEB-INF/tld/c.tld" prefix="c"%>
<%
	String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
    //微信用户唯一标识
    String longitude = request.getParameter("longitude");//精度
    String latitude = request.getParameter("latitude");//纬度
	String newlongitude = request.getParameter("newlongitude");//精度
    String newlatitude = request.getParameter("newlatitude");//纬度
%> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" /><title>吉林省公安出入境微信平台</title>
<link href="<%=basePath%>/jsp/orgnav/style/default_1.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/jsp/proscenium/lib/layer-v2.1/layer/layer.js"></script>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=KWe2TezxgWBDms0PYjeXBZWt"></script>
<link href="<%=basePath%>/jsp/orgnav/style/contents_1.css" type="text/css"  rel="stylesheet"  />
<style type="text/css">
body, html,#allmap {width: 100%;height: 100%;overflow: hidden;margin:0;font-family:"微软雅黑";}
</style>
 <style>
     html { height: 100%; width: 100%; font-family: 'Heiti SC', 'Microsoft YaHei'; font-size: 100px; outline: 0; -webkit-text-size-adjust:none;}
     body { height: 100%; margin: 0; -webkit-user-select: none; position: relative;}
 </style>

</head>
<body>
	<div style="max-width: 640px;">
        <div class="ck_header_top">
            <a href="javascript:void(0);" class="ck_header_return" onclick="javascript:returnPage()"></a>
            <ul class="ck_header_nav">
                <li class="bg_open" onclick="qhmodel(1)">
                    <a href="#this"><img src="./image/bus_icon_open.png" /> <span>公交路线</span></a>
                    <p class="li_time"><span id="gj_plan_time"></span> <span id="gj_plan_len"></span></p>
                </li>
                <li onclick="qhmodel(2)">
                    <a href="#this"><img src="./image/driving_icon_open.png" /> <span>驾车路线</span></a>
                    <p class="li_time"><span id="jc_plan_time"></span> <span id="jc_plan_len"></span></p>
                </li>
            </ul>
        </div>
    </div>
	<div id="allmap"></div>
	<div id="jcallmap" style="display:none;"></div>
</body>
<script type="text/javascript">

      //设置初使用页面样式 rem
     (function (doc, win) {
         var docEl = doc.documentElement,
                 resizeEvt = 'orientationchange' in window ? 'orientationchange' : 'resize',
                 recalc = function () {
                     var clientWidth = docEl.clientWidth;
                     if (!clientWidth) return;
                     docEl.style.fontSize = 100 * (clientWidth / 640) + 'px';
                 };
         if (!doc.addEventListener) return;
         win.addEventListener(resizeEvt, recalc, false);
         doc.addEventListener('DOMContentLoaded', recalc, false);
     })(document, window);
     //选择出行路线，点击效果
     $(document).ready(function(){
         $(".ck_header_nav li").click(function(){
             $(".ck_header_nav li").removeClass('bg_open');
             $(".ck_header_nav li").find('a').css('color','#767e89');
             $(this).addClass('bg_open');
             $(this).find('a').css('color','#4186fe');
         });
         qhmodel(1);//1：公交 2：驾车  默认公交
     });
     function returnPage(){
    	 window.location.href="./dutuyy.jsp?count=0&newlatitude=43.872200&newlongitude=125.328480";
     }
     function qhmodel(model){
   		var map = new BMap.Map("allmap");            // 创建Map实例
  	   	map.centerAndZoom(new BMap.Point(<%=longitude%>,<%=latitude%>), 11);
  	 	var p1 = new BMap.Point(<%=newlongitude%>,<%=newlatitude%>);
  	   	var p2 = new BMap.Point(<%=longitude%>,<%=latitude%>);
     	if(model==1){
     		
      		/**	driving.search(p1, p2);**/
      	   	
     	    var transitSearchComplete = function (results){
    			if (transit.getStatus() != BMAP_STATUS_SUCCESS){
    				return ;
    			}
    				var plan = results.getPlan(0);
    				if(typeof plan == 'undefined'){
    					$("#gj_plan_time").html("无");
    				}else{
    					$("#gj_plan_time").html(plan.getDuration(true));//获取时间
        				$("#gj_plan_len").html(plan.getDistance(true));//获取距离
    				}
    	   };
     	   var transit = new BMap.TransitRoute(map, {renderOptions: {map: map},
     			onSearchComplete: transitSearchComplete,
     			onPolylinesSet: function(){        
     				setTimeout(function(){},"1000");
    		}});
     		
     		transit.search(p1, p2);
			var map = new BMap.Map("jcallmap");            // 创建Map实例
			map.centerAndZoom(new BMap.Point(<%=longitude%>,<%=latitude%>), 11);
			var p1 = new BMap.Point(<%=newlongitude%>,<%=newlatitude%>);
			var p2 = new BMap.Point(<%=longitude%>,<%=latitude%>);
     		 var drivingSearchComplete = function (results){
       			if (driving.getStatus() != BMAP_STATUS_SUCCESS){
       				return ;
       			}
       				var plan = results.getPlan(0);
       				$("#jc_plan_time").html(plan.getDuration(true));//获取时间
       				$("#jc_plan_len").html(plan.getDistance(true));//获取距离
       		};
      		var driving = new BMap.DrivingRoute(map, {renderOptions: {map: map},
 	    			onSearchComplete: drivingSearchComplete,
 	    			onPolylinesSet: function(){        
 	    				setTimeout(function(){},"1000");
 	   		}});
			driving.search(p1, p2);
     	}else{
     	    var drivingSearchComplete = function (results){
      			if (driving.getStatus() != BMAP_STATUS_SUCCESS){
      				return ;
      			}
      				var plan = results.getPlan(0);
      				$("#jc_plan_time").html(plan.getDuration(true));//获取时间
      				$("#jc_plan_len").html(plan.getDistance(true));//获取距离
      		};
     		var driving = new BMap.DrivingRoute(map, {renderOptions: {map: map},
	    			onSearchComplete: drivingSearchComplete,
	    			onPolylinesSet: function(){        
	    				setTimeout(function(){},"1000");
	   		}});
     	   	driving.search(p1, p2);
     	}
     }
</script>
</html>