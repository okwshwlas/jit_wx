<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="/WEB-INF/tld/c.tld" prefix="c"%>
<%
	String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
    //微信用户唯一标识
    //String openid = request.getParameter("openid");
    String openid = "123456";
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

<link href="<%=basePath%>/jsp/proscenium/lib/style/default.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>/jsp/proscenium/lib/style/index3.css">
<link rel="stylesheet" href="<%=basePath%>/jsp/proscenium/lib/Validform_v5.3.2/demo/css/style.css" type="text/css" media="all" />
<script type="text/javascript" src="<%=basePath%>/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/jsp/proscenium/lib/Validform_v5.3.2/demo/js/Validform_v5.3.2.js"></script>
<script type="text/javascript" src="<%=basePath%>/jsp/proscenium/lib/layer-v2.1/layer/layer.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/My97Date/WdatePicker.js" charset="utf-8"></script>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=KWe2TezxgWBDms0PYjeXBZWt"></script>
	<script>var basePath= "<%=basePath%>";</script>
	<script>var sqid = "2200";</script>
	<script type="text/javascript">
	
	function change1(){
 		$('#riqi').val($('#riqi1').val());
 		initDitu();
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
		
		//地图提示窗口设置
		var opts = {
			width : 350,     // 信息窗口宽度
			height: 150,     // 信息窗口高度
			enableMessage:true//设置允许信息窗发送短息
		};
		
		//地图点击事件
		function addClickHandler(title, content, marker, map) {
			marker.addEventListener("click",function(e){
				openInfo1(title,content,e,map);
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
	
		// 初始化页面
		$(function() {
			// 初始化受理地所在市信息
			var sls = document.getElementById("sls");
			// sls.options.add(new Option("请选择","")); 
			var url = basePath + "/proscenium/crjRyjbxxController/webProtal/findDictionaryByType.do?random=" + Math.random();
			var listParams = {
					"pid" : "22000000"
		 	};
			$.ajaxSettings.async = false; 
			$.getJSON(url,listParams, function(json){
				$.each(json.data, function(i,result) {
					var slscode = result.id;
					var slsname = result.dicName;
					sls.options.add(new Option(slsname,slscode));
					//document.getElementById("k").value = namecity;
				});		
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
				$("#riqi1").attr("value",initriqi);
				//$("#riqi1").attr("onclick","WdatePicker({dateFmt:'yyyy-MM-dd' ,minDate: '"+initriqi+"', maxDate: '"+endriqi+"'   });");
				$("#riqi1").attr("onclick","WdatePicker({dateFmt:'yyyy-MM-dd' ,minDate: '"+initriqi+"', maxDate: '%y-%M-{%d+9}' , opposite:true, });");
				//onclick="WdatePicker({dateFmt:'yyyy-MM-dd' ,minDate: '2016-03-20', maxDate: '2016-04-02'   });"
				document.getElementById("riqi").value = initriqi;
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
						        selectDictionary(1);
						    }
						});
					}
				}
			});
			initDitu();
		});

		// 添加预约信息
		function addYuYueXinxi(jgdwywtsxx,id, jgdwName, setime) {
			//$('#txt').focus();
			$("#worktimeId").val(id);
			$("#jgdwName").val(jgdwName);
// 4-13old			$("#txt").html("预约信息：您预约" + jgdwName + "(" + $("#riqi").val() + " " + setime + ")");
			$("#txt").html("预约信息：您预约" + jgdwName + "(" + $("#riqi1").val() + " " + setime + ")" ); // 4-13new
// 			$("body,html").animate({scrollTop:$("#txt").offset().top});
			map.closeInfoWindow();
			var truthBeTold = window.confirm("预约信息：您预约" + jgdwName + "(" + $("#riqi1").val() + " " + setime + ")"+"\n"+jgdwywtsxx);
			if (truthBeTold) {
				addYuYue()
			}
			
		}
		
		var map = "";
		function initDitu() {
			$("#table111").html("");
			$("#worktimeId").val("");
			$("#jgdwName").val("");
			$("#txt").html("");
			var riqi = $("#riqi1").val();
			var sls = $("#sls").val();
			var slx = $("#slx").val();
			var today="";
			if(riqi==getdate()){
				today="1";
			}
			// 准备URL和参数列表
			var url = basePath + "/proscenium/crjRyjbxxController/yuYue/findYuYueByRJ.do?random=" + Math.random();
			var listParams = {
					"riqi" : riqi,
					"sls" : sls,
					"slx" : slx
			};
			$.ajaxSettings.async = false; 
			// 发出请求并处理返回数据
			$('#danweiList').html("");
			$.getJSON(url,listParams, function(json) {
				if (json.code == "000000") {
					map = new BMap.Map("allmap");
					var point = new BMap.Point(json.data[0].longitude, json.data[0].latitude);
					//var point = new BMap.Point(125.328459, 43.891125);
					map.centerAndZoom(point, 14);
					map.enableScrollWheelZoom(true);
					$.each(json.data, function(i, result) {
						if (result.longitude != "") {
							var icon = new BMap.Icon('image/_green.png', new BMap.Size(30, 30), {//是引用图标的名字以及大小，注意大小要一样
				                anchor: new BMap.Size(13, 28)//这句表示图片相对于所加的点的位置
			                });
							$('#danweiList').append(
								"<tr >"+
              						"<td  class='listDanwei'><a href='javascript:selDanwei("+result.longitude+","+result.latitude+")'>"+result.jgdwName+"</a><td>"+
              					"</tr>"
							);
							
							
							
							
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
			            	// 准备URL和参数列表
			    			var urltsxx = basePath + "/proscenium/crjRyjbxxController//yuyue/findJgdwById.do?random=" + Math.random();
			    			var listParamstsxx = {
			    					"id" : jgdwid
			    			};
			    			$.ajaxSettings.async = false; 
			    			$.getJSON(urltsxx,listParamstsxx, function(json) {
			    				jgdwywtsxx=json.tsxx;
			    			});
							$.each(result.listSysWorktime, function(j, resultList) {
								 var myDate = new Date();
								if(today=="1"){
									if(resultList.startTime.substr(0,2)>myDate.getHours()){
										content+="<tr>";
							            content+="<td>" + resultList.startTime + " ~ " + resultList.endTime;
										if (resultList.sysl != "0") {
							            	content+=" (已预约人数:" + resultList.yysl + "人,剩余预约人数:" + resultList.sysl + "人)</td>";   resultList.jgdwId
							            	content+="<td><a href='javascript:void(0)' onclick='addYuYueXinxi(\"" +  jgdwywtsxx + "\",\"" +  resultList.id + "\",\"" + result.jgdwName + "\",\"" + resultList.startTime + " ~ " + resultList.endTime + "\")'>预约</a></td>";
							            	content+="</tr>";
										} else {
											content+=" (预约已满)</td>";
										}
										content+="</tr>";
										
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
			                map.addOverlay(marker);               // 将标注添加到地图中
			        		addClickHandler(title, content, marker, map);
						}
					});
				} else {
					alert(json.msg);
				}
				
			});
		}

		// 添加预约信息
		function addYuYue() {
			var worktimeId = $("#worktimeId").val();
			if (worktimeId == null || worktimeId == "") {
				alert("请在地图中选择预约地点和预约时间!");
			} else {
				$.ajax({
					type : 'get',
					url : basePath+"/proscenium/crjRyjbxxController/yuYue/addYuYueByWorktime.do",
					data : {
						'worktimeId' : worktimeId,
						'sqId' : sqid,
						'jgdwName' : $("#jgdwName").val()
					},
					dataType : "text",
					success : function(data) {
						var ret = jQuery.parseJSON(data);
						if (ret.code == "000000") {
							var url  = basePath + "qiantai/yuyue/appoint_duanxin.jsp?yyid=" + ret.data + "&sqid=" + sqid;
							window.location.href = url;
						} else if (ret.code == "000002") {
							alert(ret.msg);
							window.location.reload();//刷新当前页面
						} else {
							// 状态栏，操作状态
							alert(ret.msg);
						}
					}
				});
			}
		}
		
		// 受理地所在区
		function selectDictionary(type) {
			var sls = document.getElementById("sls").value;
			var slx = document.getElementById("slx");
			var slxvalue = document.getElementById("slx").value;
			if (type == 1) {
				if (sls != null && sls != "") {
					// 清空受理地所在县(区)信息
					var slxNode = slx.childNodes;
					if(slxNode != null) {
						while(slxNode.length > 0) {
							slx.removeChild(slxNode[slxNode.length-1]);
						}
					}
					var listParams = {
						"pid" : sls
			 		};
					var url = basePath + "/proscenium/crjRyjbxxController/webProtal/findDictionaryByType.do";
					//var url1 = "/getChildCity.do?random="+Math.random();
					//发出请求并处理返回数据
					slx.options.add(new Option("请选择","")); 
					$.getJSON(url,listParams, function(json){ 
						$.each(json.data, function(i,result) {
							var slscode = result.id;
							var slsname = result.dicName;
							slx.options.add(new Option(slsname,slscode)); 
						});		
					});
				}
			}
			initDitu();
		}
		
	</script>
</head>
<body>
<!-- wrap -->
<div id="wrap">
<!-- 	<div> -->
<!-- 		<div class="header_bg"><a href="../shenqing/sqfirst1.jsp">办证中心</a></div>        -->
<!-- 	    <div class="login_title"><h1><img src="../image/title/logo1.png" alt="吉林省公安厅出入境管理局" /></h1></div> -->
<!--     </div> -->
    <div id="list">
		<div id="list_"> 
            <div id="main_right">
            	<div class="title_bg"><span>预 约</span></div>
            	<div class="steps_mian" >
					<div id="main_right_title" class="steps_titlebg">
	                	<span id="main_right_title_">预约信息</span>
	              	</div>
	              	<div style="padding-top:10px; margin-bottom:10px; margin-left:15px;">
	              		
	              		<!-- <span>
	              			<input type="text" class="Wdate" value="" onClick="WdatePicker()"/>
	              		</span> -->
	              	</div>
	              	<!-- <div style="padding-top:10px; margin-bottom:10px; margin-left:15px;">
	              		<span style="display:-moz-inline-box; display:inline-block; width:85px; height:23px; text-align:center; line-height:23px; margin-left:15px; background-image:url(../image/58.gif);">09:00</span>
	              		<span style="display:-moz-inline-box; display:inline-block; width:85px; height:23px; text-align:center; line-height:23px; margin-left:15px; background-image:url(../image/67.gif);">10:00</span>
	              		<span style="display:-moz-inline-box; display:inline-block; width:85px; height:23px; text-align:center; line-height:23px; margin-left:15px; background-image:url(../image/67.gif);">11:00</span>
	              		<span style="display:-moz-inline-box; display:inline-block; width:85px; height:23px; text-align:center; line-height:23px; margin-left:15px; background-image:url(../im age/67.gif);">12:00</span>
	              		<span style="display:-moz-inline-box; display:inline-block; width:85px; height:23px; text-align:center; line-height:23px; margin-left:15px; background-image:url(../image/67.gif);">13:00</span>
	              		<span style="display:-moz-inline-box; display:inline-block; width:85px; height:23px; text-align:center; line-height:23px; margin-left:15px; background-image:url(../image/67.gif);">14:00</span>
	              		<span style="display:-moz-inline-box; display:inline-block; width:85px; height:23px; text-align:center; line-height:23px; margin-left:15px; background-image:url(../image/67.gif);">15:00</span>
	              		<span style="display:-moz-inline-box; display:inline-block; width:85px; height:23px; text-align:center; line-height:23px; margin-left:15px; background-image:url(../image/67.gif);">16:00</span>
	              	</div> -->
<!-- 	            	<div id="main_right_title" class="steps_titlebg"> -->
<!-- 	                	<span id="main_right_title_">预约地点</span> -->
<!-- 	              	</div> -->
	              	<div style="padding-top:15px; margin-bottom:15px; margin-left:15px;">
	              		<span style="width:100px; height:50px; padding-top:5px; margin-bottom:15px;">定位城市：</span>
	              		<span id='adress_'>长春市 </span> <a href='javascript:alert1(1)' style='color:blue'>修改</a>
	              			<script>
	              			function alert1(){
	              				var obj = '<div>';
	              				
	              			// 初始化受理地所在市信息
	              				var sls = document.getElementById("sls");
	              				// sls.options.add(new Option("请选择","")); 
	              				var url = basePath + "/proscenium/crjRyjbxxController/webProtal/findDictionaryByType.do?random=" + Math.random();
	              				var listParams = {
	              						"pid" : "22000000"
	              			 	};
	              				$.ajaxSettings.async = false; 
	              				$.getJSON(url,listParams, function(json){
	              					$.each(json.data, function(i,result) {
	              						var slscode = result.id;
	              						var slsname = result.dicName;
	              						obj +="<a href=javascript:changeCity('"+slscode +"','"+slsname +"') style='margin-right:20px'> "+slsname+" </a>";
	              						if(i !=0  &&  i%3 ==0){
	              							obj +="<br><br>";
	              						}	
	              					});		
	              				});
	              				obj +='</div>';
	              				$(obj).dialog({
	              					title : "请选择您所在的城市",
	              					buttons: {
	              						"确定":function(){
// 	              							alert("ok")
	              						},
	              						"取消" : function(){
// 	              							alert("cancel")
	              						}
	              					},
	              				});
	              			}
	              			function changeCity(par,adress_){
	              				$('#sls').val(par);
	              				$('#adress_').html(adress_);
	              				initDitu();
	              			}
	              			</script>
	              			<div >
		              			<select id="sls" name="sls" style="width:120px; height: 20px;" onchange="selectDictionary('1');" >
			     				</select> 
	              			</div>
	              		</span>
	              		<span style="margin-left:15px;">
	              			预约日期：
	              		</span>
	              		<span>
	              			<div style='display:none'>
	              			<select id="riqi" name="riqi" style="width: 120px" onchange="initDitu();  "   >
						     </select>
	              			</div>
						     <input  id='riqi1' type="text" id="" name="validUntil" onchange="change1()"  value='2016-03-20' class="Wdate easyui-validatebox" onclick="WdatePicker({dateFmt:'yyyy-MM-dd' ,minDate: '2016-03-20', maxDate: '2016-04-02'   });"/>
						   <!--   <script type="text/javascript">
						     	function change1(){
						     		$('#riqi').val($('#riqi1').val());
		     					    initDitu();
						     	}
						     </script> -->
	              		</span>
              			<a href="javascript:tab(0)" value='1'  class="btn_sty btn_orange">切换列表模式</a>
              			<input type="hidden" value='1'  id='flag'>
              			<script>
              				function tab(){
              					if ( $('#flag').val() == 1 ){
              						$('#flag').val('0');
              						$('#tableM').show();
              						$('#mapM').hide();
              					}else{
              						$('#flag').val('1');
              						$('#tableM').hide();
              						$('#mapM').show();
              					}
              				}
              			</script>
	              		<div style='display:none'>
	              		<span style="width:100px; height:50px; padding-top:5px; margin-bottom:15px; margin-left:15px;">受理地所在县(区)：</span>
	              		<span>
	              			<select id="slx" name="slx" style="width: 120px; height: 20px;" onchange="initDitu();">
							    <option >请选择</option>
						     </select>
	              		</span>
					     </div>
					     <span></span>
	              		<!-- <span style="width:100px; height:50px; padding-top:5px; margin-bottom:15px; margin-left:15px;">
	              			<input type="button" class="btn" value="查   询" onclick="initDitu();"/>
	              		</span> -->
	              		<!-- <span style="display:-moz-inline-box; display:inline-block; width:85px; height:23px; text-align:center; line-height:23px; margin-left:15px; background-image:url(../image/58.gif);">长春</span>
	              		<span style="display:-moz-inline-box; display:inline-block; width:85px; height:23px; text-align:center; line-height:23px; margin-left:15px; background-image:url(../image/67.gif);">吉林</span>
	              		<span style="display:-moz-inline-box; display:inline-block; width:85px; height:23px; text-align:center; line-height:23px; margin-left:15px; background-image:url(../image/67.gif);">四平</span> -->
	              	</div>
	              	<table id='mapM'>
	              		<tr>
	              			<td colspan="2" style='color:red;font-size:16px'>&nbsp;&nbsp;&nbsp;&nbsp;
	              				点击查看可以查询受理您申请业务的受理点:<a href="<%=basePath%>crj/webProtal/jsp/yuyue/yuyueTs.html" target="_blank">查看</a></td>
	              		</tr>
	              		<tr style='width:900px'>
	              			<td width='210px' valign="top">
	              				<script type="text/javascript">
	              				function  selDanwei(a,b){
	              					var point = new BMap.Point(a, b);
	              					map.centerAndZoom(point, 14);
	              				}
	              				
	              				</script>
	              				<table id='danweiList' >
	              				</table>
	              				
	              			</td>
	              			<td width='690px'>
								<div id="allmap" style="width: 700px; height:460px; text-align: center; margin:0 auto;">
									<!-- <img src="../image/images/yydd_image.jpg" alt=""  /> -->
								</div>
	              			</td>
	              		</tr>
	              	</table>
					<table id='tableM' class="bordered" style='display:none' width='80%'>
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
					<div style="padding-top:15px; margin-bottom:15px; margin-left:15px;">
					</div>
					<div style="padding-top:10px; margin-bottom:10px; margin-left:15px;">
	                	<span id="txt" style="width:500px; height:50px; padding-top:5px; margin-bottom:10px; margin-left:15px;font-size:16px;">
	                		<!-- 预约信息：预约长春市出入境管理局办证大厅09:00 -->
	                	</span>
	                	<input type="hidden" id="worktimeId" value="" />
	                	<input type="hidden" id="jgdwName" value="" />
	              	</div>
<!-- 					<div class="steps_btn demo-list padding_btm20"> -->
<!-- 	 					<p> -->
	 						<!-- <a href="#this" class="btn_sty btn_blue">上一步</a> -->
<!-- 	 						<a href="javascript:void(0)" onclick="addYuYue();" class="btn_sty btn_orange">下一步</a> -->
<!-- 	 					</p> -->
<!-- 					</div> -->
				</div>
            </div>
        </div>
    </div>
</div>
<%--  <script type="text/javascript" src='<%=basePath %>basics/js/autoJsHeight.js'></script> --%>
</body>
</html>