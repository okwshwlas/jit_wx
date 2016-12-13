<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="/WEB-INF/tld/c.tld" prefix="c"%>
<%
	String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
    //微信用户唯一标识
    String openid = request.getParameter("openid");
    String els = request.getParameter("els");
    String dhhm = request.getParameter("dhhm");
    //String openid = "123456";
     String newlatitude = request.getParameter("newlatitude");
     String newlongitude = request.getParameter("newlongitude");
     String adr = request.getParameter("adr");
     String sjdz = request.getParameter("adrcs");
	 String adrxq = request.getParameter("adrxq");
	 String count = request.getParameter("count");
	 String dhjgdwid = request.getParameter("dhjgdwid");
	 String jgdwname = request.getParameter("jgdwname");
	 
%> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"/>
<script type="text/javascript">
var path= '<%=path%>';
var openid='<%=openid%>';
var els='<%=els%>';
var dhhm='<%=dhhm%>';
var basePath='<%=basePath%>';

var newlatitude = '<%=newlatitude%>';
var newlongitude ='<%=newlongitude%>';
var adr = '<%=adr%>';
var sjdz='<%=sjdz%>';
var adrxq='<%=adrxq%>';
var count='<%=count%>';
var dhjgdwid='<%=dhjgdwid%>';
var jgdwname='<%=jgdwname%>';


</script>
<title>服务机构导航</title>
<link href="<%=basePath%>/jsp/proscenium/lib/style/default.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>/jsp/proscenium/lib/style/index3.css">
<link rel="stylesheet" href="<%=basePath%>/jsp/proscenium/lib/Validform_v5.3.2/demo/css/style.css" type="text/css" media="all" />
<script type="text/javascript" src="<%=basePath%>/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/jsp/proscenium/lib/Validform_v5.3.2/demo/js/Validform_v5.3.2.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/My97Date/WdatePicker.js" charset="utf-8"></script>
<script type="text/javascript" src="<%=basePath%>/jsp/proscenium/lib/layer-v2.1/layer/layer.js"></script>
	<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=KWe2TezxgWBDms0PYjeXBZWt"></script>
    <link href="<%=basePath%>/jsp/proscenium/style/contents.css" type="text/css"  rel="stylesheet"  />
     <link href="<%=basePath%>/jsp/proscenium/style/loadding.css" type="text/css"  rel="stylesheet"  />
	<style type="text/css">
 
	</style>
    <link href="<%=basePath%>/jsp/proscenium/style/contents.css" type="text/css"  rel="stylesheet"  />
	<script>var sqid = "2200";</script>
		<script type="text/javascript">
		var sls_qj="22010000";
		var slx_qj="";
		var slx_name="";
		var Strid="";
		var dateS="";
		var dateE="";
		var saworktimeId ="";
		var sajgdwName="jgdwname";
		var sajgdwywdwdz="";
		
		
	function change1(){
 		var d =$('#riqi1').val();
 	//	$('#prompt_box').hide();	
		//$('.mask_layer').hide();
	//	$('#lisebox_').hide();
// 		$('#time_box').slideUp();	
 		if(dateCompare(d,getdate())){
 			alert("预约日期不能小于当前日期！");
 			return false; 
 		}
 		if(dateCompare(addDate(getdate(),9),d)){
 			alert("只能预约日期不能大于"+addDate(getdate(),9));
 			return false; 
 		}
 		findxxByid(d);
 	}
	function getdate()
	{
		var now=new Date();
		var y=now.getFullYear();
		var m=now.getMonth()+1;
		var d=now.getDate();
		m=m<10?"0"+m:m;
		d=d<10?"0"+d:d;
		return y+"-"+m+"-"+d;
		}
	function addDate(dd,dadd){
		var a = new Date(dd);
		a = a.valueOf();
		a = a + dadd * 24 * 60 * 60 * 1000;
		a = new Date(a);
		var y=a.getFullYear();
		var m=a.getMonth()+1;
		var d=a.getDate();
		return y+"-"+m+"-"+d;
		}
		//地图提示窗口设置
		var opts = {
			width : 350,     // 信息窗口宽度
			height: 150,     // 信息窗口高度
			enableMessage:true//设置允许信息窗发送短息
		};
		//地图点击事件
		function addClickHandlerList(jgdwName, id, jgdwywtsxx, jgdwywdwdz,juli) {
			var riqi = $("#riqi1").val();
				
				var today="";
				if(riqi==getdate()){
					today="1";
				}
				//openInfo1(title,content,e,map);
				var str="";
				str+="<a href='javascript:time_clos(0);' class='close_icon' style='top:10px;' ><img src='image/icon/down_icon.png' width='25' height='18' /></a>";
				str+="<ul class='time_main'><li>";
				str+="<p>"+jgdwName+"</p>";
				str+="<p>"+jgdwywdwdz+" <img src='<%=basePath%>/jsp/proscenium/image/icon/addres_icon1.png' width='10' height='12' /></p>";
				str+="<p class='text_color'>"+jgdwywtsxx+"</p>";
				str+="<span class='time_main_icon'><img src='<%=basePath%>/jsp/proscenium/image/icon/time_icon2.png' width='32' height='32'  /></span>";
				str+="</li>";
					var myDate = new Date();
					var url = basePath + "/proscenium/crjRyjbxxController//weixin/WX_findTimeJgdwById.do?random=" + Math.random();
					var listParams = {
							"riqi" : riqi,
							"jgid" : id
				 	};
					$.ajaxSettings.async = false; 
					$.getJSON(url,listParams, function(json){
						if (json.code == "000000") {
							$.each(json.data,function(j, resultList) {
								if(today=="1"){
									if(resultList.startTime.substr(0,2)>myDate.getHours()){
										
										str+="<li><p><span>" + resultList.startTime + " ~ " + resultList.endTime;
										if (resultList.sysl != "0") {
											str+=" (剩余 " + resultList.sysl + "人)</span><a href='javascript:time_clos(0);' ";
											str+=" onclick='addYuYueXinxi(\"" +  jgdwywtsxx + "\",\"" +  resultList.id + "\",\"" + jgdwName + "\",\"" + jgdwywdwdz + "\",\"" + resultList.startTime + " ~ " + resultList.endTime + "\")' class='btn_appoin'>预 约</a></p>";
							            	
										} else {
											str+=" (预约已满)</p>";
										}
										
										str+='<span class="time_main_icon"><img src="image/icon/time_icon2.png" width="32" height="32"  /></span></li>';
										
									}
									
								}else{
									str+="<li><p><span>" + resultList.startTime + " ~ " + resultList.endTime;
									if (resultList.sysl != "0") {
										str+=" (剩余 " + resultList.sysl + "人)</span><a href='javascript:time_clos(0);' onclick='addYuYueXinxi(\"" +  jgdwywtsxx + "\",\"" +  resultList.id + "\",\"" + jgdwName + "\",\"" + jgdwywdwdz + "\",\"" + resultList.startTime + " ~ " + resultList.endTime + "\")' class='btn_appoin'>预 约</a></p>";
						            	
									} else {
										str+=" (预约已满)</p>";
									}
									str+='<span class="time_main_icon"><img src="image/icon/time_icon2.png" width="32" height="32"  /></span></li>';
								}
							
							str+="</ui>";
							$('#time_box').html(str);
							adders_clos();
						});
						}else{
							alert("您选择的预约地点没有可以预约时间段了！");
						}
					});
		
				
		}
		//地图点击事件
		function addClickHandler(title, content, marker, map, jgdwName, list, jgdwywtsxx, jgdwywdwdz,juli,id)  {
			
			marker.addEventListener("click",function(e){
				var riqi = $("#riqi1").val();
				
				var today="";
				if(riqi==getdate()){
					today="1";
				}
				
				//openInfo1(title,content,e,map);
				var str="";
				str+="<a href='javascript:time_clos(0);' class='close_icon' style='top:10px;' ><img src='image/icon/down_icon.png' width='25' height='18' /></a>";
				str+="<ul class='time_main'><li>";
				str+="<p>"+jgdwName+"</p>";
				str+="<p>"+jgdwywdwdz+" <img src='<%=basePath%>/jsp/proscenium/image/icon/addres_icon1.png' width='10' height='12' /></p>";
				str+="<p class='text_color'>"+jgdwywtsxx+"</p>";
				str+="<span class='time_main_icon'><img src='<%=basePath%>/jsp/proscenium/image/icon/time_icon2.png' width='32' height='32'  /></span>";
				str+="</li>";

					var myDate = new Date();
					var url = basePath + "/proscenium/crjRyjbxxController//weixin/WX_findTimeJgdwById.do?random=" + Math.random();
					var listParams = {
							"riqi" : riqi,
							"jgid" : id
				 	};
					$.ajaxSettings.async = false; 
					$.getJSON(url,listParams, function(json){
						if (json.code == "000000") {
							$.each(json.data,function(j, resultList) {
								// 准备URL和参数列表
				    			var urltsxx = basePath + "/proscenium/crjRyjbxxController/yuyue/findJgdwById.do?random=" + Math.random();
				    			var listParamstsxx = {
				    					"jgdwid" : resultList.id
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
											jgdwywtsxx=" ";
										}
										if(juli == undefined){
											juli="";
										}
				    				}
				    				
				    			});
								
								if(today=="1"){
									if(resultList.startTime.substr(0,2)>myDate.getHours()){
										
										str+="<li><p><span>" + resultList.startTime + " ~ " + resultList.endTime;
										if (resultList.sysl != "0") {
											str+=" (剩余 " + resultList.sysl + "人)</span><a href='javascript:time_clos(0);' ";
											str+=" onclick='addYuYueXinxi(\"" +  jgdwywtsxx + "\",\"" +  resultList.id + "\",\"" + jgdwName + "\",\"" + jgdwywdwdz + "\",\"" + resultList.startTime + " ~ " + resultList.endTime + "\")' class='btn_appoin'>预 约</a></p>";
							            	
										} else {
											str+=" (预约已满)</p>";
										}
										
										str+='<span class="time_main_icon"><img src="<%=basePath%>/jsp/proscenium/image/icon/time_icon2.png" width="32" height="32"  /></span></li>';
										
									}
									
								}else{
									str+="<li><p><span>" + resultList.startTime + " ~ " + resultList.endTime;
									if (resultList.sysl != "0") {
										str+=" (剩余 " + resultList.sysl + "人)</span><a href='javascript:time_clos(0);' onclick='addYuYueXinxi(\"" +  jgdwywtsxx + "\",\"" +  resultList.id + "\",\"" + jgdwName + "\",\"" + jgdwywdwdz + "\",\"" + resultList.startTime + " ~ " + resultList.endTime + "\")' class='btn_appoin'>预 约</a></p>";
						            	
									} else {
										str+=" (预约已满)</p>";
									}
									str+='<span class="time_main_icon"><img src="<%=basePath%>/jsp/proscenium/image/icon/time_icon2.png" width="32" height="32"  /></span></li>';
								}
							
							str+="</ui>";
							$('#time_box').html(str);
							adders_clos();
						});
						}else{
							alert("您选择的预约地点没有可以预约时间段了！");
						}
					});
			});
		}
	
		//显示提示
		function openInfo1(title, content, e, map){
			var p = e.target;
			var point = new BMap.Point(p.getPosition().lng, p.getPosition().lat);
			var infoWindow = new BMap.InfoWindow(content,opts);  // 创建信息窗口对象 
			//infoWindow.setTitle("单位名称："+title);
			map.openInfoWindow(infoWindow, point); //开启信息窗口
		}
		var map = "";
		
		// 初始化页面
