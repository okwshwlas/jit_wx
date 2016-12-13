<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--     <%@ page import="java.util.*,java.io.*" pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%> --%>
<%@taglib uri="/WEB-INF/tld/c.tld" prefix="c"%>

<%@page import="dogo.util.UUID"%> 
<%
	String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
    //微信用户唯一标识
   String openid = request.getParameter("openid");
   String code = request.getParameter("code");
   //String openid = "123456";
   String loginId =(String) session.getAttribute("idCard");
	//证件标识
	String ptflag =(String) session.getAttribute("pthz");
	String gaflag =(String) session.getAttribute("gatxz");
	String twflag =(String) session.getAttribute("twtxz");
	//省内外标识
	String snwflag=(String) session.getAttribute("snwflag");
	//长春市标识
	String ccflag = (String) session.getAttribute("ccflag");
	//工作人员标识
	String gzryflag = (String) session.getAttribute("gzryflag");
// 	String gzryflag = "1";
	//16岁标识 满161 未满0
	String sixteenflag=(String) session.getAttribute("isSixteen");
// 	String sixteenflag="1";

 String xxcome=request.getParameter("xxcome");
 String sfzh=request.getParameter("sfzh");
 String name=request.getParameter("name");
 String sjhm=request.getParameter("sjhm");
 String hkszdpcs=request.getParameter("hkszdpcs");
 //接公安参数
 String retoken = request.getParameter("qwert");
  String sqid = UUID.getUID();
%> 
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
    <meta name="format-detection" content="telephone=no,email=no,date=no,address=no">
	
    <title>选择签注种类</title>
    <link rel="stylesheet" type="text/css" href="../css/aui.2.0.css" />
    <link rel="stylesheet" type="text/css" href="../css/commont.css" />
    <script type="text/javascript" src="<%=basePath%>/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/jweixin-1.0.0.js"></script>
<script type="text/javascript" src="<%=basePath%>/jsp/proscenium/lib/Validform_v5.3.2/demo/js/Validform_v5.3.2.js"></script>
<script type="text/javascript" src="<%=basePath%>/jsp/proscenium/lib/layer-v2.1/layer/layer.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/My97Date/WdatePicker.js" charset="utf-8"></script>
	<script type="text/javascript" src="<%=basePath%>/jsp/proscenium/wxlv/js/cookie.js"></script>
	<script type="text/javascript" src="<%=basePath%>/jsp/proscenium/wxlv/js/findyw.js"></script>
	<script type="text/javascript" src="<%=basePath%>/jsp/proscenium/wxlv/js/zhuce.js"></script>
<script type="text/javascript" src="<%=basePath%>/jsp/proscenium/wxlv/js/token.js"></script>
<script type="text/javascript" src="<%=basePath%>/jsp/proscenium/wxlv/js/smrz.js"></script>
		<script type="text/javascript" src="../script/aui-dialog.js"></script>
	<script type="text/javascript" src="../script/api.js" ></script>
