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
openid = "33333";
%> 
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
    <meta name="format-detection" content="telephone=no,email=no,date=no,address=no">
    <title>选择签注种类</title>
    <link rel="stylesheet" type="text/css" href="../css/aui.2.0.css" />
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
	var openid= '<%=openid%>';
	var code= "<%=code%>";
	var sjhm ;
	var idCard;
	var ccflag;
	var hjszdpcs;
	var sfzh =getCookie('sfzh');
     $(function() {
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
			 			url : "http://127.0.0.1:8445/jit_crj/crj/WxRy/findRyxx.do",
			 			
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
    			url : "http://127.0.0.1:8445/jit_crj/crj/WxRy/findZj.do",
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

    						var loginUrl = "http://127.0.0.1:8445/jit_crj/crj/WxRy/login.do";
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
    		
    		
    	
    	 
    	 returnhide();
    	 findbzjd();
     });
     
     
     function pushHistory() {
    	    var state = {
    	            title: "title",
    	            url: "#"
    	        };
    	    window.history.pushState(state, "title", "#");
    	}

    	if (typeof window.addEventListener != "undefined") {
    	    window.addEventListener("popstate", function (e) {
    	        WeixinJSBridge.call('closeWindow');
    	    }, false);
    	} else {
    	    window.attachEvent("popstate", function (e) {
    	        WeixinJSBridge.call('closeWindow');
    	    });
    	}

     function lvqz(type){
    	 if(sixteenflag=='0'){
    		 alert(sixteenflag);
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
 					} else{
 						
 						alert('2');
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
</head>
<body>
    <div class="aui-content">
        <div class="aui-card-list-content">
            <img src="../image/banner_03.jpg" alt="" />
        </div>
        <section class="aui-content-padded">
            <div class="aui-card-list">
                <div class="aui-card-list-header">
                    签注业务种类
                </div>
                <div class="aui-content aui-margin-b-15">
                    <ul class="aui-list aui-media-list">
                        <li class="aui-list-item aui-list-item-middle" id="xggrlv"  style="display:none ">
                            <div class="aui-media-list-item-inner">
                                <div class="aui-list-item-media" style="width: 3rem;">
                                    <img src="../image/icon2.png" class="aui-img-round aui-list-img-sm">
                                </div>
                                <div class="aui-list-item-inner aui-list-item-arrow" onclick="lvqz(01)">
                                    香港个人旅游签注
                                </div>
                            </div>
                        </li>
                                   <li class="aui-list-item aui-list-item-middle" id="xgtdlv" style="display:none ">
                            <div class="aui-media-list-item-inner">
                                <div class="aui-list-item-media" style="width: 3rem;">
                                    <img src="../image/icon2.png" class="aui-img-round aui-list-img-sm">
                                </div>
                                <div class="aui-list-item-inner aui-list-item-arrow" onclick="lvqz(02)">
                                    香港团队旅游签注
                                </div>
                            </div>
                        </li>
                        <li class="aui-list-item aui-list-item-middle" id="amgrlv" style="display:none ">
                            <div class="aui-media-list-item-inner">
                                <div class="aui-list-item-media" style="width: 3rem;">
                                    <img src="../image/icon3.png" class="aui-img-round aui-list-img-sm">
                                </div>
                                <div class="aui-list-item-inner aui-list-item-arrow" onclick="lvqz(11)">
                                    澳门个人旅游签注
                                </div>
                            </div>
                        </li>
                        <li class="aui-list-item aui-list-item-middle" id="amtdlv" style="display:none ">
                            <div class="aui-media-list-item-inner">
                                <div class="aui-list-item-media" style="width: 3rem;">
                                    <img src="../image/icon3.png" class="aui-img-round aui-list-img-sm">
                                </div>
                                <div class="aui-list-item-inner aui-list-item-arrow" onclick="lvqz(12)">
                                    澳门团队旅游签注
                                </div>
                            </div>
                        </li>
                       <li class="aui-list-item aui-list-item-middle"  id="twgrlv" style="display:none ">
                            <div class="aui-media-list-item-inner">
                                <div class="aui-list-item-media" style="width: 3rem;">
                                    <img src="../image/icon1.png" class="aui-img-round aui-list-img-sm">
                                </div>
                                <div class="aui-list-item-inner aui-list-item-arrow" onclick="lvqz(21)">
                                    台湾个人旅游签注
                                </div>
                            </div>
                        </li>
                       <li class="aui-list-item aui-list-item-middle"  id="twtdlv" style="display:none ">
                            <div class="aui-media-list-item-inner">
                                <div class="aui-list-item-media" style="width: 3rem;">
                                    <img src="../image/icon1.png" class="aui-img-round aui-list-img-sm">
                                </div>
                                <div class="aui-list-item-inner aui-list-item-arrow" onclick="lvqz(22)">
                                    台湾团队旅游签注
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </section>
        <section class="aui-content-padded">
            <div class="aui-card-list">
                <div class="aui-card-list-header">
                    已申请签注业务
                </div>
                <div class="aui-content aui-margin-b-15"  id="bzjdList">
                    <ul class="aui-list aui-list-in">
<!--                         <li class="aui-list-item"> -->
<!--                             <div class="aui-list-item-inner aui-list-item-inner1"> -->
<!--                                 香港旅游签注 -->
<!--                             </div> -->
<!--                             <div class="aui-list-item-inner aui-list-item-inner1"> -->
<!--                                 已通过初审 -->
<!--                             </div> -->
<!--                             <div class="aui-list-item-inner aui-list-item-inner1 aui-text-info"> -->
<!--                                 填写邮寄信息 -->
<!--                             </div> -->
<!--                         </li> -->
<!--                         <li class="aui-list-item"> -->
<!--                             <div class="aui-list-item-inner aui-list-item-inner1"> -->
<!--                                 香港旅游签注 -->
<!--                             </div> -->
<!--                             <div class="aui-list-item-inner aui-list-item-inner1"> -->
<!--                                 已通过初审 -->
<!--                             </div> -->
<!--                             <div class="aui-list-item-inner aui-list-item-inner1 aui-text-info" > -->
<!--                                 填写邮寄信息 -->
<!--                             </div> -->
<!--                         </li> -->
<!--                         <li class="aui-list-item"> -->
<!--                             <div class="aui-list-item-inner aui-list-item-inner1"> -->
<!--                                 香港旅游签注 -->
<!--                             </div> -->
<!--                             <div class="aui-list-item-inner aui-list-item-inner1"> -->
<!--                                 已通过初审 -->
<!--                             </div> -->
<!--                             <div class="aui-list-item-inner aui-list-item-inner1 aui-text-info" > -->
<!--                                 填写邮寄信息 -->
<!--                             </div> -->
<!--                         </li> -->
                    </ul>
                </div>
            </div>
        </section>
    </div>
</body>
<script type="text/javascript" src="../script/api.js" ></script>
<script type="text/javascript">
</script>
</html>