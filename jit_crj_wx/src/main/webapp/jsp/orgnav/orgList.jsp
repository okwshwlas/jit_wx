<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="/WEB-INF/tld/c.tld" prefix="c"%>
<%
	String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
    //微信用户唯一标识
    String openid = request.getParameter("openid");
    //String openid = "123456";
     String newlatitude = request.getParameter("newlatitude");
     String newlongitude = request.getParameter("newlongitude");
     String sjdz = request.getParameter("adrcs");
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
		var newlatitude = '<%=newlatitude%>';
		var newlongitude ='<%=newlongitude%>';
		var sjdz='<%=sjdz%>';
	</script>
	<title>吉林省公安出入境微信平台</title>
	<link href="<%=basePath%>/jsp/proscenium/lib/style/default.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="<%=basePath%>/jsp/proscenium/lib/style/index3.css">
	<link rel="stylesheet" href="<%=basePath%>/jsp/proscenium/lib/Validform_v5.3.2/demo/css/style.css" type="text/css" media="all" />
	<script type="text/javascript" src="<%=basePath%>/js/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>/jsp/proscenium/lib/Validform_v5.3.2/demo/js/Validform_v5.3.2.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/My97Date/WdatePicker.js" charset="utf-8"></script>
	<script type="text/javascript" src="<%=basePath%>/jsp/proscenium/lib/layer-v2.1/layer/layer.js"></script>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=KWe2TezxgWBDms0PYjeXBZWt"></script>
	<link href="<%=basePath%>/jsp/proscenium/style/contents.css" type="text/css"  rel="stylesheet"  />
	<link href="<%=basePath%>/jsp/proscenium/style/loadding.css" type="text/css"  rel="stylesheet"  />
    <link href="<%=basePath%>/jsp/proscenium/style/contents.css" type="text/css"  rel="stylesheet"  />
	<script>var sqid = "2200";</script>
		<script type="text/javascript">
		var sls_qj="22010000";
		var slx_qj="";
		var slx_name="";
		// 初始化页面
		$(function() {
			/* navigator.geolocation.getCurrentPosition( // 该函数有如下三个参数
				function(pos){ // 如果成果则执行该回调函数
					newlatitude = pos.coords.latitude+0.0072;
					newlongitude = pos.coords.longitude+0.013;				
				}, function(err){ // 如果失败则执行该回调函数
					alert("因为不能够获取到您的坐标，默认定位为长春市！");
				}, { // 附带参数
					enableHighAccuracy: false, // 提高精度(耗费资源)
					timeout: 2000, // 超过timeout则调用失败的回调函数
					maximumAge: 1000 // 获取到的地理信息的有效期，超过有效期则重新获取一次位置信息
				}
			);
			
			var map = new BMap.Map("allmap");
			var pointA = new BMap.Point(newlongitude,newlatitude);  // 创建点坐标A--大渡口区
			var pointB = new BMap.Point(125.376976,43.845351);  // 创建点坐标B--江北区
			alert('从大渡口区到江北区的距离是：'+(map.getDistance(pointA,pointB)).toFixed(2)+' 米。');  //获取两点 */
			initpage();
		});
		function initpage(){
			var url = basePath + "/proscenium/crjRyjbxxController/webProtal/findDictionaryByType.do?random=" + Math.random();
			var listParams = {
					"pid" : "22000000"
		 	};
			$.ajaxSettings.async = false; 
			$.getJSON(url,listParams, function(json){
				var str="";
				$.each(json.data, function(i,result) {
					var slscode = result.id;
					var slsname = result.dicName;
					sls.options.add(new Option(slsname,slscode));
					if(slsname==sjdz){
						$('#region_l').html(slsname);
						sls_qj=slscode;
					}
					str+="<a href='javascript:void(0);' class='select_sty' onClick='region_l(\"" +  slsname + "\",\"" +  slscode + "\")'>"+slsname+"</a>";
				});	
				$('#wx_xzqh').html(str);
			});
		}
		// 受理地所在区
		function selectDictionary(type) {
			sls_qj=type;
			if (sls != null && sls != "") {
				var slxNode = slx.childNodes;
				if(slxNode != null) {
					while(slxNode.length > 0) {
						slx.removeChild(slxNode[slxNode.length-1]);
					}
				}
				var listParams = {
					"pid" : sls_qj
				};
				var url = basePath + "/proscenium/crjRyjbxxController/webProtal/findDictionaryByType.do";
				slx.options.add(new Option("请选择","")); 
				$.getJSON(url,listParams, function(json){ 
					var str="";
					$.each(json.data, function(i,result) {
						var slscode = result.id;
						var slsname = result.dicName;
						var qj_xzqh = result.dicCode;
						slx.options.add(new Option(slsname,slscode)); 
						str+="<a href='javascript:void(0);' class='select_sty' onClick='county_no_l(\"" +  slsname + "\",\"" +  slscode + "\",\"" + qj_xzqh+"\")'>"+slsname+"</a>";	
					});	
					$('#wx_xzqh_qx').html(str);
				});
			}
		}
 	 	function region(){
			if($("#layer").is(":hidden")){
				$("#layer_1").hide();
				$("#layer").slideDown(200);
			} else {
				$("#layer_1").hide();
				$("#layer").slideUp();
			}
		}
		//点击关闭弹出层
		function down_none(){
			$("#layer").hide();
		}
		function region_l(name,code){
 	 		$('#region_l').html(name);
 	 		$('#county_no_gn').html("县区");
 	 		selectDictionary(code);
		}
		function county(){
			if($("#layer_1").is(":hidden")){
				$("#layer").hide();
				$("#layer_1").slideDown(200);
			} else {
				$("#layer").hide();
				$("#layer_1").slideUp();
			}
 		}
		function county_no(){
			$("#layer_1").slideUp();
		}
		function county_no_l(name,code,qj_xzqh){
			$("#layer_1").hide();
			$('#county_no_gn').html(name);
			slx_qj=code;
			init_Ditu();
		}
	    function init_Ditu() {
			$("#table111").html("");
			$("#worktimeId").val("");
			$("#jgdwName").val("");
			$("#txt").html("");
			$("#jgdwywdwdz").val("");
			var sls = sls_qj;
			var slx = slx_qj;
			// 准备URL和参数列表
			var url = basePath + "/proscenium/crjRyjbxxController/yuYue/findYuYueByRJNew.do?random=" + Math.random();
			var listParams = {
					"sls" : sls,
					"slx" : slx
			};
			$.ajaxSettings.async = false; 
			// 发出请求并处理返回数据
			$('#danweiList').html("");
			$('#lise_box').html("");
			$.getJSON(url,listParams, function(json) {
				if (json.code == "000000") {
 					map = new BMap.Map("allmap");
					if (json.data != '') {
 						var point = new BMap.Point(newlongitude, newlatitude);
 						//var point = new BMap.Point(125.328459, 43.891125);
 						map.centerAndZoom(point, 12);
 						map.enableScrollWheelZoom(true);
 						var iconUser = new BMap.Icon('image/user2.png', new BMap.Size(30, 30), {//是引用图标的名字以及大小，注意大小要一样
			                anchor: new BMap.Size(13, 28)//这句表示图片相对于所加的点的位置
		                });
						var markerUser = new BMap.Marker((new BMap.Point(newlongitude, newlatitude)), {icon : iconUser});  // 创建标注
						var labelUser = new BMap.Label("当前位置", {offset:new BMap.Size(0,20)});
						markerUser.setLabel(labelUser);
						map.addOverlay(markerUser);
						var strlist="";
						var strditulist="";
						$.each(json.data, function(i, result) {
							if (result.longitude != "") {
								  var icon = new BMap.Icon('image/_green.png', new BMap.Size(30, 30), {//是引用图标的名字以及大小，注意大小要一样
					                anchor: new BMap.Size(13, 28)//这句表示图片相对于所加的点的位置
				                }); 
								$('#danweiList').append(
									"<tr >"+
	              						"<td  class='listDanwei'><!-- <a href='javascript:selDanwei("+result.longitude+","+result.latitude+")'>"+result.jgdwName+"</a>--><td>"+
	              					"</tr>"
								);
								
								var pointA = new BMap.Point(newlongitude,newlatitude);  // 创建点坐标A--大渡口区
								
				            	var pointB = new BMap.Point(result.longitude,result.latitude);  // 创建点坐标B--江北区

				            	var juli=map.getDistance(pointA,pointB).toFixed(2);  //获取两点距离,保留小数点后两位

								
								
								
								
								
				                var marker = new BMap.Marker((new BMap.Point(result.longitude, result.latitude)), {icon : icon});  // 创建标注
				                var title = result.jgdwName;
				                var content="";
				                content+= "<table>";
				                content+="<tr>";
				                content+="<td>受理地信息</td>";
				            	content+="</tr>";
				            	content+="<tr>";
				            	content+="<td>机关单位名称：" + result.jgdwName + "</td>";
				            	content+="</tr>";
				            	
				            	    
				            	
				            	
				            	var flre = '';
				            	var jgdwid=result.jgdwId;
				            	var jgdwywtsxx="";
				            	var jgdwywdwdz="";
				            	// 准备URL和参数列表
				    			var urltsxx = basePath + "/proscenium/crjRyjbxxController/yuyue/findJgdwById.do?random=" + Math.random();
				    			var listParamstsxx = {
				    					"jgdwid" : jgdwid
				    			};
				    			
				    			$.ajaxSettings.async = false; 
				    			$.getJSON(urltsxx,listParamstsxx, function(json) {

				    				if (json.code == "000000") {
				    					jgdwywtsxx=json.beiYong1;
					    				jgdwywdwdz=json.beiYong2;
					    				 if(jgdwywdwdz == undefined){
												jgdwywdwdz="预约地址尚未维护更新！";
											}
											if(jgdwywtsxx == undefined){
												jgdwywtsxx="提示信息尚未维护更新！";
											}
											if(juli == undefined){
												juli="";
											}
				    				}
				    				
				    			});
				    			strlist+='<div class="list_main"><dl class="list_dl_box"><dt>';
				            	 if(i%2==0)  //取模 求余数\
				            	 {
				            		 strlist+='<img src="image/icon/lv_icon1.png" alt="" width="40" height="40" />';
				            	  
				            	  }else{
				            		  strlist+='<img src="image/icon/huang_icon1.png" alt="" width="40" height="40" />';
				            	  }
				            	strlist+='</dt><dd>';
				            	strlist+='<p>'+ result.jgdwName +'</p>';
				            	strlist+='<p>'+ jgdwywdwdz +' <img src="image/icon/addres_icon1.png" alt="" /></p></dd>';
				            	strlist+='<span class="text_position">'+juli+'米</span></dl><span class="text_position">52441米</span></dl><ul class="list_ul_box">';
								content+="</table>";
								
								var label = new BMap.Label(title, {offset:new BMap.Size(0,20)});
								
				            	marker.setLabel(label);
				                map.addOverlay(marker);  
				               

				                // 将标注添加到地图中
				                addClickHandler(title, content, marker, map, result.jgdwName, result.listSysWorktime, jgdwywtsxx, jgdwywdwdz,juli,jgdwid) ;
				                strditulist=strditulist+'<li><span>'+result.jgdwName+'</span><span class="addres_color">'+jgdwywdwdz+' <i class="text_color distance_num">'+juli+'米</i> </span><a href="javascript:void(0);" onClick="addClickHandlerList(\'' + result.jgdwName + '\',\'' + jgdwid + '\',\'' + jgdwywtsxx + '\',\'' + jgdwywdwdz + '\',\'' + juli + '\');" class="btn_appoin btn_right">预约</a></li>';
				                strlist+='</ul><span class="icon_right"><img src="image/icon/icon_you.png" alt="" width="12" height="20" /></span></div>';
				               
							}
						});
						
						$('#adr').html(adr);
						$('#ditu_lise_box').html(strditulist);
						$('#lise_box').append(strlist);
						$('#lise_box_p').html("");
						$('#lise_box_map').html("提示：点击下方地点按钮选择预约时间！");
					} else {
						$('#lise_box_map').html("您选择的时间和地区没有可以预约的受理网点，请重新选择！");
						$('#lise_box').html('<p class="hit" id="lise_box_p">您选择的时间和地区没有可以预约的受理网点，请重新选择！</p>');
						//map = new BMap.Map("allmap");
 						//var point = new BMap.Point(125.328459, 43.891125);
						var point = new BMap.Point(newlongitude, newlatitude);
 						
 						map.centerAndZoom(point,12);  //初始化地图,设置城市和地图级别。
						var iconUser = new BMap.Icon('image/user2.png', new BMap.Size(30, 30), {//是引用图标的名字以及大小，注意大小要一样
			                anchor: new BMap.Size(13, 28)//这句表示图片相对于所加的点的位置
		                });
						var markerUser = new BMap.Marker((new BMap.Point(newlongitude, newlatitude)), {icon : iconUser});  // 创建标注
						var labelUser = new BMap.Label("当前位置", {offset:new BMap.Size(0,20)});
						markerUser.setLabel(labelUser);
						map.addOverlay(markerUser); 
						$('#adr').html(adr);
					}
				} else {
					alert(json.msg);
				}
				
			});
		}
    </script>
