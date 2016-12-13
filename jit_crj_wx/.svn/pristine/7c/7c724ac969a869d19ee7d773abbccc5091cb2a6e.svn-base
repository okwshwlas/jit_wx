<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="/WEB-INF/tld/c.tld" prefix="c"%>
<%
	String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
    //微信用户唯一标识
    String openid = request.getParameter("openid");
	String code = request.getParameter("code");
    String els = request.getParameter("els");
    String dhhm = request.getParameter("dhhm");
    //String openid = "123456";
     String newlatitude = request.getParameter("newlatitude");
     String newlongitude = request.getParameter("newlongitude");
     String adr = request.getParameter("adr");
     String sjdz = request.getParameter("adrcs");
	 String adrxq = request.getParameter("adrxq");
	 String count = request.getParameter("count");
	  String type = request.getParameter("type");
%> 
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"/>
	<script type="text/javascript">
	var path= '<%=path%>';
	var openid='<%=openid%>';
	var code='<%=code%>';
	var els='<%=els%>';
	var dhhm='<%=dhhm%>';
	var basePath='<%=basePath%>';
	var newlatitude = '<%=newlatitude%>';
	var newlongitude ='<%=newlongitude%>';
	var adr = '<%=adr%>';
	var sjdz='<%=sjdz%>';
	var adrxq='<%=adrxq%>';
	var count=0;
	//大平台公众号标示3
	var type='<%=type%>';
	</script>
	<title>吉林省公安出入境微信平台</title>
	<link href="<%=basePath%>/jsp/proscenium/lib/style/default.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="<%=basePath%>/jsp/proscenium/lib/style/index3.css">
	<link rel="stylesheet" href="<%=basePath%>/jsp/proscenium/lib/Validform_v5.3.2/demo/css/style.css" type="text/css" media="all" />
	<script type="text/javascript" src="<%=basePath%>/js/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>/jsp/proscenium/lib/Validform_v5.3.2/demo/js/Validform_v5.3.2.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/My97Date/WdatePicker.js" charset="utf-8"></script>
	<script type="text/javascript" src="<%=basePath%>/jsp/orgnav/js/layer.js"></script>
	<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=KWe2TezxgWBDms0PYjeXBZWt"></script>
	<script type="text/javascript" src="<%=basePath%>/jsp/proscenium/js/cookie.js"></script> 
	<link href="<%=basePath%>/jsp/proscenium/style/contents.css" type="text/css"  rel="stylesheet"  />
	<link href="<%=basePath%>/jsp/proscenium/style/loadding.css" type="text/css"  rel="stylesheet"  />
	
	<script>var sqid = "2200";</script>
	 <style>
        html { background-color: #f5f5f5}
        .tit_text { margin: 0 auto; width: 85%;  font-size: 16px; font-weight: normal; text-align: center;border-bottom: 1px solid #cfcfcf; line-height: 35px;}
        .list_box { width: 80%; margin: 10px auto; padding-left: 10%; font-size: 14px;}
        .list_box .tit { font-size: 16px; line-height: 30px;}
        .list_wd { background: url("../../images/icon_wd.png") no-repeat left center; }
        .list_wddz { background: url("../../images/icon_wddz.png") no-repeat left center; }
        .list_lxdh { background: url("../../images/icon_lxdh.png") no-repeat left center; }
        .tip_box { margin: 0 auto; width: 85%; border-radius: 5px;  background-color: #86c7de; padding: 2%; color: #fff; line-height: 25px; font-size: 14px;}
        .btn_ul { margin-top: 15px; overflow: hidden; width: 100%; background-color: #f1f1f1;}
        .btn_ul li { float: left;width: 49.5%; text-align: center;}
        .btn_ul li a { display: block;line-height: 50px; color: #626262; font-size: 16px; border-right: 1px solid #fff;}
    </style>
	<script type="text/javascript">
		var sls_qj="22010000";
		var slx_qj="";
		var map = "";
		var dhqlongitude="";
		var dhqlatitude="";
		$("#adr").html('未获取到您的位置');
		var sls_qj_all="";
		
		$(function() {
		if('3'==type){
		openid = openid;
	
		 setCookie('jlga',type);
		 setCookie('openid',openid);
		
		
		}else{
		
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
		
		}
		
		
		
			
		

			if($("#adr").html()=='未获取到您的位置' || $("#adr").html()==''){
			
				$('#flag').val('0');
				var geolocation = new BMap.Geolocation();  
				geolocation.getCurrentPosition(function (r) {  
					if (this.getStatus() == BMAP_STATUS_SUCCESS) {  
						var mk = new BMap.Marker(r.point);  
						newlatitude = r.point.lat;  
						newlongitude = r.point.lng;
						dhqlatitude =r.point.lat;
						dhqlongitude =  r.point.lng;
						
						var pt = new BMap.Point(newlongitude, newlatitude);  
						initpage();
						var geoc = new BMap.Geocoder();  
						geoc.getLocation(pt, function (rs) {  
							newlongitude = rs.point.lng;
							newlatitude = rs.point.lat;
							var addComp = rs.addressComponents;  
							//alert("1adfasd"+newlongitude+","+newlatitude);
							var city = addComp.city;  
							var addComp = rs.addressComponents;  
							adr = addComp.district + "-" + addComp.street + "-" + addComp.streetNumber;  
							//alert(adr);
							//获取地理位置成功，跳转  
							//$("#adr").html(adr);
							var point = new BMap.Point(newlongitude, newlatitude);
 						
							//var point = new BMap.Point(125.328459, 43.891125);
							map.centerAndZoom(point, 14);
							map.enableScrollWheelZoom(true);
							var iconUser = new BMap.Icon('image/user2.png', new BMap.Size(30, 30), {//是引用图标的名字以及大小，注意大小要一样
								anchor: new BMap.Size(13, 28)//这句表示图片相对于所加的点的位置
							});
							
							var markerUser = new BMap.Marker((new BMap.Point(newlongitude, newlatitude)), {icon : iconUser});  // 创建标注
							var labelUser = new BMap.Label("当前位置", {offset:new BMap.Size(0,20)});
							
							markerUser.setLabel(labelUser);
							map.addOverlay(markerUser);
							$(".mask_layer").show();
							$('#tip_layer').show();
							
							dhqlongitude = newlongitude;
							dhqlatitude = newlatitude;
							
							
							
						});
					}
				});
				
				
			}
			/* if(false){
				$('#flag').val('0');
				
				navigator.geolocation.getCurrentPosition( // 该函数有如下三个参数
		            function(pos){ // 如果成果则执行该回调函数
//	 	                alert(
//	 	                    '  经度：' + pos.coords.latitude +
//	 	                    '  纬度：' + pos.coords.longitude
//	 	                );
		            	newlatitude = pos.coords.latitude+0.0072;
		            	newlongitude = pos.coords.longitude+0.013;
						
		            }, function(err){ // 如果失败则执行该回调函数
		            	alert("因为不能够获取到您的坐标，默认定位为长春市！如果您想精准定位请打开手机的定位服务");
		                //alert(err.message);
		            }, { // 附带参数
		                enableHighAccuracy: false, // 提高精度(耗费资源)
		                timeout: 2000, // 超过timeout则调用失败的回调函数
		                maximumAge: 1000 // 获取到的地理信息的有效期，超过有效期则重新获取一次位置信息
		            }
		        );
				initpage();
				
			
			}else{
			
				initpage();
				
			} */
			initpage();
			
			$('#lisebox_').hide();
			$('#allmap').show();
			
		});
		
		function convertDitu(longitude,latitude){
			
			$.get( basePath + "/corecontroller/convertdituzb.do",{"longitude":longitude,"latitude":latitude},function(data){
				newlongitude = data.longitude;
				newlatitude = data.latitude;
				initpage();
				initDitu();
				$('#lisebox_').hide();
				$('#allmap').show();
				
				//tab(0);
			},'json');
		}
		// 初始化页面

		function initpage(){
		var location_address;
		var city_code="22010000";
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
			 var myGeo = new BMap.Geocoder();      
// 根据坐标得到地址描述    
myGeo.getLocation(new BMap.Point(newlongitude, newlatitude), function(result){      
                 if (result){      
                     location_address=result.city ;    
                  }      
                  });     
           
			 if(location_address=='吉林市'){
			city_code='22020000';
			}
			 if(location_address=='四平市'){
			city_code='22030000';
			}
			if(location_address=='辽源市'){
			city_code='22040000';
			}
			if(location_address=='通化市'){
			city_code='22050000';
			}
			if(location_address=='白山市'){
			city_code='22060000';
			}
			if(location_address=='松源市'){
			city_code='22070000';
			}
			if(location_address=='白城市'){
			city_code='22080000'; 
			}
			if(location_address=='延边朝鲜族自治州'){
			city_code='22240000';
			}
			sls_qj = city_code;
			
			
 

			selectDictionary(city_code);
			initDitu();
		}
		// 添加预约信息
		function initDitu() {
	
			$('#ditu_lise_box').html("");
			$('#lise_box').append("");
			var sls = sls_qj;
			var slx = slx_qj;
			// 准备URL和参数列表
			var url = basePath + "/proscenium/crjRyjbxxController/yuYue/findYuYueByRJNew.do?random=" + Math.random();
			var listParams = {
					"count" : count,
					"sls" : sls,
					"slx" : slx
			};
			$.ajaxSettings.async = false; 
			// 发出请求并处理返回数据
			$('#lise_box').html("");
			$.getJSON(url,listParams, function(json) {
 					map = new BMap.Map("allmap");
					if (json.data != '') {
 						var latitude = json.data[0].latitude;
 						var longitude = json.data[0].longitude;
						
 						//var point = new BMap.Point(longitude, latitude);
 						//var point = new BMap.Point(125.328459, 43.891125);
						
						//hwl   11-14
				
					// point = new BMap.Point(newlongitude, newlatitude);
					  point = new BMap.Point(longitude, latitude);
					  
					   point1 = new BMap.Point(longitude, latitude);
					   point2 = new BMap.Point(newlongitude, newlatitude);
						//map.setCenter(point);
						//alert(map.getZoom())
						//
 						//map.centerAndZoom(point, 14);
						  var points = [point1, point2];  
                        
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
						
							if (result.longitude != ""&&result.jgdwName.indexOf("派出所") == -1 ) {
								var icon = new BMap.Icon('image/_green.png', new BMap.Size(30, 30), {//是引用图标的名字以及大小，注意大小要一样
					                anchor: new BMap.Size(13, 28)//这句表示图片相对于所加的点的位置
				                }); 
								var pointA = new BMap.Point(newlongitude,newlatitude);  // 创建点坐标A--大渡口区
				            	var pointB = new BMap.Point(result.longitude,result.latitude);  // 创建点坐标B--江北区
				            	var juli=map.getDistance(pointA,pointB).toFixed(2);  //获取两点距离,保留小数点后两位
				                var marker = new BMap.Marker((new BMap.Point(result.longitude, result.latitude)), {icon : icon});  // 创建标注
				                var title = result.jgdwName;
								
				            	var jgdwid=result.jgdwId;
				            	var jgdwywdwdz="";
				            	// 准备URL和参数列表
				    			strlist+='<div class="list_main" style="margin:1px auto;width:100%"><dl class="list_dl_box" style="padding:0px;border-radius:0px;"><dt>';
				            	if(i%2==0)  //取模 求余数\
				            	{
				            		strlist+='<img src="image/icon/lv_icon1.png" alt="" width="40" height="40" />';
				            	}else{
				            		strlist+='<img src="image/icon/huang_icon1.png" alt="" width="40" height="40" />';
				            	}
				            	strlist+='</dt><dd style="margin-top:7px;">';
				            	strlist+='<p>'+ result.jgdwName +'</p>';
				            	strlist+='</dd>';
				            	strlist+='<span class="text_position" style="bottom: 6px;">'+juli+'米</span></dl>';
								
								
								//11-13 hwl ***sat
								var jgdwywtsxx="";
				            	var jgdwywdwdz="";
								var dwdh="";
				            	// 准备URL和参数列表
				    			var urltsxx = basePath + "/proscenium/crjRyjbxxController/yuyue/findJgdwById.do?random=" + Math.random();
				    			var listParamstsxx = {
				    					"jgdwid" : jgdwid
				    			};
				    			
				    			$.ajaxSettings.async = false; 
				    			$.getJSON(urltsxx,listParamstsxx, function(json) {

				    				if (json.code == "000000") {
									   var tsxxobj=json.data;
				    					jgdwywtsxx=tsxxobj.beiYong1;
					    				jgdwywdwdz=tsxxobj.beiYong2;
										dwdh =tsxxobj.imgurl;
					    				if(jgdwywdwdz == ''){
											jgdwywdwdz="网点地址尚未维护更新！";
										}
										if(jgdwywtsxx == ''){
											jgdwywtsxx=" 待维护";
										}
										if(dwdh == ''){
											dwdh=" 待维护";
										}
										if(juli == undefined){
											juli="";
										}
				    				}
				    				
				    			});
								var label;
								//hwl   加缩放监听
							/* 	if(json.data.length>2){
								  label = new BMap.Label('', {offset:new BMap.Size(0,20)});
								}else{
								  label = new BMap.Label(title, {offset:new BMap.Size(0,20)});
								} */
								
								label = new BMap.Label(title, {offset:new BMap.Size(0,20)});
							    marker.setLabel(label);
				                map.addOverlay(marker);  
								
								map.addEventListener("zoomend", function () {
                                var DiTu = this.getZoom();
								//alert(DiTu)
								if(DiTu >13){
								    marker.getLabel().setStyle({display:"block"})
								}else{
								 marker.getLabel().setStyle({display:"none"})
								}
                                      
                                     });
								
								
								
                                
								//hwl
								//var label = new BMap.Label(title, {offset:new BMap.Size(0,20)});
								//*****end
				            
								var sContent ="";
	/* "<p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>网点:" + title+"</p>"+
	"<p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>网点地址:" + jgdwywdwdz+ "</p>"+
	"<p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>联系电话:" + jgdwywdwdz+ "</p>"+
	"<p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>业务提示:" + jgdwywtsxx+ "</p>"+
	"<div>"+
    "<div style='width:50%;padding:0;margin:0;float:left;box-sizing:border-box;'><input type='button' name='ButtonAibang' value='到这里去' id='Buttondh' class='join-btn' onClick='gotodh("+
	result.longitude+","+result.latitude+");"+"'/>"+
	"</div>"+    
    "<div style='width:50%;padding:0;margin:0;float:left;box-sizing:border-box;'><input type='button' name='ButtonBaidu' value='预约' id='Buttonyy' class='join-btn' onClick='gotoyy("+
       result.longitude+","+result.latitude+","+code+","+openid+");"+"'/>"+
     "</div>"+
     "</div>"; */
	 
	 sContent = " <h1 class='tit_text'>网点信息</h1>"+
	 "<div class='list_box list_wd'>"+
	// "<p class='tit'>网点</p><p>"+title+"</p></div><div class='list_box list_wddz'> <p class='tit'>网点地址</p><p>"+jgdwywdwdz+"</p></div>"+
	  "<p class='tit'>"+title+"</p></div><div class='list_box list_wddz'> <p class='tittit_text'>"+jgdwywdwdz+"</p></div>"+
	 "<div class='list_box list_lxdh'><p class='tittit_text'>联系电话:</p><p class='tittit_text'>"+dwdh+"</p></div>"+
	 " <div class='tip_box'><p style='font-size: 16px;'>业务提示:</p><p class='tittit_text'>"+jgdwywtsxx+"</p></div>"+
	 " <ul class='btn_ul'><li><a href=\'"+"jclx.jsp?longitude="+result.longitude+"&latitude="+result.latitude+"&newlongitude="+dhqlongitude+"&newlatitude="+dhqlatitude+"\'>到这里去</a> </li>"+
	 " <li><a href=\'"+"dhyuyue.jsp?longitude="+longitude+"&latitude="+latitude+"&code="+code+"&openid="+openid+"&jgdwid="+jgdwid+"&jgdwname="+title+"&newlongitude="+newlongitude+"&newlatitude="+newlatitude+"\'>预 约</a> </li></ul>";
	  //alert("jclx.jsp?longitude="+result.longitude+"&latitude="+result.latitude+"&newlongitude="+newlongitude+"&newlatitude="+newlatitude)


	                              var infoWindow = new BMap.InfoWindow(sContent);  // 创建信息窗口对象 
	                              marker.addEventListener("click", function(){          
		                          map.openInfoWindow(infoWindow,pointB); //开启信息窗口
	                           });
				              // addClickHandler(title,marker, map,juli,result.longitude,result.latitude);
				                // 将标注添加到地图中
				                strditulist=strditulist+'<li><span>'+result.jgdwName+' <a href="javascript:void(0);" onClick="scanlx(\'' + result.longitude + '\',\'' +  result.latitude + '\');" >查看路线</a></span><span class="addres_color">'+jgdwywdwdz+' <i class="text_color distance_num">'+juli+'米</i> </span>'
								strditulist+="<a href=\'"+"dhyuyue.jsp?longitude="+longitude+"&latitude="+latitude+"&code="+code+"&openid="+openid+"&jgdwid="+jgdwid+"&jgdwname="+title+"&newlongitude="+newlongitude+"&newlatitude="+newlatitude+"\' class='btn_appoin btn_right'>预 约</a> "
								strditulist+='</li>';
				                strlist+='</ul><span class="icon_right"><img src="image/icon/icon_you.png" alt="" width="10" height="14" /></span></div>';
							}
						});
						$('#ditu_lise_box').html(strditulist);
						$('#lise_box').append(strlist);
						$('#lise_box_p').html("");
						var pointA = new BMap.Point(newlongitude,newlatitude);  // 创建点坐标A--大渡口区
						var gc = new BMap.Geocoder();
 		                gc.getLocation(pointA, function(rs){
 		            	var addComp = rs.addressComponents;
 		            	adr="当前位置:"+addComp.district + addComp.street +  addComp.streetNumber+"附近";
						
 		            	$("#adr").html(adr);
						//alert($("#adr").html())
					});
					 						//map.centerAndZoom(point, 14);
											 var view = map.getViewport(eval(points));  
                        var mapZoom = view.zoom;   
                        var centerPoint = view.center;   
                         map.centerAndZoom(centerPoint,mapZoom);  

				} else {
					alert(json.msg);
				}
				 					

			});
		}
		function addClickHandler(title,marker, map,juli,longitude,latitude){
			marker.addEventListener("click",function(e){
				window.location.href = "jclx.jsp?longitude="+longitude+"&latitude="+latitude;
			});
		}
		// 受理地所在区
		function selectDictionary(type) {
		//alert('11111');
			//var sls = document.getElementById("sls").value;
			$("#layer").hide();
			sls_qj=type;
			if (sls != null && sls != "") {
				// 清空受理地所在县(区)信息
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
				//var url1 = "/getChildCity.do?random="+Math.random();
				//发出请求并处理返回数据
				slx.options.add(new Option("请选择","")); 
				$.getJSON(url,listParams, function(json){ 
					var str="";
					sls_qj_all =sls_qj;
					str+="<a href='javascript:void(0);' class='select_sty' onClick='county_all(\"" +  sls_qj + "\")'>本市所有</a>";
					$.each(json.data, function(i,result) {
						var slscode = result.id;
						var slsname = result.dicName;
						slx.options.add(new Option(slsname,slscode)); 
						/* if(slsname.length>5){
							slsname=slsname.substring(0,4)+'..';
						} */
						
						str+="<a href='javascript:void(0);' class='select_sty' onClick='county_no_l(\"" +  slsname + "\",\"" +  slscode + "\")'>"+slsname+"</a>";
						//str+="<a href='javascript:void(0);' class='select_sty' onClick='county_no();>"+slsname+"</a>";
					});	
					$('#wx_xzqh_qx').html(str);
				});
			}
			
		}
		function county_all(sls_qj_all){
		$("#layer_1").hide();
		selectDictionary(sls_qj_all)
		
		initDitu_all();
		
		}
		// 添加预约信息
		function initDitu_all() {
	
			$('#ditu_lise_box').html("");
			$('#lise_box').append("");
			var sls = sls_qj_all;
			var slx = "";
			// 准备URL和参数列表
			var url = basePath + "/proscenium/crjRyjbxxController/yuYue/findYuYueByRJNew.do?random=" + Math.random();
			var listParams = {
					"count" : count,
					"sls" : sls,
					"slx" : slx
			};
			$.ajaxSettings.async = false; 
			// 发出请求并处理返回数据
			$('#lise_box').html("");
			$.getJSON(url,listParams, function(json) {
 					map = new BMap.Map("allmap");
					if (json.data != '') {
					var end_num =json.data.length-1;
 						var latitude = json.data[end_num].latitude;
 						var longitude = json.data[end_num].longitude;
						
 						//var point = new BMap.Point(longitude, latitude);
 						//var point = new BMap.Point(125.328459, 43.891125);
						
						//hwl   11-14
				
					// point = new BMap.Point(newlongitude, newlatitude);
					  point = new BMap.Point(longitude, latitude);
					  
					   point1 = new BMap.Point(longitude, latitude);
					   point2 = new BMap.Point(newlongitude, newlatitude);
						//map.setCenter(point);
						//alert(map.getZoom())
						//
 						//map.centerAndZoom(point, 14);
						  var points = [point1, point2];  
                        
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
						
							if (result.longitude != ""&&result.jgdwName.indexOf("派出所") == -1 ) {
								var icon = new BMap.Icon('image/_green.png', new BMap.Size(30, 30), {//是引用图标的名字以及大小，注意大小要一样
					                anchor: new BMap.Size(13, 28)//这句表示图片相对于所加的点的位置
				                }); 
								var pointA = new BMap.Point(newlongitude,newlatitude);  // 创建点坐标A--大渡口区
				            	var pointB = new BMap.Point(result.longitude,result.latitude);  // 创建点坐标B--江北区
				            	var juli=map.getDistance(pointA,pointB).toFixed(2);  //获取两点距离,保留小数点后两位
				                var marker = new BMap.Marker((new BMap.Point(result.longitude, result.latitude)), {icon : icon});  // 创建标注
				                var title = result.jgdwName;
								var gcw = new BMap.Geocoder();
 		                gcw.getLocation(pointB, function(rs){
 		            	var addComp = rs.addressComponents;
 		            	adrw="当前位置:"+addComp.district + addComp.street +  addComp.streetNumber+"附近";
 		            	//alert(addComp.city )
						
					});
				            	var jgdwid=result.jgdwId;
				            	var jgdwywdwdz="";
				            	// 准备URL和参数列表
				    			strlist+='<div class="list_main" style="margin:1px auto;width:100%"><dl class="list_dl_box" style="padding:0px;border-radius:0px;"><dt>';
				            	if(i%2==0)  //取模 求余数\
				            	{
				            		strlist+='<img src="image/icon/lv_icon1.png" alt="" width="40" height="40" />';
				            	}else{
				            		strlist+='<img src="image/icon/huang_icon1.png" alt="" width="40" height="40" />';
				            	}
				            	strlist+='</dt><dd style="margin-top:7px;">';
				            	strlist+='<p>'+ result.jgdwName +'</p>';
				            	strlist+='</dd>';
				            	strlist+='<span class="text_position" style="bottom: 6px;">'+juli+'米</span></dl>';
								
								
								//11-13 hwl ***sat
								var jgdwywtsxx="";
				            	var jgdwywdwdz="";
								var dwdh="";
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
										dwdh =json.imgurl;
					    				if(jgdwywdwdz == undefined){
											jgdwywdwdz="网点地址尚未维护更新！";
										}
										if(jgdwywtsxx == undefined){
											jgdwywtsxx=" 待维护";
										}
										if(dwdh == undefined){
											dwdh=" 待维护";
										}
										if(juli == undefined){
											juli="";
										}
				    				}
				    				
				    			});
								var label;
								//hwl   加缩放监听
							/* 	if(json.data.length>2){
								  label = new BMap.Label('', {offset:new BMap.Size(0,20)});
								}else{
								  label = new BMap.Label(title, {offset:new BMap.Size(0,20)});
								} */
								
								label = new BMap.Label(title, {offset:new BMap.Size(0,20)});
							    marker.setLabel(label);
				                map.addOverlay(marker);  
								
								map.addEventListener("zoomend", function () {
                                var DiTu = this.getZoom();
								//alert(DiTu)
								if(DiTu >13){
								    marker.getLabel().setStyle({display:"block"})
								}else{
								 marker.getLabel().setStyle({display:"none"})
								}
                                      
                                     });
								
								
								
                                
								//hwl
								//var label = new BMap.Label(title, {offset:new BMap.Size(0,20)});
								//*****end
				            
								var sContent ="";
	/* "<p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>网点:" + title+"</p>"+
	"<p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>网点地址:" + jgdwywdwdz+ "</p>"+
	"<p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>联系电话:" + jgdwywdwdz+ "</p>"+
	"<p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>业务提示:" + jgdwywtsxx+ "</p>"+
	"<div>"+
    "<div style='width:50%;padding:0;margin:0;float:left;box-sizing:border-box;'><input type='button' name='ButtonAibang' value='到这里去' id='Buttondh' class='join-btn' onClick='gotodh("+
	result.longitude+","+result.latitude+");"+"'/>"+
	"</div>"+    
    "<div style='width:50%;padding:0;margin:0;float:left;box-sizing:border-box;'><input type='button' name='ButtonBaidu' value='预约' id='Buttonyy' class='join-btn' onClick='gotoyy("+
       result.longitude+","+result.latitude+","+code+","+openid+");"+"'/>"+
     "</div>"+
     "</div>"; */
	 
	 sContent = " <h1 class='tit_text'>网点信息</h1>"+
	 "<div class='list_box list_wd'>"+
	// "<p class='tit'>网点</p><p>"+title+"</p></div><div class='list_box list_wddz'> <p class='tit'>网点地址</p><p>"+jgdwywdwdz+"</p></div>"+
	  "<p class='tit'>"+title+"</p></div><div class='list_box list_wddz'> <p class='tittit_text'>"+jgdwywdwdz+"</p></div>"+
	 "<div class='list_box list_lxdh'><p class='tittit_text'>联系电话:</p><p class='tittit_text'>"+dwdh+"</p></div>"+
	 " <div class='tip_box'><p style='font-size: 16px;'>业务提示:</p><p class='tittit_text'>"+jgdwywtsxx+"</p></div>"+
	 " <ul class='btn_ul'><li><a href=\'"+"jclx.jsp?longitude="+result.longitude+"&latitude="+result.latitude+"&newlongitude="+dhqlongitude+"&newlatitude="+dhqlatitude+"\'>到这里去</a> </li>"+
	 " <li><a href=\'"+"dhyuyue.jsp?longitude="+longitude+"&latitude="+latitude+"&code="+code+"&openid="+openid+"&jgdwid="+jgdwid+"&jgdwname="+title+"&newlongitude="+newlongitude+"&newlatitude="+newlatitude+"\'>预 约</a> </li></ul>";
	  //alert("jclx.jsp?longitude="+result.longitude+"&latitude="+result.latitude+"&newlongitude="+newlongitude+"&newlatitude="+newlatitude)


	                              var infoWindow = new BMap.InfoWindow(sContent);  // 创建信息窗口对象 
	                              marker.addEventListener("click", function(){          
		                          map.openInfoWindow(infoWindow,pointB); //开启信息窗口
	                           });
				              // addClickHandler(title,marker, map,juli,result.longitude,result.latitude);
				                // 将标注添加到地图中
				                strditulist=strditulist+'<li><span>'+result.jgdwName+' <a href="javascript:void(0);" onClick="scanlx(\'' + result.longitude + '\',\'' +  result.latitude + '\');" >查看路线</a></span><span class="addres_color">'+jgdwywdwdz+' <i class="text_color distance_num">'+juli+'米</i> </span>'
								strditulist+="<a href=\'"+"dhyuyue.jsp?longitude="+longitude+"&latitude="+latitude+"&code="+code+"&openid="+openid+"&jgdwid="+jgdwid+"&jgdwname="+title+"&newlongitude="+newlongitude+"&newlatitude="+newlatitude+"\' class='btn_appoin btn_right'>预 约</a> "
								strditulist+='</li>';
				                strlist+='</ul><span class="icon_right"><img src="image/icon/icon_you.png" alt="" width="10" height="14" /></span></div>';
							}
						});
						$('#ditu_lise_box').html(strditulist);
						$('#lise_box').append(strlist);
						$('#lise_box_p').html("");
						var pointA = new BMap.Point(newlongitude,newlatitude);  // 创建点坐标A--大渡口区
						var gc = new BMap.Geocoder();
 		                gc.getLocation(pointA, function(rs){
 		            	var addComp = rs.addressComponents;
 		            	adr="当前位置:"+addComp.district + addComp.street +  addComp.streetNumber+"附近";
 		            	$("#adr").html(adr);
						
					});
					 						//map.centerAndZoom(point, 14);
											 var view = map.getViewport(eval(points));  
                        var mapZoom = view.zoom;   
                        var centerPoint = view.center;   
                         map.centerAndZoom(centerPoint,mapZoom);  

				} else {
					alert(json.msg);
				}
				 					

			});
		}
		// 受理地所在区
		function initselectDictionary(type) {
			$("#layer").hide();
			sls_qj=type;
			if (sls != null && sls != "") {
				// 清空受理地所在县(区)信息
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
				//发出请求并处理返回数据
				slx.options.add(new Option("请选择","")); 
				$.getJSON(url,listParams, function(json){ 
					var str="";
					$.each(json.data, function(i,result) {
						var slscode = result.id;
						var slsname = result.dicName;
						slx.options.add(new Option(slsname,slscode)); 
						if(slsname==adrxq){
							$('#county_no_gn').html(slsname);
							slx_qj=slscode;
						}
						str+="<a href='javascript:void(0);' class='select_sty' onClick='county_no_l(\"" +  slsname + "\",\"" +  slscode + "\")'>"+slsname+"</a>";
					});	
					$('#wx_xzqh_qx').html(str);
				});
			}
		}
	</script>
   <script type="text/javascript">
	   //点击弹出层城市选择
 	 	function region(){
			if($("#layer").is(":hidden")){
				$("#layer_1").hide();
				$("#layer").slideDown(200);
			} else {
				$("#layer_1").hide();
				$("#layer").slideUp();
			}
		}
 	 	function region_l(name,code){
 	 		slx_qj="";
 	 		$('#region_l').html(name);
 	 		sjdz=name;
 	 		$('#county_no_gn').html("县区");
 	 		selectDictionary(code);
		}
		//点击关闭弹出层
		function down_none(){
			$("#layer").hide();
		}
		//县区弹出层
		function county(){
			if($("#layer_1").is(":hidden")){
				$("#layer").hide();
				$("#layer_1").slideDown(200);
			} else {
				$("#layer").hide();
				$("#layer_1").slideUp();
			}
		}
		//县区弹出层关闭
		function county_no(){
			$("#layer_1").slideUp();
 		}
		function scanlx(longitude,latitude){
			window.location.href = "jclx.jsp?longitude="+longitude+"&latitude="+latitude+"&newlongitude="+newlongitude+"&newlatitude="+newlatitude;
		}
		function county_no_l(name,code){
			$("#layer_1").hide();
			$('#county_no_gn').html(name);
			slx_qj=code;
			initDitu();
 		}
		//提示层
		function layer_show() {
			$('#prompt_box').show();	
		}
		//关闭提示层
		function layer_sub() {
			$('#prompt_box').hide();
		}
		function layer_clos() {
			$('#prompt_box').hide();	
		}
		// 切换地图、列表
		function tab(i){
			if($('#text1').html()!="切换地图"){
				$('#text1').html("切换地图");
				$('#lisebox_').show();
				$('#allmap').hide();
				//initDitu();
			}else{
				$('#text1').html("切换列表");
				$('#lisebox_').hide();
				$('#allmap').show();
			}
		}
		//点击窗口选择业务

	function gotodh(longitude,latitude){
	window.location.href = "jclx.jsp?longitude="+longitude+"&latitude="+latitude;
	
	}
	function gotoyy(longitude,latitude,code,openid){
	window.location.href = basePath+"/jsp/proscenium/yuyue.jsp?longitude="+longitude+"&latitude="+latitude+"&code="+code+"&openid="+openid;
	}
	
    </script>