// 		$(function() {
// 			$('#flag').val('0');
// 			navigator.geolocation.getCurrentPosition( // 该函数有如下三个参数
// 		            function(pos){ // 如果成果则执行该回调函数
// //	 	                alert(
// //	 	                    '  经度：' + pos.coords.latitude +
// //	 	                    '  纬度：' + pos.coords.longitude
// //	 	                );
// 		            	newlatitude = pos.coords.latitude+0.0072;
// 		            	newlongitude = pos.coords.longitude+0.013;

// 		            }, function(err){ // 如果失败则执行该回调函数
// 		            	alert("因为不能够获取到您的坐标，默认定位为长春市！");
		            	
// 		                //alert(err.message);
// 		            }, { // 附带参数
// 		                enableHighAccuracy: false, // 提高精度(耗费资源)
// 		                timeout: 2000, // 超过timeout则调用失败的回调函数
// 		                maximumAge: 1000 // 获取到的地理信息的有效期，超过有效期则重新获取一次位置信息
// 		            }
// 		        );
// 				initpage();
// 		});
		
		// 初始化页面 定位*********start************
		$(document).ready(function(){
		$("#riqi1").val(getdate());
			findxxByid(getdate());
			//$("#riqi").val(getdate());
			
		});
		
		function convertDitu(longitude,latitude){
			$.get( basePath + "/corecontroller/convertdituzb.do",{"longitude":longitude,"latitude":latitude},function(data){
				newlongitude = data.longitude;
				newlatitude = data.latitude;
				initpage();
				tab(0);
			},'json');
		}
		
		// 定位*********end************
		
		function addzero(v) {if (v < 10) return '0' + v;return v.toString();}
		function initpage(){
// 初始化受理地所在市信息
			
			//var sls = document.getElementById("sls");
			// sls.options.add(new Option("请选择","")); 
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
					//document.getElementById("k").value = namecity;
					/* if(slsname.length>5){
						slsname=slsname.substring(0,4)+'..';
					} */
					str+="<a href='javascript:void(0);' class='select_sty' onClick='region_l(\"" +  slsname + "\",\"" +  slscode + "\")'>"+slsname+"</a>";
					
					//str+="<a href='javascript:void(0);' onClick='selectDictionary("+slscode+")' class='select_sty'>"+slsname+"</a>";
					
				});	
				$('#wx_xzqh').html(str);
			});
			// 初始化预约日期
			var riqi = document.getElementById("riqi");
			// sls.options.add(new Option("请选择","")); 
			var url = basePath + "/proscenium/crjRyjbxxController/yuyue/initYuyueRiqi.do?random=" + Math.random();
			var listParams = {
				
		 	};
			$.ajaxSettings.async = false;
			$.getJSON(url,listParams, function(json){
				var initriqi = "";
				var endriqi = "";
				var riqistr = "";
				$.each(json.data, function(i,result) {
					if (i == 0) {
						initriqi = result.riqi;
					}
					endriqi = result.riqi;
					riqistr = riqistr + "'"+result.riqi+"',";
					var riqivar = result.riqi;
					riqi.options.add(new Option(riqivar, riqivar));
					
				});		
				
				riqistr = riqistr.substring(0,riqistr.length-1);
				dateS=initriqi;
				var d = new Date();
				var newDate = d.getFullYear().toString() +'-' +addzero(d.getMonth() + 1) +'-' + addzero(d.getDate()+ 1);
				if(sjdz=='长春市'){
					$(".mask_layer").show();
	 	 			$('#tip_layer').show();
					$("#riqi1").attr("value",newDate);
					//document.getElementById('riqi1').valueAsDate = new Date();
					//$("#riqi1").attr("onclick","WdatePicker({dateFmt:'yyyy-MM-dd' ,minDate: '"+initriqi+"', maxDate: '"+endriqi+"'   });");
					$("#riqi1").attr("onFocus","WdatePicker({dateFmt:'yyyy-MM-dd' ,minDate: '%y-%M-{%d+1}', maxDate: '%y-%M-{%d+7}' , opposite:true,readOnly:true });");
					
				}else{
					$("#riqi1").attr("value",initriqi);
					//document.getElementById('riqi1').valueAsDate = new Date();
					//$("#riqi1").attr("onclick","WdatePicker({dateFmt:'yyyy-MM-dd' ,minDate: '"+initriqi+"', maxDate: '"+endriqi+"'   });");
					$("#riqi1").attr("onFocus","WdatePicker({dateFmt:'yyyy-MM-dd' ,minDate: '%y-%M-%d}', maxDate: '%y-%M-{%d+9}' , opposite:true,readOnly:true });");
					
				}
				//onclick="WdatePicker({dateFmt:'yyyy-MM-dd' ,minDate: '2016-03-20', maxDate: '2016-04-02'   });"
				
				//document.getElementById("riqi").value = initriqi;
				
				
			});
			// 初始化受理所在地赋值(根据1.:p2:上次预约地点3:户籍所在地4:默认长春)
			$.ajax({
				type : 'get',
				url : basePath+"/proscenium/crjRyjbxxController/yuyue/initYuyueSls.do",
				data : {
				},
				dataType : "text",
				success : function(ret) {
					var obj = jQuery.parseJSON(ret);
					if (obj.code == "000000") {
						$("#sls option").each(function () {
						    if($(this).text() == obj.data) {
						    	
						        $(this).attr('selected',true);
						        initselectDictionary(sls_qj);
						    }
						});
					}
				}
			});
		}
		function dateCompare(startdate,enddate)   
		{   
		var arr=startdate.split("-");    
		var starttime=new Date(arr[0],arr[1],arr[2]);    
		var starttimes=starttime.getTime();   
		  
		var arrs=enddate.split("-");    
		var lktime=new Date(arrs[0],arrs[1],arrs[2]);    
		var lktimes=lktime.getTime();   
		  
		if(starttimes>=lktimes)    
		{   
		return false;   
		}   
		else  
		return true;   
		  
		}
		// 添加预约信息
		function addYuYueXinxi(jgdwywtsxx,id, jgdwName,jgdwywdwdz, setime) {
// 			//$('#txt').focus();


			$("#worktimeId").val(id);
			saworktimeId = id;
			sajgdwName = jgdwName;
			sajgdwywdwdz= jgdwywdwdz;
			$("#jgdwName").val(jgdwName);
			$("#jgdwywdwdz").val(jgdwywdwdz);
// // 4-13old			$("#txt").html("预约信息：您预约" + jgdwName + "(" + $("#riqi").val() + " " + setime + ")");
// 			$("#txt").html("预约信息：您预约" + jgdwName + "(" + $("#riqi1").val() + " " + setime + ")" ); // 4-13new
// // 			$("body,html").animate({scrollTop:$("#txt").offset().top});
// 			map.closeInfoWindow();
// 			var truthBeTold = window.confirm("预约信息：您预约" + jgdwName + "(" + $("#riqi1").val() + " " + setime + ")"+"\n"+jgdwywtsxx);
// 			if (truthBeTold) {
// 				addYuYue()
// 			}
			var str = "";
			str+='<h2 class="succe_tit">消息提示</h2>';
			str+='<ul class="succe_main"><li>';
            	str+='<p class="li_p"><span>预约时间：</span>'+$("#riqi1").val()+' '+setime+'</p>';
            	str+='<p class="li_p1"><span>网点：</span>' + jgdwName + '</p>';
            	str+='<p class="li_p1"><span>网点地址：</span>' + jgdwywdwdz + '</p></li></ul>';
            	str+='<p class="hit">提示：预约申请每天一次，请慎重操作！</p>';
            	str+='<div style="width:80%; margin:0px auto; padding:15px 0;"><a href="javascript:void(0);" id="layer_sub" onclick="layer_sub();" class="btn_confirm">确 定</a><a href="javascript:void(0);" onclick="layer_clos();" class="btn_confirm btn_can">取 消</a></div>';
			$('#prompt_box').html(str);
			$('#prompt_box').show();
			$('.mask_layer').show();
		}
		
		function initDitu() {
			$('#ditu_lise_box').html("");
			$('#lise_box').append("");
			var h = document.documentElement.clientHeight;
			document.getElementById('allmap').style.height = h - 85 + "px";
			$("#table111").html("");
			$("#worktimeId").val("");
			$("#jgdwName").val("");
			$("#txt").html("");
			$("#jgdwywdwdz").val("");
			var riqi = $("#riqi1").val();
			var sls = sls_qj;
			var slx = slx_qj;
			var today="";
			if(riqi==getdate()){
				today="1";
			}
			// 准备URL和参数列表
			var url = basePath + "/proscenium/crjRyjbxxController/yuYue/findYuYueByRJ.do?random=" + Math.random();
			var listParams = {
					"riqi" : riqi,
					"count" : count,
					"sls" : sls,
					"slx" : slx
			};
			$.ajaxSettings.async = false; 
			// 发出请求并处理返回数据
			$('#danweiList').html("");
			$('#lise_box').html("");
			$.getJSON(url,listParams, function(json) {
				if (json.code == "000000" ) {
 					map = new BMap.Map("allmap");
					if (json.data != ''&&json.jgdwId==dhjgdwid) {
 						var latitude = json.data[0].latitude;
 						var longitude = json.data[0].longitude;
		
 						var point = new BMap.Point(longitude, latitude);
 						
 						//var point = new BMap.Point(125.328459, 43.891125);
 						map.centerAndZoom(point, 12);
 						map.enableScrollWheelZoom(true);
 						var iconUser = new BMap.Icon('<%=basePath%>/jsp/proscenium/image/user2.png', new BMap.Size(30, 30), {//是引用图标的名字以及大小，注意大小要一样
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
								
								  var icon = new BMap.Icon('<%=basePath%>/jsp/proscenium/image/_green.png', new BMap.Size(30, 30), {//是引用图标的名字以及大小，注意大小要一样
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
				            	
				            	var jgdwywtsxx="";
				            	var jgdwywdwdz="";
				            	// 准备URL和参数列表
				    			var urltsxx = basePath + "/proscenium/crjRyjbxxController/yuyue/findJgdwById.do?random=" + Math.random();
				    			var listParamstsxx = {
				    					"jgdwid" : dhjgdwid
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
											jgdwywtsxx=" ";
										}
										if(juli == undefined){
											juli="";
										}
				    				}
				    				
				    			});
				    			strlist+='<div class="list_main"><dl class="list_dl_box"><dt>';
				            	 if(i%2==0)  //取模 求余数\
				            	 {
				            		 strlist+='<img src="<%=basePath%>/jsp/proscenium/image/icon/lv_icon1.png" alt="" width="40" height="40" />';
				            	  
				            	  }else{
				            		  strlist+='<img src="<%=basePath%>/jsp/proscenium/image/icon/huang_icon1.png" alt="" width="40" height="40" />';
				            	  }
				            	strlist+='</dt><dd>';
				            	strlist+='<p>'+ result.jgdwName +'</p>';
				            	strlist+='<p>'+ jgdwywdwdz +' <img src="<%=basePath%>/jsp/proscenium/image/icon/addres_icon1.png" alt="" /></p></dd>';
				            	strlist+='<span class="text_position">'+juli+'米</span></dl><ul class="list_ul_box">';
				            	
								$.each(result.listSysWorktime, function(j, resultList) {
									 var myDate = new Date();
									if(today=="1"){
										if(resultList.startTime.substr(0,2)>myDate.getHours()){
											content+="<tr>";
								            content+="<td>" + resultList.startTime + " ~ " + resultList.endTime;
											if (resultList.sysl != "0") {
								            	content+=" (已预约:" + resultList.yysl + "人,剩余预约人数:" + resultList.sysl + "人)   <a href='javascript:void(0)' onclick='addYuYueXinxi(\"" +  jgdwywtsxx + "\",\"" +  resultList.id + "\",\"" + result.jgdwName + "\",\"" + resultList.startTime + " ~ " + resultList.endTime + "\")'>预约</a></td>";   
								            	content+="<td></td>";
								            	content+="</tr>";
											} else {
												content+=" (预约已满)</td>";
											}
											content+="</tr>";
											
											strlist+='<li style="width: 33%" onclick="addYuYueXinxi(\'' +  jgdwywtsxx + '\',\'' +  resultList.id + '\',\'' + result.jgdwName + '\',\'' + jgdwywdwdz + '\',\'' + resultList.startTime + ' ~ ' + resultList.endTime +'\')"><p>约</p><p>';
											strlist+=resultList.startTime + " ~ " + resultList.endTime;
											if (resultList.sysl != "0") {
								            	strlist+='</p><p>(剩余'+ resultList.sysl + '人)</p></li>';
											} else {
												strlist+='</p><p>(预约已满)</p></li>';
											}
											
											
											var content1 = '' ;//
											
											content1+="<tr>";//
											if( flre !=  result.jgdwName){
												content1+="<td>" + result.jgdwName +'</td>';
												flre = result.jgdwName;
											}else{
												content1+="<td></td>";
											}
											
											content1+="<td align='center'>" + resultList.startTime + " ~ " + resultList.endTime+'</td>';//
											content1+="<td align='center'> " + resultList.yysl + "</td>";
											content1+="<td align='center'> " + resultList.sysl + "</td>";
											if( resultList.sysl == 0){
												content1+="<td align='center'>预约人数已满</td>"
											}else{
								            	content1+="<td><a href='javascript:void(0)' onclick='addYuYueXinxi(\"" +  jgdwywtsxx + "\",\"" +  resultList.id + "\",\"" + result.jgdwName + "\",\"" + resultList.startTime + " ~ " + resultList.endTime + "\")'>预约</a></td>";
											}
							            	content1+="</tr>";//
											$('#table111').append(content1);
										}else{
											strlist+='<li><p>约</p><p>';
											strlist+=resultList.startTime + " ~ " + resultList.endTime;
											
											strlist+='</p><p>(预约时间已过)</p></li>';
										}
										
									}else{
										content+="<tr>";
							            content+="<td>" + resultList.startTime + " ~ " + resultList.endTime;
										if (resultList.sysl != "0") {
							            	content+=" (已预约人数:" + resultList.yysl + "人,剩余预约人数:" + resultList.sysl + "人)</td>";
							            	content+="<td><a href='javascript:void(0)' onclick='addYuYueXinxi(\"" +  jgdwywtsxx + "\",\"" +  resultList.id + "\",\"" + result.jgdwName + "\",\"" + resultList.startTime + " ~ " + resultList.endTime + "\")'>预约</a></td>";
							            	content+="</tr>";
										} else {
											content+=" (预约已满)</td>";
										}
										content+="</tr>";
										
										strlist+='<li  onclick="addYuYueXinxi(\'' +  jgdwywtsxx + '\',\'' +  resultList.id + '\',\'' + result.jgdwName + '\',\'' + jgdwywdwdz + '\',\'' + resultList.startTime + ' ~ ' + resultList.endTime +'\')"><p>约</p><p>';
										strlist+=resultList.startTime + " ~ " + resultList.endTime;
										if (resultList.sysl != "0") {
							            	strlist+='</p><p>(剩余'+ resultList.sysl + '人)</p></li>';
										} else {
											strlist+='</p><p>(预约已满)</p></li>';
										}
										
										
										var content1 = '' ;//
										
										content1+="<tr>";//
										if( flre !=  result.jgdwName){
											content1+="<td>" + result.jgdwName +'</td>';
											flre = result.jgdwName;
										}else{
											content1+="<td></td>";
										}
										
										content1+="<td align='center'>" + resultList.startTime + " ~ " + resultList.endTime+'</td>';//
										content1+="<td align='center'> " + resultList.yysl + "</td>";
										content1+="<td align='center'> " + resultList.sysl + "</td>";
										if( resultList.sysl == 0){
											content1+="<td align='center'>预约人数已满</td>"
										}else{
							            	content1+="<td><a href='javascript:void(0)' onclick='addYuYueXinxi(\"" +  jgdwywtsxx + "\",\"" +  resultList.id + "\",\"" + result.jgdwName + "\",\"" + resultList.startTime + " ~ " + resultList.endTime + "\")'>预约</a></td>";
										}
						            	content1+="</tr>";//
										$('#table111').append(content1);
									}
									
									
								});
								content+="</table>";
								
								var label = new BMap.Label(title, {offset:new BMap.Size(0,20)});
								
				            	marker.setLabel(label);
				                map.addOverlay(marker);  
				                

				                // 将标注添加到地图中
				               // addClickHandler(title, content, marker, map, result.jgdwName, result.listSysWorktime, jgdwywtsxx, jgdwywdwdz,juli,jgdwid) ;
				                strditulist=strditulist+'<li><span>'+result.jgdwName+'</span><span class="addres_color">'+jgdwywdwdz+' <i class="text_color distance_num">'+juli+'米</i> </span><a href="javascript:void(0);" onClick="addClickHandlerList(\'' + result.jgdwName + '\',\'' + jgdwid + '\',\'' + jgdwywtsxx + '\',\'' + jgdwywdwdz + '\',\'' + juli + '\');" class="btn_appoin btn_right">预约</a></li>';
				                strlist+='</ul><span class="icon_right"><img src="image/icon/icon_you.png" alt="" width="12" height="20" /></span></div>';
				                
							}
						});
						
						
						$('#ditu_lise_box').html(strditulist);
						$('#lise_box').append(strlist);
						$('#lise_box_p').html("");
						$('#lise_box_map').html("提示：点击下方地点按钮选择预约时间！");
					} else {
						$('#lise_box_map').html("您选择的时间和地区没有可以预约的受理网点，请重新选择！");
						$('#lise_box').html('<p class="hit" id="lise_box_p">您选择的时间和地区没有可以预约的受理网点，请重新选择！</p>');
						map.centerAndZoom(sjdz,12);  //初始化地图,设置城市和地图级别。
						var iconUser = new BMap.Icon('<%=basePath%>/jsp/proscenium/image/user2.png', new BMap.Size(30, 30), {//是引用图标的名字以及大小，注意大小要一样
			                anchor: new BMap.Size(13, 28)//这句表示图片相对于所加的点的位置
		                });
						var pointA = new BMap.Point(newlongitude,newlatitude);  // 创建点坐标A--大渡口区
						var gc = new BMap.Geocoder();
 		                gc.getLocation(pointA, function(rs){
 		            		var addComp = rs.addressComponents;
 		            		/* var adr="位于: "+addComp.province + ", " + addComp.city + ", "
 		            			+ addComp.district + ", " + addComp.street + ", " + addComp.streetNumber; */
 		            		adr=addComp.district + addComp.street +  addComp.streetNumber+"附近"
 		            		//创建信息窗口，点击标注时显示标注对应的车牌号码以及当前地址 
 //		             		var infoWindow1 = new BMap.InfoWindow(adr);
 //		             		marker.addEventListener("click", function(){this.openInfoWindow(infoWindow1);});
 						});
						var markerUser = new BMap.Marker((new BMap.Point(newlongitude, newlatitude)), {icon : iconUser});  // 创建标注
						var labelUser = new BMap.Label("当前位置", {offset:new BMap.Size(0,20)});
						markerUser.setLabel(labelUser);
						map.addOverlay(markerUser);
					}
				} else {
					alert(json.msg);
				}
				
			});
		}
		function init_Ditu() {
			
			var h = document.documentElement.clientHeight;
			document.getElementById('allmap').style.height = h - 85 + "px";
			$("#table111").html("");
			$("#worktimeId").val("");
			$("#jgdwName").val("");
			$("#txt").html("");
			$("#jgdwywdwdz").val("");
			var riqi = $("#riqi1").val();
			var sls = sls_qj;
			var slx = slx_qj;
			var today="";
			if(riqi==getdate()){
				today="1";
			}
			// 准备URL和参数列表
			var url = basePath + "/proscenium/crjRyjbxxController/yuYue/findYuYueByRJ.do?random=" + Math.random();
			var listParams = {
					"riqi" : riqi,
					"count" : count,
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
 						var iconUser = new BMap.Icon('<%=basePath%>/jsp/proscenium/image/user2.png', new BMap.Size(30, 30), {//是引用图标的名字以及大小，注意大小要一样
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
								
								  var icon = new BMap.Icon('<%=basePath%>/jsp/proscenium/image/_green.png', new BMap.Size(30, 30), {//是引用图标的名字以及大小，注意大小要一样
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
												jgdwywtsxx=" ";
											}
											if(juli == undefined){
												juli="";
											}
				    				}
				    				
				    			});
				    			strlist+='<div class="list_main"><dl class="list_dl_box"><dt>';
				            	 if(i%2==0)  //取模 求余数\
				            	 {
				            		 strlist+='<img src="<%=basePath%>/jsp/proscenium/image/icon/lv_icon1.png" alt="" width="40" height="40" />';
				            	  
				            	  }else{
				            		  strlist+='<img src="<%=basePath%>/jsp/proscenium/image/icon/huang_icon1.png" alt="" width="40" height="40" />';
				            	  }
				            	strlist+='</dt><dd>';
				            	strlist+='<p>'+ result.jgdwName +'</p>';
				            	strlist+='<p>'+ jgdwywdwdz +' <img src="<%=basePath%>/jsp/proscenium/image/icon/addres_icon1.png" alt="" /></p></dd>';
				            	strlist+='<span class="text_position">'+juli+'米</span></dl><span class="text_position"></span></dl><ul class="list_ul_box">';
				            	
								$.each(result.listSysWorktime, function(j, resultList) {
									 var myDate = new Date();
									if(today=="1"){
										if(resultList.startTime.substr(0,2)>myDate.getHours()){
											content+="<tr>";
								            content+="<td>" + resultList.startTime + " ~ " + resultList.endTime;
											if (resultList.sysl != "0") {
								            	content+=" (已预约:" + resultList.yysl + "人,剩余预约人数:" + resultList.sysl + "人)   <a href='javascript:void(0)' onclick='addYuYueXinxi(\"" +  jgdwywtsxx + "\",\"" +  resultList.id + "\",\"" + result.jgdwName + "\",\"" + resultList.startTime + " ~ " + resultList.endTime + "\")'>预约</a></td>";   
								            	content+="<td></td>";
								            	content+="</tr>";
											} else {
												content+=" (预约已满)</td>";
											}
											content+="</tr>";
											
											strlist+='<li onclick="addYuYueXinxi(\'' +  jgdwywtsxx + '\',\'' +  resultList.id + '\',\'' + result.jgdwName + '\',\'' + resultList.startTime + ' ~ ' + resultList.endTime +'\')"><p>约</p><p>';
											strlist+=resultList.startTime + " ~ " + resultList.endTime;
											if (resultList.sysl != "0") {
								            	strlist+='</p><p>(剩余'+ resultList.sysl + '人)</p></li>';
											} else {
												strlist+='</p><p>(预约已满)</p></li>';
											}
											
											
											var content1 = '' ;//
											
											content1+="<tr>";//
											if( flre !=  result.jgdwName){
												content1+="<td>" + result.jgdwName +'</td>';
												flre = result.jgdwName;
											}else{
												content1+="<td></td>";
											}
											
											content1+="<td align='center'>" + resultList.startTime + " ~ " + resultList.endTime+'</td>';//
											content1+="<td align='center'> " + resultList.yysl + "</td>";
											content1+="<td align='center'> " + resultList.sysl + "</td>";
											if( resultList.sysl == 0){
												content1+="<td align='center'>预约人数已满</td>"
											}else{
								            	content1+="<td><a href='javascript:void(0)' onclick='addYuYueXinxi(\"" +  jgdwywtsxx + "\",\"" +  resultList.id + "\",\"" + result.jgdwName + "\",\"" + resultList.startTime + " ~ " + resultList.endTime + "\")'>预约</a></td>";
											}
							            	content1+="</tr>";//
											$('#table111').append(content1);
										}
										
									}else{
										content+="<tr>";
							            content+="<td>" + resultList.startTime + " ~ " + resultList.endTime;
										if (resultList.sysl != "0") {
							            	content+=" (已预约人数:" + resultList.yysl + "人,剩余预约人数:" + resultList.sysl + "人)</td>";
							            	content+="<td><a href='javascript:void(0)' onclick='addYuYueXinxi(\"" +  jgdwywtsxx + "\",\"" +  resultList.id + "\",\"" + result.jgdwName + "\",\"" + resultList.startTime + " ~ " + resultList.endTime + "\")'>预约</a></td>";
							            	content+="</tr>";
										} else {
											content+=" (预约已满)</td>";
										}
										content+="</tr>";
										
										strlist+='<li onclick="addYuYueXinxi(\'' +  jgdwywtsxx + '\',\'' +  resultList.id + '\',\'' + result.jgdwName + '\',\'' + jgdwywdwdz + '\',\'' + resultList.startTime + ' ~ ' + resultList.endTime +'\')"><p>约</p><p>';
										strlist+=resultList.startTime + " ~ " + resultList.endTime;
										if (resultList.sysl != "0") {
							            	strlist+='</p><p>(剩余'+ resultList.sysl + '人)</p></li>';
										} else {
											strlist+='</p><p>(预约已满)</p></li>';
										}
										
										var content1 = '' ;//
										
										content1+="<tr>";//
										if( flre !=  result.jgdwName){
											content1+="<td>" + result.jgdwName +'</td>';
											flre = result.jgdwName;
										}else{
											content1+="<td></td>";
										}
										
										content1+="<td align='center'>" + resultList.startTime + " ~ " + resultList.endTime+'</td>';//
										content1+="<td align='center'> " + resultList.yysl + "</td>";
										content1+="<td align='center'> " + resultList.sysl + "</td>";
										if( resultList.sysl == 0){
											content1+="<td align='center'>预约人数已满</td>"
										}else{
							            	content1+="<td><a href='javascript:void(0)' onclick='addYuYueXinxi(\"" +  jgdwywtsxx + "\",\"" +  resultList.id + "\",\"" + result.jgdwName + "\",\"" + resultList.startTime + " ~ " + resultList.endTime + "\")'>预约</a></td>";
										}
						            	content1+="</tr>";//
										$('#table111').append(content1);
									}
									
									
								});
								content+="</table>";
								
								var label = new BMap.Label(title, {offset:new BMap.Size(0,20)});
								
				            	marker.setLabel(label);
				                map.addOverlay(marker);  
				               

				                // 将标注添加到地图中
				                addClickHandler(title, content, marker, map, result.jgdwName, result.listSysWorktime, jgdwywtsxx, jgdwywdwdz,juli,jgdwid) ;
				                strditulist=strditulist+'<li><span>'+result.jgdwName+'</span><span class="addres_color">'+jgdwywdwdz+' <i class="text_color distance_num">'+juli+'米</i> </span><a href="javascript:void(0);" onClick="addClickHandlerList(\'' + result.jgdwName + '\',\'' + jgdwid + '\',\'' + jgdwywtsxx + '\',\'' + jgdwywdwdz + '\',\'' + juli + '\');" class="btn_appoin btn_right">预约</a></li>';
				                strlist+='</ul><span class="icon_right"><img src="<%=basePath%>/jsp/proscenium/image/icon/icon_you.png" alt="" width="12" height="20" /></span></div>';
				               
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
						var iconUser = new BMap.Icon('<%=basePath%>/jsp/proscenium/image/user2.png', new BMap.Size(30, 30), {//是引用图标的名字以及大小，注意大小要一样
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
		// 添加预约信息
		function addYuYue() {
			var worktimeId = saworktimeId;
		
			if (worktimeId == null || worktimeId == "") {
				alert("请在地图中选择预约地点和预约时间!");
			} else {
				$.ajax({
					type : 'post',
					async: false,
					url : basePath+"/proscenium/crjRyjbxxController/yuYue/addYuYueByWorktime.do",
					data : {
						'worktimeId' : worktimeId,
						'sqId' : sqid,
						'openid' : openid,
						'els' : els,
						'dhhm' : dhhm,
						'jgdwName' : sajgdwName,
						'jgdwywdwdz' : sajgdwywdwdz
					},
					dataType : "text",
					success : function(data) {
						var ret = data;
						if (ret.code == "000000") {
							Strid=ret.msg;
							var url  = "dhwx_tsxx.jsp?Strid="+Strid+"&openid="+openid;
							window.location.href = url;
							
						} else if (ret.code == "000002") {
							alert(ret.msg);
							window.location.reload();//刷新当前页面
						} else {
							// 状态栏，操作状态
 							window.location.href = 'dhwx_xxlb.jsp';
						}
					}
				});
			}
		}
		
		// 受理地所在区
		function selectDictionary(type) {
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
			initDitu();
		}
		// 受理地所在区
		function initselectDictionary(type) {
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
						$.each(json.data, function(i,result) {
							var slscode = result.id;
							var slsname = result.dicName;
							
							slx.options.add(new Option(slsname,slscode)); 
							if(slsname==adrxq){
							$('#county_no_gn').html(slsname);
							slx_qj=slscode;
							}
							/* if(slsname.length>5){
								slsname=slsname.substring(0,4)+'..';
							} */
							str+="<a href='javascript:void(0);' class='select_sty' onClick='county_no_l(\"" +  slsname + "\",\"" +  slscode + "\")'>"+slsname+"</a>";
							//str+="<a href='javascript:void(0);' class='select_sty' onClick='county_no();>"+slsname+"</a>";
							
						});	
						$('#wx_xzqh_qx').html(str);
					});
			}
			init_Ditu();
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
 	 		var d = new Date();
			if(name=='长春市'){
				newDate = d.getFullYear().toString() +'-' +addzero(d.getMonth() + 1) +'-' + addzero(d.getDate()+ 1);
				
				$(".mask_layer").show();
 	 			$('#tip_layer').show();
				$("#riqi1").attr("value",newDate);
				//document.getElementById('riqi1').valueAsDate = new Date();
				//$("#riqi1").attr("onclick","WdatePicker({dateFmt:'yyyy-MM-dd' ,minDate: '"+initriqi+"', maxDate: '"+endriqi+"'   });");
				$("#riqi1").attr("onFocus","WdatePicker({dateFmt:'yyyy-MM-dd' ,minDate: '%y-%M-{%d+1}', maxDate: '%y-%M-{%d+7}' , opposite:true,readOnly:true });");
				
			}else{
				newDate = d.getFullYear().toString() +'-' +addzero(d.getMonth() + 1) +'-' + addzero(d.getDate());
				
				$("#riqi1").attr("value",newDate);
				//document.getElementById('riqi1').valueAsDate = new Date();
				//$("#riqi1").attr("onclick","WdatePicker({dateFmt:'yyyy-MM-dd' ,minDate: '"+initriqi+"', maxDate: '"+endriqi+"'   });");
				$("#riqi1").attr("onFocus","WdatePicker({dateFmt:'yyyy-MM-dd' ,minDate: '%y-%M-%d}', maxDate: '%y-%M-{%d+9}' , opposite:true,readOnly:true });");
				
			}
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
		function county_no_l(name,code){
			$("#layer_1").hide();
			$('#county_no_gn').html(name);
			slx_qj=code;
			initDitu();
 			}
		//选择时间弹出层关闭
		function time_clos() {
			$('#time_box').hide();	
			
		}
			//当前位置 弹出层
		function adders_show() {
			if($("#addr_box").is(":hidden")){
				$('#addr_box').slideDown();
				$("#lisebox_ .close_icon").removeClass("close_icon_img");   //如果元素为隐藏,则将它显现
			} else {
				$('#addr_box').slideUp();	    //如果元素为显现,则将其隐藏
				$("#lisebox_ .close_icon").addClass("close_icon_img");
			}
			
		}
		//当前位置关闭弹出层
		function adders_clos() {
			$('#addr_box').slideUp();	
			$('#time_box').slideDown();	
			$("#lisebox_ .close_icon").addClass("close_icon_img");
		}
		//提示层
		function layer_show() {
			$('#prompt_box').show();	
			$('.mask_layer').show();
		}
		//关闭提示层
		function layer_sub() {
			$('#prompt_box').hide();
			laod();
			alert("您的预约已经提交！");
			addYuYue();
		}
		function layer_clos() {
			$('#prompt_box').hide();	
			$('.mask_layer').hide();
		}
		// 切换地图、列表
		function tab(){
			location = "dutuyy.jsp";
	

		}
		function tip_layer_hide(){
			$('#tip_layer').hide()
			$('.mask_layer').hide();
			}
		// lapdding 加载
function laod(){
		$(".mask_layer").show();
		$("#load1").show();	 
	}
		function findxxByid(riqi){
			
			
			var jgdwywtsxx="";
        	var jgdwywdwdz="";
        	// 准备URL和参数列表
			var urltsxx = basePath + "/proscenium/crjRyjbxxController/yuyue/findJgdwById.do?random=" + Math.random();
			var listParamstsxx = {
					"jgdwid" : dhjgdwid
			};
			
			$.ajaxSettings.async = false; 
			$.getJSON(urltsxx,listParamstsxx, function(json) {

				if (json.code == "000000") {
					jgdwywtsxx=json.beiYong1;
    				jgdwywdwdz=json.beiYong2;
    				jgdwName = json.data.name;
    				 if(jgdwywdwdz == undefined){
							jgdwywdwdz="预约地址尚未维护更新！";
						}
						if(jgdwywtsxx == undefined){
							jgdwywtsxx=" ";
						}
						
				}
				
			});
			
			
			
			var today="";
			if(riqi==getdate()){
				today="1";
			}
			//openInfo1(title,content,e,map);
			var str="";
			str+="<ul class='time_main'><li>";
			str+="<p>"+jgdwName+"</p>";
			str+="<p>"+jgdwywdwdz+" <img src='<%=basePath%>/jsp/proscenium/image/icon/addres_icon1.png' width='10' height='12' /></p>";
			str+="<p class='text_color'>"+jgdwywtsxx+"</p>";
			str+="<span class='time_main_icon'><img src='<%=basePath%>/jsp/proscenium/image/icon/time_icon2.png' width='32' height='32'  /></span>";
			str+="</li>";
				var myDate = new Date();
				var url = basePath + "/proscenium/crjRyjbxxController//weixin/WX_findTimeJgdwById.do?random=" + Math.random();
				var listParams = {
						"riqi" : riqi,
						"jgid" : dhjgdwid
			 	};
				$.ajaxSettings.async = false; 
				$.getJSON(url,listParams, function(json){
					if (json.code == "000000") {
						$.each(json.data,function(j, resultList) {
							if(today=="1"){
								if(resultList.startTime.substr(0,2)>myDate.getHours()){
									
									str+="<li><p><span>" + resultList.startTime + " ~ " + resultList.endTime;
									if (resultList.sysl != "0") {
										str+=" (剩余 " + resultList.sysl + "人)</span><a href='javascript:time_clos(0);' ";
										str+=" onclick='addYuYueXinxi(\"" +  jgdwywtsxx + "\",\"" +  resultList.id + "\",\"" + jgdwName + "\",\"" + jgdwywdwdz + "\",\"" + resultList.startTime + " ~ " + resultList.endTime + "\")' class='btn_appoin'>预 约</a></p>";
						            	
									} else {
										str+=" (预约已满)</p>";
									}
									
									str+='<span class="time_main_icon"><img src="image/icon/time_icon2.png" width="32" height="32"  /></span></li>';
									
								}else{
								
								str+="<li><p><span>" + resultList.startTime + " ~ " + resultList.endTime;
									
										str+=" </span><a class='btn_appoin '>已过时间段</a></p>";
										str+='<span class="time_main_icon"><img src="image/icon/time_icon2.png" width="32" height="32"  /></span></li>';
						            
								
								}
								
							}else{
								str+="<li><p><span>" + resultList.startTime + " ~ " + resultList.endTime;
								if (resultList.sysl != "0") {
									str+=" (剩余 " + resultList.sysl + "人)</span><a href='javascript:time_clos(0);' onclick='addYuYueXinxi(\"" +  jgdwywtsxx + "\",\"" +  resultList.id + "\",\"" + jgdwName + "\",\"" + jgdwywdwdz + "\",\"" + resultList.startTime + " ~ " + resultList.endTime + "\")' class='btn_appoin'>预 约</a></p>";
					            	
								} else {
									str+=" (预约已满)</p>";
								}
								str+='<span class="time_main_icon"><img src="image/icon/time_icon2.png" width="32" height="32"  /></span></li>';
							}
						
						str+="</ui>";
						$('#time_box').html(str);
						//adders_clos();
					});
					}else{
						$('#time_box').html('您选择的预约地点没有可以预约时间段了！')
						alert("您选择的预约地点没有可以预约时间段了！");
					}
				});
			
			
			
			
		}
    </script>
    <style>
/*     .time_box { po} */
    </style>
</head>
<body>
	<div class="mask_layer"></div>
	<div id="wrap" style="padding-top:110px;">
    	<header id="header" style=" position:fixed; top:0; left:0; width:100%;z-index:10;">
        	<span style="float:left; padding-left:15px;">快速预约</span>
        	<a href="javascript:tab();" value='1' class="list_text"><img src="<%=basePath%>/jsp/proscenium/image/icon/addres_icon.png" alt="" width="12" height="15" /> <span style="vertical-align:middle;" id="text1">返回机构导航</span></a>
        </header>
        <section id="">
        <div style=" position:fixed; top:40px; left:0; width:100%; z-index:9;">
        	 <ul class="nav_box" style="z-index:auto">
             
                 <li>
	              			<div style='display:none'>
	              			<select id="riqi" name="riqi" style="width: 120px" onchange="change1();"   >
						     </select>
	              			</div>
	              	<input  id='riqi1' type="text"  name="validUntil" onFocus="WdatePicker({readOnly:true})" onchange="change1()"   class="Wdate easyui-validatebox" /></li>
             </ul>
             <p class="hit" id="lise_box_map">提示：点击下方按钮选择预约时间</p>
            </div>
   
       
     
        </section>
        
    </div>
    <!-- 时间选择层 -->
    <div  style="z-index:10;" id="time_box">
        </div>
    <!-- end -->  
    <!-- laoding -->
    <div class="load-container load1" style="position:absolute; top:30%; left:50%; display:none; z-index:20" id="load1">
		<div class="loader">Loading...</div>
	</div>
	  <!-- 数据提示 -->
    	 <div class="succe_box" id="prompt_box" style="width:90%; margin:0  auto; display:none; z-index:15; position:fixed; top:30%; left:5%;">
         	
         </div>
	<!-- end -->
	<!-- 消息提示 -->
<div class="succe_box" style="position:absolute; top:5%; left:7.5%;width: 85%; margin: 0 auto; z-index:50; display:none;" id="tip_layer">
    <h2 class="succe_tit">消息提示</h2>
    <ul class="succe_main">
        <li  style="min-height: 100px;">
            <p style="padding-left: 0; padding: 10px 0; line-height: 35px; width: 90%;">具有以下情形的申请人只能预约市局出入境大厅</p>
            <p style="padding-left: 0; padding: 10px 0; line-height: 35px; width: 90%;">1、需要提交本人所属工作单位或者上级主管部门意见的国家工作人员</p>
            <p style="padding-left: 0; padding: 10px 0; line-height: 35px; width: 90%;">2、省外异地、省内异地持居住证的申请人</p>
            <p style="padding-left: 0; padding: 10px 0; line-height: 35px; width: 90%;">3、港澳、台湾旅游类签注以外的其他类签注</p>
            
        </li>
    </ul>
    <div style="width:60%; margin:0px auto; padding:15px 0; text-align: center;"><a href="javascript:tip_layer_hide(0);" class="btn_confirm" style="background-color:#d5d5d5;">我知道了</a></div>
</div>
<!-- end -->
</body>
</html>