<script type="text/javascript" src="../script/aui-toast.js" ></script>
    <style type="text/css">
        .aui-list .aui-list-item-media {
            width: 6rem;
        }
        .aui-media-list .aui-list-item-inner {
            display: block;
            padding-top: 0.8rem;
            padding-bottom: 0.8rem;
        }
        .aui-list-item-input input[type='date'] { border: 1px solid #d6d6d6; padding-left: 5px;}
        .aui-tips { position: absolute; bottom: 0;}
        .aui-list .aui-list-item::after{ background-color:#fff!important; }
        .aui-card-list { padding: 5% 0;}
        .aui-media-list-item-inner { height: 80px;}
        .aui-btn-block { color: #626262; padding: 0.5rem; font-size: 0.8rem;}
        .aui-list-item-inner1 { font-size: 0.65rem;}
    </style>
     <script type="text/javascript">
	 
	 		 
		    //16周岁标记 0 未满
	var sixteenflag = '<%=sixteenflag%>';
//  var sixteenflag = '0';
	//国家工作人员标记 1是国家工作人员
	var gzryflag = '<%=gzryflag%>';
	var basePath= "<%=basePath%>";
	var code= "<%=code%>";
	var ccflag;
	var token= "<%=retoken%>";
	var xxcome="";
	var sjhm = "" ;
	var sfzh = "";
	var openid= "";
	var name = "";
	var hjszdpcs = "";
	var xgflag="";
	var amflag="";
	var twflag="";
		    	//token = 'b3BlbklkJTNEb2RBX1JzaU12UGx1Rkd6LXR0SHVKVTZoSGh6SSUyNnNqaG0lM0QxMzg0MzEyMzU4MSUyNnNmemglM0QyMjAxMDQxOTg0MDQyNDE1MjAlMjZ4eGNvbWUlM0QxJTI2aGtzemRwY3MlM0QyMjAxMDY2NjElMjZuYW1lJTNEJUU1JUFFJThCJUU1JUJFJUFFJUU1JUJFJUFF'

	
	var sqid ="<%=sqid%>";;
	 
	 
  
	
	//加载数据中****satrt

     // 加载
     var toast = new auiToast({
     })
     function showDefault(showtype){
      	//$("#end").removeAttr("onclick");
          switch (showtype) {
              case "loading":
                  toast.loading({
                      title:"加载信息中",
                      duration:2000
                  },function(ret){
                      console.log(ret);
                      setTimeout(function(){
                     	
                      })
                  });
                  break;
              default:
                  // statements_def
                  break;
          }
      }
     //加载数据******ebd
     
     // if(WeixinApi.openInWeixin()){
	 // alert('100');

	// if (typeof WeixinJSBridge == "undefined") {
		// if (document.addEventListener) {
			// document.addEventListener('WeixinJSBridgeReady', init, false);
		// } else if (document.attachEvent) {
			// document.attachEvent('WeixinJSBridgeReady', init);
			// document.attachEvent('onWeixinJSBridgeReady', init);
		// }
	// } else {
		// init();
	// }

// }else{

	// $(function(){
		// init();
	// });
// }
     
     
     
	//测试code
	//code = '001g7YKb1zmZ7s0ub1Kb1dp0Lb1g7YKT';
	     $(function() {

		 token= "<%=retoken%>";
	    	  showDefault('loading');
	    	// token = 'b3BlbklkJTNEb2RBX1JzaU12UGx1Rkd6LXR0SHVKVTZoSGh6SSUyNnNqaG0lM0QxMzg0MzEyMzU4MSUyNnNmemglM0QyMjAxMDQxOTg0MDQyNDE1MjAlMjZ4eGNvbWUlM0QxJTI2aGtzemRwY3MlM0QyMjAxMDY2NjElMjZuYW1lJTNEJUU1JUFFJThCJUU1JUJFJUFFJUU1JUJFJUFF'
	    			// if(token!="b3BlbklkJTNEb2RBX1JzaU12UGx1Rkd6LXR0SHVKVTZoSGh6SSUyNnNqaG0lM0QxMzg0MzEyMzU4MSUyNnNmemglM0QyMjAxMDQxOTg0MDQyNDE1MjAlMjZ4eGNvbWUlM0QxJTI2aGtzemRwY3MlM0QyMjAxMDY2NjElMjZuYW1lJTNEJUU1JUFFJThCJUU1JUJFJUFFJUU1JUJFJUFF"){
	    				  // alert('系统维护中........')
	    				  // return history.go(-1);
	    				
	    				// } 
    		 //解析平台传过来参数
    		 var getUrl = basePath+"/crj/wxqz/getGaToken.do";
    		 $.ajax({
    								url : getUrl,
    								data : {
    									"token": token
    									},
    							    async:false,
    								type : "post",
    								dataType : 'json',
    								success : function(data) {
    									var flag = data.code;
    									if(flag == '1'){
    										var obj = data.data;
    										sfzh = obj.sfzh;
//     										sfzh='220104198404241520'
    										sjhm = obj.sjhm;
    										name = obj.name;
    										openid = obj.openId;
    										xxcome = obj.xxcome;
    										hkszdpcs = obj.hkszdpcs;
											if(hkszdpcs != null &&hkszdpcs.substring(0, 1)=='2'){
	    					                  setCookie('ccflag','1');
	    				                     }else{
	    					                      setCookie('ccflag','0');
	    				                       }
    										setCookie('openid',openid);
    										setCookie('sfzh',sfzh);
    										setCookie('lxdh',sjhm);
    										setCookie('name',name);
    									}else{
    										alert('解析吉林公安参数错误,请重新进入!');
    										return;
    									}
     								}
    						});
    		 
    		 if(xxcome !=''){
    			 
    			 setCookie('xxcome',xxcome);
    			 setCookie('openid',openid);
    			 
    		 }
	    	 if(xxcome =='0'){
	    		if(null!=code){
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
	    		}
	    		if('null' == openid){
	    			
	    			alert('未获取到OPENID请退出后重新进入');
	    			return;
	    			
	    		}
	    		var token = getToken();
	    		setCookie('token',token);
	    		sjhm=findSjhmByOpenid(openid);
	    		if(''==sjhm){
	    			
	    			alert('系统检测到出入境微信尚未绑定人员信息请先绑定');
	    			return location = 'ryxxbd.jsp';
	    			
	    			
	    		}
	    		
	    		
	    		//查询人员信息进行逻辑判断****start******
	    		var zhucexx =findzhucexx(openid);
	    		if(zhucexx !=false){
	    			//认证标识  0:暂未认证，1:认证通过，­9,认证不通过
	    			var identityStatus = zhucexx.identityStatus;
	    			//如果未认证 不显示人员信息
	    			if(identityStatus =='1'){
	    				idCard = zhucexx.idCard;
	    				//字段没有定户口所在地派出所
	    				hkszdpcs = zhucexx.belongAddrCode;
	    				if(hkszdpcs != null &&hkszdpcs.substring(0, 1)=='2'){
	    					setCookie('ccflag','1');
	    				}else{
	    					setCookie('ccflag','0');
	    				}
	    				setCookie('sfzh',idCard);
	    				//认证通过查询是否已经有详细信息 没有详细信息不全并把身份证号和户口所在派出所带到不全页面。如果已经补全如果户口所在派出所不为空则判断和原数据是否相等不相等update
	    				$.ajax({
				 			url : "http://221.8.52.247:8445/jit_crj/crj/WxRy/findRyxx.do",
				 			
				 			data : {
				 				"sfzh" : idCard,
				 				"lxdh" : sjhm
				 			},
				 			type : "post",
				 			dataType:"JSON",
				 			success:function(data) {
				 				if(data.flag !='3'){
				 					
				 					return location="personal_info.jsp?sfzh="+idCard+"&hkszdpcs="+hkszdpcs+"&sjhm="+sjhm;
				 				}else{
				 				}
				 				
				 			}
				 		});
	    			}
	    			if(identityStatus == '0'||'' == identityStatus ||identityStatus ==undefined){
	    				
	    				alert('您还没有进行实名认证,请先进行实名认证');
	    				return location = 'renzheng.jsp'
	    			}
	    			if(identityStatus == '-9'){
	    				alert('您提交的实名认证没有通过,请重新进行实名认证');
	    				return location = 'renzheng.jsp'
	    			}
	    		}else{
	    			alert('获取人员信息出错!');
	    			pushHistory();
	    			
	    		}
	    		//查询人员信息进行逻辑判断****end******
	    		
	    		
	    		
	    		//查询证件信息****start******
	    		$.ajax({
	    			url : "http://221.8.52.247:8445/jit_crj/crj/WxRy/findZj.do",
	    			data : {
	    				"sfzh" :idCard ,
	    				"lxdh" : sjhm
	    			},
	    			type : "post",
	    			dataType:"JSON",
//	     			jsonp: "callback",//传递给请求处理程序或页面的，用以获得jsonp回调函数名的参数名(一般默认为:callback)
//	     	        jsonpCallback:"flightHandler",//自定义的jsonp回调函数名称，默认为jQuery自动生成的随机函数名，也可以写"?"，jQuery会自动为你处理数据
	    			success:function(data,textStatus) {
	    				var gatxz= data.gatxz;
	    				var twtxz= data.twtxz;
	    				if(gatxz =='0' && twtxz =='0' ){
	    					alert('对应身份证下不存在往来港澳通行证和台湾通行证，请申请证件后继续办理');
	    					pushHistory();
	    				}else{
	    					setCookie('gatxz',gatxz);
	    					setCookie('twtxz',twtxz);
	    					//有证件查询各种标示
	    					
	    					
	    				    //查询个人信息*******start****

	    						var loginUrl = "http://221.8.52.247:8445/jit_crj/crj/WxRy/login.do";
	    							$.ajax({
	    								url : loginUrl,
	    								data : {
	    									"sfzh": idCard,
	    									"lxdh" :sjhm
	    									},
	    							    async:false,
	    								type : "post",
	    								dataType : 'json',
	    								success : function(data) {
	    									var flag = data.flag;
	    									if(flag!='3'){
	    										sixteenflag = data.isSixteen; 	
	    										gzryflag = data.gzryflag;
	    										}else{
	    											alert('获取人员信息出错!');
	    							    			pushHistory();
	    											
	    											
	    											
	    										}
	    								

//	    								

	    								}
	    						});
	    						
	    				    
	    				    
	    		
	    		
	    		
	    		
	    		         //查询个人信息*******end****
	    					
	    				}
	    			}
	    		});
	    		//查询证件信息****end******
	    		
	    		
	    	
	    	 
	    	 returnhidenew();
	    	 findbzjd();
	    	 }else if(xxcome=='1'){
	    		
	    			 //查询个人信息*******start****
					var loginUrl = "http://221.8.52.247:8445/jit_crj/crj/WxRy/WxryxxSaveOrUpdate.do";
						$.ajax({
							url : loginUrl,
							data : {
								"sfzh": sfzh,
								"name":name,
								"lxdh" :sjhm,
								"xxcome":xxcome,
								"UserHjPcsCode":hkszdpcs,
								"openid":openid
								},
						    async:false,
							type : "post",
							dataType : 'json',
							success : function(data) {
								var flag = data.flag;
								//绑定人员信息成功
								if(flag=='1'){
									 //查询是否有详细信息 *******start
				            		 $.ajax({
				 			 			url : "http://221.8.52.247:8445/jit_crj/crj/WxRy/findRyxx.do",
				 			 			
				 			 			data : {
				 			 				"sfzh" : sfzh,
				 			 				"lxdh" : ''
				 			 			},
										 async:false,
				 			 			type : "post",
				 			 			dataType:"JSON",
				 			// 			jsonp: "callback",//传递给请求处理程序或页面的，用以获得jsonp回调函数名的参数名(一般默认为:callback)
				 			// 	        jsonpCallback:"flightHandler",//自定义的jsonp回调函数名称，默认为jQuery自动生成的随机函数名，也可以写"?"，jQuery会自动为你处理数据
				 			 			success:function(data,textStatus) {
				 			 				if (data.flag== "0") {
				 			 				
				 			 				}else if(data.flag== "3"){
											returnhide();
				 			 					
				 			 		    		//查询证件信息****start******
				 			 		    		$.ajax({
				 			 		    			url : "http://221.8.52.247:8445/jit_crj/crj/WxRy/findZj.do",
				 			 		    			data : {
				 			 		    				"sfzh" :sfzh ,
				 			 		    				"lxdh" : sjhm
				 			 		    			},
													 async:false,
				 			 		    			type : "post",
				 			 		    			dataType:"JSON",
//				 			 		     			jsonp: "callback",//传递给请求处理程序或页面的，用以获得jsonp回调函数名的参数名(一般默认为:callback)
//				 			 		     	        jsonpCallback:"flightHandler",//自定义的jsonp回调函数名称，默认为jQuery自动生成的随机函数名，也可以写"?"，jQuery会自动为你处理数据
				 			 		    			success:function(data,textStatus) {
				 			 		    				var gatxz= data.gatxz;
				 			 		    				var twtxz= data.twtxz;
				 			 		    				if(gatxz =='0' && twtxz =='0' ){
				 			 		    					toast.hide();
				 			 		    					alert('对应身份证下不存在往来港澳通行证和台湾通行证，请申请证件后继续办理');
				 			 		    					pushHistory();
				 			 		    				}else{
				 			 		    					
				 			 		    				    //查询个人信息*******start****

				 			 		    						var loginUrl = "http://221.8.52.247:8445/jit_crj/crj/WxRy/login.do";
				 			 		    							$.ajax({
				 			 		    								url : loginUrl,
				 			 		    								data : {
				 			 		    									"sfzh": sfzh,
				 			 		    									"lxdh" :sjhm
				 			 		    									},
				 			 		    							    async:false,
				 			 		    								type : "post",
				 			 		    								dataType : 'json',
				 			 		    								success : function(data) {
				 			 		    									var flag = data.flag;
				 			 		    									if(flag!='3'){
				 			 		    										sixteenflag = data.isSixteen; 	
				 			 		    										gzryflag = data.gzryflag;
																				
				    	                                                         findbzjd();
				 			 		    										}else{
				 			 		    											alert('获取人员信息出错!');
				 			 		    							    			pushHistory();
				 			 		   										}
				 			  		    								}
				 			 		    						});
				 			 		    			
				 			 		    		         //查询个人信息*******end****
				 			 		    					//16周岁判断
				 			 		    					 if(sixteenflag=='0'){
				 			 		    			    		 $.ajax({
				 			 		    			 				url :  "http://221.8.52.247:8445/jit_crj/crj/WxJhr/jhrxxList.do",
				 			 		    			 				data : {
				 			 		    			 					'sfzh':sfzh
				 			 		    			 				},
																	 async:false,
				 			 		    			 				type : "post",
				 			 		    			 				dataType : 'json',
				 			 		    			 				success : function(data) {
				 			 		    			 					flag = data.flag;
				 			 		    			 					if(flag == '0') {
				 			 		    			 						 location = "jhr_info.jsp?qwert="+token; 
				 			 		    			 					} 
				 			 		    			 				}
				 			 		    			 			});
				 			 		    			    		
				 			 		    			    	 }
				 			 		    					//国家工作人员判断
				 			 		    			    	 if(gzryflag =='1'){
				 			 		    			    		 location = "tip.jsp?qwert="+token;
				 			 		    			    		 
				 			 		    			    	 }
				 			 		    			    	 
				 			 		    			    	 
				 			 		    					setCookie('gatxz',gatxz);
				 			 		    					setCookie('twtxz',twtxz);
															
				 			 		    					//有证件查询各种标示
				 			 		    					
				 			 		    			
				 			 		    					
				 			 		    				}
				 			 		    			}
				 			 		    		});
				 			 		    		//查询证件信息****end******
				 	 				}else {
				 	 					        toast.hide();
				 			 					alert('没有补全详细信息,请进行补全信息');
				 			 					location="personal_info.jsp?idCard="+sfzh+"&hjszd="+hkszdpcs;
				 			 				}
				 			 			}
				 			 		});
									}else{
										alert('获取人员信息出错!');
						    			pushHistory();
									}
							}
					});
						
				    	 toast.hide();
	    	 }else{
	    		 
	    		 alert('不明公众号来源');
	    		 
	    		 
	    		 
	    		 
	    	 }
			 // returnhidenew();
			// findbzjd();
	    	
	     });
		 // }
		
		
	

     
     
     function pushHistory() {
    		return history.go(-1);
    	}


     function lvqz(type){
    	 if(sixteenflag=='0'){
    		 $.ajax({
 				url :  "http://221.8.52.247:8445/jit_crj/crj/WxJhr/jhrxxList.do",
 				data : {
 					'sfzh':sfzh
 				},
 				type : "post",
 				dataType : 'json',
 				success : function(data) {
 					flag = data.flag;
 					if(flag == '0') {
 						 location = "jhr_info.jsp?type="+type; 
 					} 
 				}
 			});
    		
    	 }
    	 if(gzryflag =='1'){
    		 location = "tip.jsp?type="+type;
    		 
    	 }
    	 else{
    		 location = "kind_business1.jsp?lvtype="+type;
    	 }
    	
     }
     </script>
     <script type="text/javascript" >
        $(document).ready(function(){
            $("#xg_layer .aui-btn").click(function(){
                $("#xg_layer .aui-btn").removeClass("aui-btn-primary");
                $(this).addClass("aui-btn-primary");
            });
            $("#am_layer .aui-btn").click(function(){
                $("#am_layer .aui-btn").removeClass("aui-btn-primary");
                $(this).addClass("aui-btn-primary");
            });
            $("#tw_layer .aui-btn").click(function(){
                $("#tw_layer .aui-btn").removeClass("aui-btn-primary");
                $(this).addClass("aui-btn-primary");
            });
            $(".layui-layer-close1").click(function(){

            });
			returnhidenew();
			
        });
        function show_layer(type){
        	var tcid ='#'+ type+'qztcc';
            $(tcid).show();
            $(".pop_box").show(type);
        }
       
        function hide_layer(type){
        	//反显选择签注和有效次数提示
        	var yxcsts='';
        	var qzzlts='';
        	var tsid = '#'+type+'ts';
        	var qzmc1 = '#'+type+'grlvqz1';
        	var qzmc2 = '#'+type+'tdlvqz1';
        	//END
        	 var dialog = new auiDialog({});
        	
        	if(!$(qzmc1).hasClass('aui-btn aui-btn-primary')&&!$(qzmc2).hasClass('aui-btn aui-btn-primary')){
             		alert('请选择签注种类');
                     return;
        	}
        	
        	//选择签注次数操作和保存判断
        	var radioname = type+'radio';
        	 var typeyxcs ='#'+ type+'yxcs';
        	var radiocheck ='input:radio[name="'+radioname+'"]:checked';
        	 var yxcsval=$(radiocheck).val();
        	 
        	 switch (yxcsval) {
			case 'Y031':
				yxcsts = '三个月一次';
				break;
			case 'Y032':
				yxcsts = '三个月二次';
				break;
			case 'Y061':
				yxcsts = '六个月一次';
				break;
			case 'N011':
				yxcsts = '一年一次';
				break;
			case 'N012':
				yxcsts = '一年二次';
				break;

			default:
				break;
			}
        	
        	 $(typeyxcs).val(yxcsval);
             if($(radiocheck).length==0){
             	alert('请选择签注次数');
             	return;
             }
             //end 
        	//选择哪个前往地的签注标示选择置1 ***satart***
        	var flagset= "#"+type+'doflag';
        	$(flagset).val(1);
        	//end
        	
        	//隐藏弹出层标示
        	var ycid ='#'+ type+'qztcc';
        	 $(ycid).hide();
        	 //end 
        	 
//         	 //选择签注次数操作和保存判断
//         	var radioname = type+'radio';
//         	 var typeyxcs ='#'+ type+'yxcs';
//         	var radiocheck ='input:radio[name="'+radioname+'"]:checked';
//         	 var yxcsval=$(radiocheck).val();
//         	 $(typeyxcs).val(yxcsval);
//              if($(radiocheck).length==0){
//              	alert('请选择签注次数');
//              	return;
//              }
//              //end 
             
             
             //选择签注增加已选择样式
        	var typeli ='#'+ type+'li';
        	$(typeli).addClass('bg_color');
        	//end
        	
        	//根据选中签注种类判断是那种签注 给签注种类隐藏值赋值用来保存时时间和提示显示
        
        	//alert(qzmc1)
        	//如果个人旅游被选中
        	if($(qzmc1).hasClass('aui-btn aui-btn-primary')){
        		qzzlts='个人旅游签注';
        		if(qzmc1=='#twgrlvqz1'){
        			$("#twqzzl").val('2B');
        			$("#twtype").val('3');
        		}else if(qzmc1=='#xggrlvqz1'){
        			$("#xgqzzl").val('1B');
        			$("#xgtype").val('3');
        			$("#xgflag").val('0');
        			$("#xgqwd").val('HKG');
        			$("#xgqzsy").val('08');
        		
        		}else if(qzmc1=='#amgrlvqz1'){
        			$("#amqzzl").val('1B');
        			$("#amtype").val('3');
        			$("#amflag").val('1');
        			$("#amqwd").val('MAC');
        			$("#amqzsy").val('08');
        		}
        	}else if($(qzmc2).hasClass('aui-btn aui-btn-primary')){
        		qzzlts='团队旅游签注';
        		if(qzmc2=='#twtdlvqz1'){
        			$("#twqzzl").val('25');
        			$("#twtype").val('4');
        		}else if(qzmc2=='#xgtdlvqz1'){
        			$("#xgqzzl").val('12');
        			$("#xgtype").val('4');
        			$("#xgflag").val('0');
        			$("#xgqwd").val('HKG');
        			$("#xgqzsy").val('09');
        		
        		}else if(qzmc2=='#amtdlvqz1'){
        			$("#amqzzl").val('12');
        			$("#amtype").val('4');
        			$("#amflag").val('1');
        			$("#amqwd").val('MAC');
        			$("#amqzsy").val('09');
        		}
        	}
        	
        	$(tsid).text('您选择了'+qzzlts+','+yxcsts);
            $(".pop_box").hide();
            
        }
        function clean(type){
        	var flagset= "#"+type+'doflag';
        	var ycid ='#'+ type+'qztcc';
        	var ts = "#"+type+'ts';
        	var typeli ='#'+ type+'li';
        	var typelayer ='#'+type+'_layer .aui-btn';
//         	var yxcs ='#'+ type+'yxcs';
//         	var qzzl ='#'+ type+'qzzl';
        	$(flagset).val('0');
        	$(ycid).hide();
        	$(ts).html('');
        	$(typeli).removeClass('bg_color');
        	$(".pop_box").hide();
        	$(typelayer).removeClass("aui-btn-primary")
        }
       function close_layer(type){
    	   var ycid ='#'+ type+'qztcc';
    	   $(ycid).hide();
    	   $(".pop_box").hide();
        	
        }
        
        apiready = function(){
            api.parseTapmode();
        }
        function closeTips(){
            $api.remove($api.byId("tips-1"));
        }
        // 加载
        var toast = new auiToast({
        })
        function SaveQzxx(showtype){
		$("#end").removeAttr("onclick");
		$("#end").html('请等待'); 
		$("#end").removeClass("aui-btn-info")
        	 var dialog = new auiDialog({});
        	var xgdoflag=$("#xgdoflag").val();
        	var amdoflag=$("#amdoflag").val();
        	var twdoflag=$("#twdoflag").val();
        	if(xgdoflag=='0'&&amdoflag=='0'&&twdoflag=='0'){
        		dialog.alert({
                    title:"提示",
                    msg:'请选择签注业务种类',
                    buttons:['确定']
                })
                return;
        	}
        	
            switch (showtype) {
                case "loading":
                    toast.loading({
                        title:"保存信息中",
                        duration:2000
                    },function(ret){
                        console.log(ret);
                        setTimeout(function(){
                        
                        	
                        	var sumflag = parseInt(xgdoflag)+parseInt(amdoflag)+parseInt(twdoflag);
                        	var checkflag=0;
                       	 if(twdoflag==1){
                       		 $.ajax({
            			 			url : "http://221.8.52.247:8445/jit_crj/crj/WxQz/twqzxx.do",
            			 			data : {
            			 				"sfzh" : sfzh,
            			 				"type" : $("#twtype").val(),
            			 				"twqzzl" : $("#twqzzl").val(),
            			 				"sqid":sqid,
            			 				"twqzyxcs" :$("#twyxcs").val()
            			 			},
            			 			type : "post",
            			 			  async:false,
            			 			dataType:"JSON",
            			 			success:function(data) {
            			 				if (data.flag== "1") {
            			 					checkflag++;
            			 					$("#twdoflag").val('0');
            			 				}
            			 			}
            			 		});
                       	 }
                       	 if(amdoflag==1){
                       		 
                       		 $.ajax({
             			 			url : "http://221.8.52.247:8445/jit_crj/crj/WxQz/hkqzxx.do",
             			 			
             			 			data : {
             			 				"sfzh" : sfzh,
             			 				"type" :$("#amtype").val(),
             			 				"flag" :$("#amflag").val(),
             			 				"qwd" : $("#amqwd").val(),
             			 				"hkqzsy" :$("#amqzsy").val(),
             			 				"hkqzzl" :$("#amqzzl").val(),
             			 				"sqid":sqid,
             			 				"hkyxcs":$("#amyxcs").val()
             			 				
             			 			},
             			 			type : "post",
             			 		  async:false,
             			 			dataType:"JSON",
             			// 			jsonp: "callback",//传递给请求处理程序或页面的，用以获得jsonp回调函数名的参数名(一般默认为:callback)
             			// 	        jsonpCallback:"flightHandler",//自定义的jsonp回调函数名称，默认为jQuery自动生成的随机函数名，也可以写"?"，jQuery会自动为你处理数据
             			 			success:function(data,textStatus) {
             			 				if (data.flag== "0") {
             			 					//保存错误
             			 				 toast.hide();
             			 					alert(data.flag)
             			 				}else if(data.flag== "1"){
             			 					checkflag++;
             			 					$("#amdoflag").val('0');
             			 				}
             			 			}
             			 		});
                    
                       	 }
                       	 if(xgdoflag==1){
                      		 
                      		 $.ajax({
            			 			url : "http://221.8.52.247:8445/jit_crj/crj/WxQz/hkqzxx.do",
            			 			
            			 			data : {
            			 				"sfzh" : sfzh,
            			 				"type" :$("#xgtype").val(),
            			 				"flag" :$("#xgflag").val(),
            			 				"qwd" : $("#xgqwd").val(),
            			 				"hkqzsy" :$("#xgqzsy").val(),
            			 				"hkqzzl" :$("#xgqzzl").val(),
            			 				"sqid":sqid,
            			 				"hkyxcs":$("#xgyxcs").val()
            			 				
            			 			},
            			 			type : "post",
            			 			async:false,
            			 			dataType:"JSON",
            			// 			jsonp: "callback",//传递给请求处理程序或页面的，用以获得jsonp回调函数名的参数名(一般默认为:callback)
            			// 	        jsonpCallback:"flightHandler",//自定义的jsonp回调函数名称，默认为jQuery自动生成的随机函数名，也可以写"?"，jQuery会自动为你处理数据
            			 			success:function(data,textStatus) {
            			 				if (data.flag== "0") {
            			 					//保存错误
            			 				 toast.hide();
            			 					alert(data.flag)
            			 				}else if(data.flag== "1"){
            			 					checkflag++;
            			 					$("#xgdoflag").val('0');
            							
            			 				}
            			 			}
            			 		});
                   
                      	 }
                       	 
                       	 if(checkflag==sumflag){
                       		 toast.hide();
                       		location="pick_address.jsp?sqid="+sqid;
                       	 }
                        })
                    });
                    break;
                default:
                    // statements_def
                    break;
            }
        }
        
       
    </script>
</head>
<body > 
<input id="xgdoflag"  type="hidden" value="0"/>
<input id="amdoflag"  type="hidden" value="0"/>
<input id="twdoflag"  type="hidden" value="0"/>
<input id="xgqzzl"  type="hidden"/>
<input id="amqzzl"  type="hidden"/>
<input id="twqzzl"  type="hidden"/>

<input id="xgtype"  type="hidden"/>
<input id="amtype"  type="hidden"/>
<input id="twtype"  type="hidden"/>

<input id="xgflag"  type="hidden"/>
<input id="amflag"  type="hidden"/>
<input id="twflag"  type="hidden"/>

<input id="xgqzsy"  type="hidden"/>
<input id="amqzsy"  type="hidden"/>
<input id="twqzsy"  type="hidden"/>

<input id="xgqwd"  type="hidden"/>
<input id="amqwd"  type="hidden"/>
<input id="twqwd"  type="hidden"/>

<input id="xgyxcs"  type="hidden"/>
<input id="amyxcs"  type="hidden"/>
<input id="twyxcs"  type="hidden"/>

    <div class="aui-content">
        <div class="aui-card-list-content">
            <img src="../image/banner_03.jpg" alt="" />
        </div>
        <p style='color:red; padding:0.5rem 0 0 0.8rem;'>*目前只支持吉林省签发的证件。</p>
        <section class="aui-content-padded">
            <div class="aui-card-list">
                <div class="aui-card-list-header">
                    签注业务种类
                </div>
                <div class="aui-content aui-margin-b-15">
                    <ul class="aui-list aui-media-list">
                        <li  style="display: " id="xgli" class="aui-list-item">
                            <div class="aui-media-list-item-inner">
                                <div class="aui-list-item-media" style="width: 3rem;">
                                    <img src="../image/icon2.png" class="aui-img-round aui-list-img-sm">
                                </div>
                                <div class="aui-list-item-inner aui-list-item-arrow" onclick="show_layer('xg');" id="xgdiv">
                               	     香港旅游签注
                               	   <p id="xgts"></p>
                                </div>
                            </div>
                        </li>
<!--                                    <li class="aui-list-item aui-list-item-middle" id="xgtdlv" style="display:none "> -->
<!--                             <div class="aui-media-list-item-inner"> -->
<!--                                 <div class="aui-list-item-media" style="width: 3rem;"> -->
<!--                                     <img src="../image/icon2.png" class="aui-img-round aui-list-img-sm"> -->
<!--                                 </div> -->
<!--                                 <div class="aui-list-item-inner aui-list-item-arrow" onclick="lvqz(02)"> -->
<!--                                     香港团队旅游签注 -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </li> -->
                      <li style="display:" id="amli" class="aui-list-item">
                            <div class="aui-media-list-item-inner">
                                <div class="aui-list-item-media" style="width: 3rem;">
                                    <img src="../image/icon3.png" class="aui-img-round aui-list-img-sm">
                                </div>
                                <div class="aui-list-item-inner aui-list-item-arrow" onclick="show_layer('am');">
                               	     澳门旅游签注
                               	   <p id="amts"></p>
                                </div>
                            </div>
                        </li>
<!--                         <li class="aui-list-item aui-list-item-middle" id="amtdlv" style="display:none "> -->
<!--                             <div class="aui-media-list-item-inner"> -->
<!--                                 <div class="aui-list-item-media" style="width: 3rem;"> -->
<!--                                     <img src="../image/icon3.png" class="aui-img-round aui-list-img-sm"> -->
<!--                                 </div> -->
<!--                                 <div class="aui-list-item-inner aui-list-item-arrow" onclick="lvqz(12)"> -->
<!--                                     澳门团队旅游签注 -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </li> -->
                      <li style="display: " id="twli" class="aui-list-item">
                            <div class="aui-media-list-item-inner">
                                <div class="aui-list-item-media" style="width: 3rem;">
                                    <img src="../image/icon1.png" class="aui-img-round aui-list-img-sm">
                                </div>
                                <div class="aui-list-item-inner aui-list-item-arrow" onclick="show_layer('tw');" id="twdiv">
                               	     台湾旅游签注
                               	   <p id="twts"></p>
                                </div>
                            </div>
                        </li>
<!--                        <li class="aui-list-item aui-list-item-middle"  id="twtdlv" style="display:none "> -->
<!--                             <div class="aui-media-list-item-inner"> -->
<!--                                 <div class="aui-list-item-media" style="width: 3rem;"> -->
<!--                                     <img src="../image/icon1.png" class="aui-img-round aui-list-img-sm"> -->
<!--                                 </div> -->
<!--                                 <div class="aui-list-item-inner aui-list-item-arrow" onclick="lvqz(22)"> -->
<!--                                     台湾团队旅游签注 -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </li> -->
                         
                    </ul>
                </div>
            </div>
        </section>
         <div class="aui-list-item aui-list-item-middle aui-content-padded">
        	 <div class="aui-btn aui-btn-block aui-btn-info" id ="end"  onclick="SaveQzxx('loading')">提交申请</div>
         </div>
        <section class="aui-content-padded">
            <div class="aui-card-list">
                <div class="aui-card-list-header">
                    已申请签注业务
                </div>
                <div class="aui-content aui-margin-b-15"  id="bzjdList">
                    <ul class="aui-list aui-list-in">
                    </ul>
                </div>
            </div>
            
        </section>
    </div>
    
     <!-- 弹出层后遮罩 -->
     <div class="pop_box" style="display: none;"></div>
    <!-- 香港弹出层 -->
  
    <div class="layui-layer layui-layer-dialog pop_layer" style="z-index: 19891033; position: absolute; left: 4%; display: none;"  id="xgqztcc">
        <div class="layui-layer-title" style="cursor: move;" >香港旅游签注</div>
        <section class="aui-content-padded" style=" margin: 0;">
            <div class="aui-card-list">
                <p class="" style=" padding-left: 0.6rem; color: #9b1323">
                    *请选择签注种类
                </p>
                <div class="aui-card-list-header yu_layer" style="border-bottom: 1px solid #d5d5d5;" id="xg_layer" >
                    <div class="aui-list-item-inner" id="xggrlvqz">
                        <div class="aui-btn aui-btn-primary" id="xggrlvqz1" >&nbsp;个人旅游签注&nbsp;</div>
                    </div>
                    <div class="aui-list-item-inner"  id="xgtdlvqz" >
                        <div class="aui-btn" id="xgtdlvqz1"> &nbsp;团队旅游签注&nbsp;</div>
                    </div>
                </div>
                <div class="aui-content">
                    <ul class="aui-list aui-media-list">
                        <li class="aui-list-item aui-list-item-middle" id="xgY031">
                            <div class="aui-media-list-item-inner">
                                <div class="aui-list-item-media" style="width: 2.5rem;">
                                    <img src="../image/icon6.png" class="aui-img-round aui-list-img-sm">
                                </div>
                                <div class="aui-list-item-inner" >
                                    <label>3个月一次 <input class="aui-radio float" type="radio" name="xgradio" value="Y031" id="3个月一次" > </label>
                                </div>
                            </div>
                        </li>
                         <li class="aui-list-item aui-list-item-middle" id="xgY032">
                            <div class="aui-media-list-item-inner">
                                <div class="aui-list-item-media" style="width: 2.5rem;">
                                    <img src="../image/icon6.png" class="aui-img-round aui-list-img-sm">
                                </div>
                                <div class="aui-list-item-inner" >
                                    <label>3个月二次 <input class="aui-radio float" type="radio" name="xgradio" value="Y032" id="3个月二次" > </label>
                                </div>
                            </div>
                        </li>
                        <li class="aui-list-item aui-list-item-middle"  id="xgN011">
                            <div class="aui-media-list-item-inner">
                                <div class="aui-list-item-media" style="width: 2.5rem;">
                                    <img src="../image/icon4.png" class="aui-img-round aui-list-img-sm">
                                </div>
                                <div class="aui-list-item-inner">
                                    <label>一年一次 <input class="aui-radio float" type="radio" name="xgradio" value="N011" id="一年一次"> </label>
                                </div>
                            </div>
                        </li>
                         <li class="aui-list-item aui-list-item-middle"  id="xgN012">
                            <div class="aui-media-list-item-inner">
                                <div class="aui-list-item-media" style="width: 2.5rem;">
                                    <img src="../image/icon4.png" class="aui-img-round aui-list-img-sm">
                                </div>
                                <div class="aui-list-item-inner">
                                    <label>一年二次 <input class="aui-radio float" type="radio" name="xgradio"  value="N012" id="一年二次" > </label>
                                </div>
                            </div>
                        </li>

                    </ul>
                </div>
            </div>
        </section>
        <span class="layui-layer-setwin">
        <a class="layui-layer-ico layui-layer-close layui-layer-close1"  onclick="close_layer('xg');"></a>
        </span>
        <div class="layui-layer-btn layui-layer-btn-">
            <a class="layui-layer-btn0" onclick="hide_layer('xg');">确 定</a>
            <a class="layui-layer-btn1" onclick="clean('xg');">取 消</a>
        </div>
        <span class="layui-layer-resize"></span>
    </div>
	<!-- 弹出层 end -->
	
	 <!-- 澳门弹出层 -->
	    <div class="layui-layer layui-layer-dialog pop_layer" style="z-index: 19891033; position: absolute; left: 4%; display: none;" id="amqztcc">
        <div class="layui-layer-title" style="cursor: move;" >澳门旅游签注</div>
        <section class="aui-content-padded" style=" margin: 0;">
            <div class="aui-card-list">
                <p class="" style=" padding-left: 0.6rem; color: #9b1323">
                    *请选择签注种类
                </p>
                <div class="aui-card-list-header yu_layer" style="border-bottom: 1px solid #d5d5d5;" id="am_layer">
                    <div class="aui-list-item-inner"  id="amgrlvqz">
                        <div class="aui-btn aui-btn-primary" id="amgrlvqz1">&nbsp;个人旅游签注&nbsp;</div>
                    </div>
                    <div class="aui-list-item-inner"  id="amtdlvqz">
                        <div class="aui-btn"  id="amtdlvqz1"> &nbsp;团队旅游签注&nbsp;</div>
                    </div>
                </div>
                <div class="aui-content">
                    <ul class="aui-list aui-media-list">
                        <li class="aui-list-item aui-list-item-middle" id="amY031">
                            <div class="aui-media-list-item-inner">
                                <div class="aui-list-item-media" style="width: 2.5rem;">
                                    <img src="../image/icon6.png" class="aui-img-round aui-list-img-sm">
                                </div>
                                <div class="aui-list-item-inner" >
                                    <label>3个月一次 <input class="aui-radio float" type="radio" name="amradio" value="Y031"  id="3个月一次"> </label>
                                </div>
                            </div>
                        </li>
                         
                        
                        <li class="aui-list-item aui-list-item-middle"  id="amN011">
                            <div class="aui-media-list-item-inner">
                                <div class="aui-list-item-media" style="width: 2.5rem;">
                                    <img src="../image/icon4.png" class="aui-img-round aui-list-img-sm">
                                </div>
                                <div class="aui-list-item-inner">
                                    <label>一年一次 <input class="aui-radio float" type="radio" name="amradio" value="N011" id="一年一次" > </label>
                                </div>
                            </div>
                        </li>
                    

                    </ul>
                </div>
            </div>
        </section>
        <span class="layui-layer-setwin">
        <a class="layui-layer-ico layui-layer-close layui-layer-close1" onclick="close_layer('am');"></a>
        </span>
        <div class="layui-layer-btn layui-layer-btn-">
            <a class="layui-layer-btn0" onclick="hide_layer('am');">确 定</a>
            <a class="layui-layer-btn1" onclick="clean('am');">取 消</a>
        </div>
        <span class="layui-layer-resize"></span>
    </div>
	<!-- 弹出层 end -->
	
	
	 <!-- 台湾弹出层 -->
	
	    <div class="layui-layer layui-layer-dialog pop_layer" style="z-index: 19891033; position: absolute; left: 4%; display: none;" id="twqztcc">
        <div class="layui-layer-title" style="cursor: move;" >台湾旅游签注</div>
        <section class="aui-content-padded" style=" margin: 0;">
            <div class="aui-card-list">
                <p class="" style=" padding-left: 0.6rem; color: #9b1323">
                    *请选择签注种类
                </p>
                <div class="aui-card-list-header yu_layer" style="border-bottom: 1px solid #d5d5d5;" id="tw_layer">
                    <div class="aui-list-item-inner" id="twgrlvqz">
                        <div class="aui-btn aui-btn-primary"  id="twgrlvqz1">&nbsp;个人旅游签注&nbsp;</div>
                    </div>
                    <div class="aui-list-item-inner"  id="twtdlvqz" >
                        <div class="aui-btn" id="twtdlvqz1" > &nbsp;团队旅游签注&nbsp;</div>
                    </div>
                </div>
                <div class="aui-content">
                    <ul class="aui-list aui-media-list">
                        <li class="aui-list-item aui-list-item-middle"  id="twY061"> 
                            <div class="aui-media-list-item-inner">
                                <div class="aui-list-item-media" style="width: 2.5rem;">
                                    <img src="../image/icon5.png" class="aui-img-round aui-list-img-sm">
                                </div>
                                <div class="aui-list-item-inner">
                                    <label>6个月一次 <input class="aui-radio float" type="radio" name="twradio" value="Y061" id="6个月一次 " checked="checked"> </label>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </section>
        <span class="layui-layer-setwin">
        <a class="layui-layer-ico layui-layer-close layui-layer-close1" onclick="close_layer('tw');"></a>
        </span>
        <div class="layui-layer-btn layui-layer-btn-">
            <a class="layui-layer-btn0" onclick="hide_layer('tw');">确 定</a>
            <a class="layui-layer-btn1" onclick="clean('tw');">取 消</a>
        </div>
        <span class="layui-layer-resize"></span>
    </div>
	<!-- 弹出层 end -->
	
	
	
</body>
<script type="text/javascript" src="../script/api.js" ></script>
<script type="text/javascript">
</script>
</html>