</head>
<body>
	<div id="wrap">
        <header id="header">
        	<span style="float:left; padding-left:15px;">机构导航</span>
        	<a href="javascript:tab(1);" class="list_text"><img src="image/icon/addres_icon.png" alt="" width="12" height="15" /> <span style="vertical-align:middle;" id="text1"> 切换列表</span></a>
        </header>
        <section id="">
        	 <ul class="nav_box">
             	 <li style="width:49%;"><a href="javascript:void(0);" class="default" onClick="region();" id="region_l">长春市</a>
          			<div >
	           			<select id="sls" name="sls" style="width:120px; height: 20px;display:none;" onchange="selectDictionary(sls_qj);"></select> 
           			</div>
                 </li>
                 <li style="width:49%;"><a href="javascript:void(0);" onClick="county();" id="county_no_gn">县区</a>
                 	<select id="slx" name="slx" style="width: 120px; height: 20px;display:none" onchange="initDitu();">
					    <option >请选择</option>
				     </select>
                 </li>
             </ul>
	        <div class="list_content_box" style="display:none;"  id="lise_box"></div>
        </section>
    </div>
    <!-- 选择城市弹出层 -->
    <div class="city_box" style="top:85px;display:none;" id="layer">
    	<div>
            <div id="wx_xzqh" class="screening_box"></div>
            <a href="javascript:down_none();" style="text-align:center; width:100%; display:block; height:40px;"  class="close_icon_img"><img src="image/icon/down_icon.png" width="25" height="18" /></a>
        </div>
    </div>
    <!-- 选择县区弹出层 -->
    <div class="city_box" id="layer_1" style="top:85px; display:none;">
    	<div>
             <div id="wx_xzqh_qx" class="screening_box"></div>
             <a href="javascript:county_no(0);" style="text-align:center; width:100%; display:block; height:40px;"  class="close_icon_img"><img src="image/icon/down_icon.png" width="25" height="18" /></a>
        </div>
    </div>
	<div class="time_box_new" style="z-index:9" id="lisebox_">
        <div class="my_location"><p id="adr"></p> </div>
        <div class="list_wrap list_box_" id="addr_box" style="max-height:460px;">
            <ul class="lise_box" id="ditu_lise_box"></ul>
        </div>
    </div> 
	<div id="allmap" style="width: 100%; height:515px; text-align: center; margin:0 auto;display:none;"></div>
</body>
</html>