</head>
<body>
	<div class="mask_layer"></div>
	<div id="wrap">
    	<header id="header">
        	<span style="float:left; padding-left:15px;">机构导航</span>
        	<a href="javascript:tab(0);" value='1' class="list_text"><img src="<%=basePath%>/jsp/proscenium/image/icon/addres_icon.png" alt="" width="12" height="15" /></a>
        </header>
        <section id="">
			 <ul class="nav_box">
				 <li>
					<a href="javascript:void(0);" class="default" onClick="region();" id="region_l">长春市</a>
					<div >
						<select id="sls" name="sls" style="width:120px; height: 20px;display:none;" onchange="selectDictionary(sls_qj);">
						</select> 
					</div>
				 </li>
				 <li><a href="javascript:void(0);" onClick="county();" id="county_no_gn">县区</a>
					<select id="slx" name="slx" style="width: 120px; height: 20px;display:none">
						<option >请选择</option>
					 </select>
				 </li>
			 </ul>
	        <div class="list_content_box" style="display:none;"  id="lise_box"></div>
		</section>
    </div>
    <!-- 选择城市弹出层 -->
    <div class="city_box" style="top:85px;display:none;" id="layer">
    	 <!-- 城市字母显示 -->
    	<div>
             <div id="wx_xzqh" class="screening_box"></div>
             <a href="javascript:down_none();" style="text-align:center; width:100%; display:block; height:40px;"  class="close_icon_img"><img src="<%=basePath%>/jsp/proscenium/image/icon/down_icon.png" width="25" height="18" /></a>
        </div>
        <!-- end -->
    </div>
    <!-- 选择县区弹出层 -->
	<div class="city_box" id="layer_1" style="top:85px;">
         <!-- 城市字母显示 -->
    	<div>
             <div id="wx_xzqh_qx" class="screening_box"></div>
		     <a href="javascript:county_no(0);" style="text-align:center; width:100%; display:block; height:40px;"  class="close_icon_img"><img src="<%=basePath%>/jsp/proscenium/image/icon/down_icon.png" width="25" height="18" /></a>
        </div>
    </div>
   	 <div style="position:relative;" class="map_wrap">
             <p class="hit" id="lise_box_map">提示：点击下方地点按钮选择预约时间</p>
		<table id='tableM' class="bordered" width='60%'>
		    <thead id='table111'>
		    <tr>
		        <th id='tittle111'>单位</th>        
		        <th>预约时间段</th>
		        <th>已预约人数</th>
		        <th>剩余预约人数</th>
		        <th>操作</th>
		    </tr>
		    </thead>
		</table>
					<!-- <section style=" margin-top:15px;">
            <div><a href="javascript:void(0);" class="btn_confirm" onclick="addYuYue();">确 定</a></div>
        </section> -->
					<div style="padding-top:10px; margin-bottom:10px; margin-left:15px;">
	                	<span id="txt" style="width:500px; height:50px; padding-top:5px; margin-bottom:10px; margin-left:15px;font-size:16px;">
	                		<!-- 预约信息：预约长春市出入境管理局办证大厅09:00 -->
	                	</span>
	                	<input type="hidden" id="worktimeId" value="" />
	                	<input type="hidden" id="jgdwName" value="" />
	                	<input type="hidden" id="jgdwywdwdz" value="" />
	              	</div>
	   
             </div>
             <div class="time_box" style="z-index:9" id="lisebox_">
        	<a href="javascript:adders_show(0);" class="close_icon close_icon_img" style="top:10px;" ><img src="image/icon/down_icon.png" width="25" height="18" /></a>
            <div class="my_location">
            	<p>当前位置</p>
                <p id="adr"></p>
            </div>
             <div class="list_wrap list_box_" style="display:none;" id="addr_box">
             	<ul class="lise_box" id="ditu_lise_box">
                </ul>
             </div>
        </div> 
			<div id="allmap" style="width: 100%; height:480px; text-align: center; margin:0 auto; display:none;">
				<!-- <img src="image/images/yydd_image.jpg" alt=""  /> -->
			</div>
</body>
</html>