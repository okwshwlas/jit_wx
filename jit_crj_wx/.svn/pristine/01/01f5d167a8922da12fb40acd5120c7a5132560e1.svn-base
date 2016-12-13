<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="/WEB-INF/tld/c.tld" prefix="c"%>
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
//openid ="5521233422";
//openid = "oSUoSuMs9E51ulqU1tVuqqGLCHis";     //欣姐openid
//openid = "oSUoSuHROyzW9Vu48UIj3UJ7WrmU";   //全能openid
//openid = "oSUoSuDIOQ-YeJZWI--XNvzNh1Xc";   //我的
 //接公安参数
 String retoken = request.getParameter("qwert");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
    <meta name="format-detection" content="telephone=no,email=no,date=no,address=no">
    <title>我的出入境</title>
    <link rel="stylesheet" type="text/css" href="../css/default.css" />
    <link rel="stylesheet" type="text/css" href="../css/commont.css" />
    
    <!-- <link rel="stylesheet" type="text/css" href="../css/aui.2.0.css" /> -->
    <script type="text/javascript" src="<%=basePath%>/js/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/jweixin-1.0.0.js"></script>
	<script type="text/javascript" src="<%=basePath%>/jsp/proscenium/grzx/js/commet.js"></script>
	<script type="text/javascript" src="<%=basePath%>/jsp/proscenium/lib/Validform_v5.3.2/demo/js/Validform_v5.3.2.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/My97Date/WdatePicker.js" charset="utf-8"></script>
	<script type="text/javascript" src="<%=basePath%>/jsp/proscenium/grzx/js/cookie.js"></script>
	<script type="text/javascript" src="<%=basePath%>/jsp/proscenium/grzx/js/findyw.js"></script>
	<script type="text/javascript" src="<%=basePath%>/jsp/proscenium/grzx/js/zhuce.js"></script>
	<script type="text/javascript" src="<%=basePath%>/jsp/proscenium/grzx/js/token.js"></script>
	<script type="text/javascript" src="<%=basePath%>/jsp/proscenium/grzx/js/smrz.js"></script>
	
	
    
    <style>
        html {height: 100%; width: 100%; font-family: 'Heiti SC', 'Microsoft YaHei'; font-size: 100px; outline: 0; -webkit-text-size-adjust:none; background-color: #f5f5f5;}
        body { height: 100%; -webkit-user-select: none; position: relative;}
        div,p,span,ul,li,dl,td,dd,input,select,button,a{ font-size: 0.24rem;}
    </style>
    <script type="text/javascript">
	var xxcome="";
	var sjhm = "" ;
	var openid= "";
	var name = "";
	var hjszdpcs = "";
	var basePath= "<%=basePath%>";
     var sixteenflag = '<%=sixteenflag%>';
	//  var sixteenflag = '0';
		//国家工作人员标记 1是国家工作人员
		var gzryflag = '<%=gzryflag%>';
		var basePath= "<%=basePath%>";
		var openid= '<%=openid%>';
		var code= "<%=code%>";
		var idCard;
		var ccflag;
		var hjszdpcs;
		var sfzh =getCookie('sfzh');
    function ready1(){
        (function (doc, win) {
            var docEl = doc.documentElement,
                    resizeEvt = 'orientationchange' in window ? 'orientationchange' : 'resize',
                    recalc = function () {
                        var clientWidth = docEl.clientWidth;
                        if (!clientWidth) return;
                        docEl.style.fontSize = 100 * (clientWidth / 750) + 'px';
                    };
            if (!doc.addEventListener) return;
            win.addEventListener(resizeEvt, recalc, false);
            doc.addEventListener('DOMContentLoaded', recalc, false);
        })(document, window);

    }
	    $(document).ready(function() {
		
	    	     ready1();
				 token= "<%=retoken%>";
				 
				 if(token=='null'){
				 
				  
				if('null'!=openid){
					setCookie("openid",openid);
				}
	    		if('null'!=code){
	    			var url = basePath + "/proscenium/crjRyjbxxController/weixin/Get_Openid.do?random=" + Math.random();
	    			var listParams = {
	    					"code" : code
	    		 	};
	    			$.ajaxSettings.async = false; 
	    			$.getJSON(url,listParams, function(json){
	    				if(json.code=="000000"){
	    					openid=json.data;
							setCookie("openid",openid);
	    				}
	    			});
	    		}else{
				
					if("null"==openid){
					openid = getCookie("openid");
					
					}
			
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
	    			return location = 'ryxxbd.jsp?openid='+openid;
	    		}
	    		
	    		
	    		//查询人员信息进行逻辑判断****start******
	    		var zhucexx =findzhucexx(openid);
	    		if(zhucexx !=false){
	    			//认证标识  0:暂未认证，1:认证通过，­9,认证不通过
	    			var identityStatus = zhucexx.identityStatus;
	    			//如果未认证 不显示人员信息
	    			if(identityStatus =='1'){
	    				$("#yrz").show();
	    				$("#wrz").hide();
						setCookie('aliasName',zhucexx.aliasName);
	    				setCookie('userName',zhucexx.userName);
	    				$("#name").text(zhucexx.aliasName+'   '+zhucexx.userName);
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
				 				if(data.flag=='3'){
				 					//请求超哥接口  身份证idCard
				 					//{"sfzh":"220104198404241520","openid":"","list":[{"yxqz":"2026-03-30","zjzt":"zhengchang","zjzl":"14"},{"yxqz":"2026-03-30","zjzt":"zhengchang","zjzl":"21"},{"yxqz":"2021-03-30","zjzt":"zhengchang","zjzl":"25"}],"success":"true"}
									//{"sfzh":"220503198610251047","openid":"","list":[{"bljd":"受理中","ywlx":"护照","slrq":"2016-10-27 16:58:31"}],"success":"true"}
				 					$.ajax({
				 						url : basePath + "/proscenium/crjwxgrxxController/weixin/qqsj.do",
				 						data:{
				 							"type":"zjtx",
				 							"sfzh":idCard,
				 							"openid":openid
				 						},
				 						type:"post",
				 						dateType:"JSON",
				 						success:function(data){
										//data = eval(data); 
										data = $.parseJSON(data);
				 							//护照
											var list = new Array();
											list = data.data.list;
				 							if(list!=null&&list!=""){
				 								$("#dqtxForm").show();
				 								$("#zwzj").hide();
				 								for(var a = 0; a<list.length;a++){
					 								if(list[a].zjzl=="14"){
						 								$("#hzForm").show();
						 								$("#hz").text("普通护照");//护照
						 								$("#hzsj").html(list[a].yxqz);//护照时间
						 							}
					 								//港澳证
						 							if(list[a].zjzl=="21"){
						 								$("#gazForm").show();
						 								$("#gaz").text("往来港澳通行证");//港澳证
						 								$("#gazsj").html(list[a].yxqz);//港澳证时间
						 							}
						 							//台湾证
						 							if(list[a].zjzl=="25"){
						 								$("#twzForm").show();
						 								$("#twz").text("大陆居民往来台湾通行证");//台湾证
						 								$("#twzsj").html(list[a].yxqz);//台湾证时间
						 							}
				 								}
				 							}else{
				 								$("#dqtxForm").hide();
				 								$("#zwzj").show();
				 								$("#dqtx").hide();
				 							}
				 						}
				 					})
				 					//请求接口
				 					$.ajax({
				 						url : basePath + "/proscenium/crjwxgrxxController/weixin/qqsj.do",
				 						data:{
				 							"type":"bsjd",
				 							"sfzh":idCard,
				 							"openid":openid
				 						},
				 						type:"post",
				 						dateType:"JSON",
				 						success:function(data){
											data = $.parseJSON(data);
				 							var list = new Array();
											list = data.data.list;
				 							if(list!=null&&list!=""){
				 								$("#xxtxForm").show();
				 								for(var a = 1; a<list.length;a++){
				 									var bsjd = '<div style="position: relative" class="bsjd_list">';
				 									bsjd += '<div class="aui-info ">'
			 						                bsjd += '<p class="bsjd_list_tit">'+list[a].ywlx+'</p>'
			 						                bsjd += '<div class="aui-info-item aui-text-warning">'+list[a].bljg+'</div>'
			 						                bsjd += '</div>'
			 						                bsjd += '<p>'+list[a].slrq+'</p>'
			 						                bsjd += '<div class="tip_dian"></div>'
			 						                bsjd += '</div>'
			 						                $("#form").append(bsjd);
				 								}
				 							}else{
				 								$("#xxtxForm").hide();
				 								$("#zwxx").show();
				 								$("#xxtx").hide();
				 							}
				 						}
				 					})
				 				}
				 				
				 			}
				 		});
	    			}
	    			if(identityStatus == '0'||'' == identityStatus ||identityStatus ==undefined){
	    				$("#yrz").hide();
	    				$("#wrz").show();
	    				alert('您还没有进行实名认证,请先进行实名认证');
	    				return location = 'renzheng.jsp?openid='+openid
	    			}
	    			if(identityStatus == '-9'){
	    				$("#yrz").hide();
	    				$("#wrz").show();
	    				alert('您提交的实名认证没有通过,请重新进行实名认证');
	    				return location = 'renzheng.jsp?openid='+openid
	    			}
	    		}else{
	    			alert('获取人员信息出错!');
	    			pushHistory();
	    			
	    		}
	    		//查询人员信息进行逻辑判断****end******
	    		
	    		
	    		
	    		//查询证件信息****start******
	    		/* $.ajax({
	    			url : "http://192.168.1.113:8445/jit_crj/crj/WxRy/findZj.do",
	    			data : {
	    				"sfzh" :idCard ,
	    				"lxdh" : sjhm
	    			},
	    			type : "post",
	    			dataType:"JSON",
	//     			jsonp: "callback",//传递给请求处理程序或页面的，用以获得jsonp回调函数名的参数名(一般默认为:callback)
	//     	        jsonpCallback:"flightHandler",//自定义的jsonp回调函数名称，默认为jQuery自动生成的随机函数名，也可以写"?"，jQuery会自动为你处理数据
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
	
	    						/* var loginUrl = "http://192.168.1.113:8445/jit_crj/crj/WxRy/login.do";
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
	    								}
	    							}); 
	    		         //查询个人信息*******end****
	    					
	    				}
	    			}
	    		}); */
	    		//查询证件信息****end******
	    	 
	    	 returnhide();
	    	 findbzjd();
	    	 location="123.jsp";
				 
				 
				 }else{
				 
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
    										idCard = obj.sfzh;
//     										sfzh='220104198404241520'
    										sjhm = obj.sjhm;
    										name = obj.name;
    										openid = obj.openId;
    										xxcome = obj.xxcome;
    										hkszdpcs = obj.hkszdpcs;
    										setCookie('openid',openid);
    										setCookie('sfzh',sfzh);
    										setCookie('lxdh',sjhm);
											setCookie('name',name);
											setCookie('aliasName',name);
	    				                    setCookie('userName',sjhm);
											if(hkszdpcs != null &&hkszdpcs.substring(0, 1)=='2'){
	    					                    setCookie('ccflag','1');
	    				                       }else{
	    					                  setCookie('ccflag','0');
	    				                      }
    									}else{
    										alert('解析吉林公安参数错误,请重新进入!');
    										return;
    									}
     								}
    						});
							
							
				
				 
				 
				  location="123.jsp";
				 
				
				 
				 
				 }
				 
				 
				
	     });



    </script>
</head>
<body>
</body>


</html>