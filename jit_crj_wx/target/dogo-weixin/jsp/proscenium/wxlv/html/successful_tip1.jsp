<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="/WEB-INF/tld/c.tld" prefix="c"%>
<%
	String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
    //微信用户唯一标识
   String openid = request.getParameter("openid");
   String code = request.getParameter("code");
   String sqid = request.getParameter("sqid");
   //String openid = "123456";
%> 
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
    <meta name="format-detection" content="telephone=no,email=no,date=no,address=no">
    <title>网上缴费</title>
    <link rel="stylesheet" type="text/css" href="../css/aui.2.0.css" />
    <script type="text/javascript" src="<%=basePath%>/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>/js/jweixin-1.0.0.js"></script>
    <script type="text/javascript" src="<%=basePath%>/jsp/proscenium/lib/Validform_v5.3.2/demo/js/Validform_v5.3.2.js"></script>
    <script type="text/javascript" src="<%=basePath%>/jsp/proscenium/lib/layer-v2.1/layer/layer.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/My97Date/WdatePicker.js" charset="utf-8"></script>
	<script type="text/javascript" src="<%=basePath%>/jsp/proscenium/wxlv/js/cookie.js"></script>
	<script type="text/javascript" src="<%=basePath%>/jsp/proscenium/wxlv/js/findyw.js"></script>
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
        .aui-list-item-input input,.aui-list-item-input select { color: #959494!important;}
        .aui-list-item-input select { padding: 0 0.6rem;}
        .aui-card-list-content-padded { padding: 0.4rem 0.75rem;}
        .have_pay {width: 50px; height: 50px; position: absolute; top: 10px; right: 10px;}
        .btn_zf { float: right; width: 30%;padding: 0.2rem 0; text-align: center;}
        .card_box { padding-bottom: 15px; position: relative; overflow: hidden; width: 100%;}
        .aui-card-list-footer{ padding:0rem 0.75rem; min-height: 15px;}
    </style>
     <script type="text/javascript">
    var basePath= "<%=basePath%>";
    var openid= getCookie('openid');
    var ywcode='';
    var arr = new Array();
    var sqid='<%=sqid%>';
    var sfzh = getCookie('sfzh');
    var ccflag = getCookie('ccflag')
    var lxdh =getCookie('lxdh');
    var dialog = new auiDialog({});
    var endywxx='';
    var dwxx=getCookie('dwxx');
    
    //测试
   var payStatus;
    $(function (){
    	// 初始化提示信息
		var str = "";
		
		var ywstr="<div class='aui-card-list card_box' >";
			// 业务所需总金额
	    var feiYong = 0;
			// 办理业务名称（业务1、业务2、业务3...）
		var name = "";
			// 准备URL和参数列表
			var url = "http://221.8.52.247:8445/jit_crj/crj/WxQz/lvqzxxts.do";
			var listParams = {
				"sfzh": sfzh,
				"ccflag":ccflag,
				"sqid" : sqid
			};
			$.ajaxSettings.async = false; 
			// 发出请求并处理返回数据
		$.getJSON(url, listParams, function(json) {
			
		$.each(json.ywxxs, function(i, ywxx) {
			
			
        
        
				var yxcs = '';
			    if(ywxx.yxcs != '无'){
			    	yxcs = "有效次数:" +ywxx.yxcs;
			    }
			    arr[i] = ywxx.ywid ;
<%-- 			    var paras = "amt=0.01&payno="+'<%=loginId%>'+"&pername=测试&phoneNum="+'<%=phoneNum%>'+"&servicename="+ywxx.name+"&payedurl=2&bizno="+ywxx.ywid+"&ywbh="+ywxx.ywbm; --%>
           

<%-- 				var paras = "amt="+ywxx.feiyong+"&payno="+'<%=loginId%>'+"&pername="+ywxx.zwxm+"&phoneNum="+'<%=phoneNum%>'+"&servicename="+ywxx.name+"&payedurl=2&bizno="+ywxx.ywid+"&ywbh="+ywxx.ywbm; --%>
				
// 				paras+="&appReserved="+"{\\\'areaCode\\\':\\\'"+ywxx.ywbm.substring(0,6)+"\\\'}" ;
<%-- 				var paras = "amt="+ywxx.feiyong+"&payno="+'<%=loginId%>'+"&pername="+ywxx.zwxm+"&phoneNum="+'<%=phoneNum%>'+"&servicename="+ywxx.name+"&payedurl=2&bizno="+ywxx.ywid+"&ywbh="+ywxx.ywbm; --%>

// 				ywstr += "<P>" + (i + 1) + "、" + ywxx.name + "&nbsp;"+"业务编号:" + ywxx.ywbm + "<p>"+"&nbsp;&nbsp;费用:"+ywxx.feiyong+"元";
				
				
				ywstr += " <div class='aui-card-list-header'>您办理的业务</div>";
				ywstr +="<div class='aui-card-list-content-padded'>业务名称：";
				ywstr += ywxx.name+"</div>";
				ywstr +="<div class='aui-card-list-content-padded'>业务编号：";
				ywstr +=ywxx.ywbm+"</div>";
				ywstr +="<div class='aui-card-list-content-padded'> 费用：";
				ywstr +=ywxx.feiyong+"元</div>";
				endywxx=ywxx.name+'业务编号：'+ywxx.ywbm;
				setCookie('ywxx',endywxx);
				setCookie('ywmc',ywxx.name);
				setCookie('ywbm',ywxx.ywbm);

// 				 <div class="aui-card-list-header">
// 	             您办理的业务
// 	        </div>
// 	        <div class="aui-card-list-content-padded">
// 	            业务名称：澳门个人旅游签注
// 	        </div>
// 	        <div class="aui-card-list-content-padded">
// 	            业务编号：202020220202020
// 	        </div>
// 	        <div class="aui-card-list-content-padded">
// 	            费用：20元
// 	        </div>
// 	        <div class="aui-btn-warning btn_zf" id="zftext">支 付</div>
// 	        <div class="have_pay"><img src="../image/yzf_icon.png" alt="" width="100%" /></div>
				ywxx.payStatus='1';
				
				if(ywxx.payStatus=='1'){
					ywstr +="<div class='have_pay'><img src='../image/yzf_icon.png' alt='' width='100%' /></div>";
				}else{
					ywstr +="<div class='aui-btn-warning btn_zf'";
					ywstr +="onclick=\"sub(";
					ywstr +="\'";
					ywstr +=paras;
					ywstr +="\'";
					ywstr +=")";
					ywstr +="\">支付</div>";
					ywstr +="<div class='have_pay'></div>";
				feiYong+=ywxx.feiyong;
				ywcode=ywxx.ywbm;
// 				alert(ywxx.payStatus);
				}
			});
		
// 		$.each(json.mtslist, function(i, result) {
// 			  str += "<P>" + (i + 1) + "、" + result.tsxx + "</P>";
// 		});
// 		//加总费用合计
// 		ywstr+="<p>【总费用】:"+feiYong;
		ywstr+="</div>";
		/* ywstr+="<br>";
		ywstr+="<p><font size='1' color='blue'>系统提示：暂时只支持支付宝付款，请不要选择其他付款方式</font></p>"; */
	
		// 申请业务名称
	     $("#zfxxts").html(ywstr);
		
		});
    })
    function zftext(){
		$.ajax({
			url : basePath + "crj/shenqing/manager/zftext.do",
			data : {
				"ywcode" : ywcode
				
			},
			type : "post",
			dataType : 'json',
			success : function(data, textStatus) {
				if(data!=null && data.success=="false"){
				
					msgShow("提示！",data.message);
				}else{
					alert();
				}
			}
		});
    }
    
    function cancel(){
    	window.location.href=basePath+"qiantai/shenqing/sqfirst1.jsp";
    }
    
    //提交支付，调支付接口
    function sub(paras){
    	var url = "<%=basePath %>/crj/wxqz/pay.do?"+paras+"&random=" + Math.random();
    	
    	window.open (encodeURI(url),'pop','width='+(window.screen.availWidth-10)+',height='+(window.screen.availHeight-30)+ ',top=0,left=0,toolbar=no,menubar=no,scrollbars=yes, resizable=no,location=no, status=no') 
    }
    
    function next(){
    	sub();
//     	var status = 0;
//     	for(var i=0;i<arr.length;i++){
//     		//先根据业务ID检查支付状态，全部支付成功才跳转页面
// 	    	var url ="http://221.8.52.247:8445/jit_crj/crj/WxQz/crj/shenqing/manager/zftext.do";
// 	    	//alert(url)
// 	    	$.ajax({
// 	    	    url: url,
// 	    	    data:{
// 	    	    		"bizNo":arr[i]   //业务id
// 	    	      },
// 	    	     type: "post",
// 	    	  	 dateType:"json",
// 	    	  	async:false,
// 	    	 	 success: function(data) {
// 	    	 		 //data="00";
// 	    	 		 if(data=="404"){
// 	    	 		 	//alert("未找到支付记录");
// 	    	 		 	status = status +1;
// 	    	 		 }else if(data=="00"){
// 	    	 			 $("#"+arr[i]).removeAttr("onclick");
// 	    	 			$("#"+arr[i]).text("已支付");
// 	    	 			// alert("支付成功");
// 	    	 		 }else{
// 	    	 		//	 alert("支付失败");
// 	    	 			status = status +1;
// 	    	 		 }
// 	    	    },
// 	    	    error:function(){
// 	    	   	 	alert("对不起,系统繁忙,请稍候重试");
// 	    	   	 	status = status +1;
// 	    	    } 
// 	    	});
//     	}
//     	if(status !=0){
//     		alert("存在未支付的订单，请支付后再点击");
//     	}else{
    		
    		
//     		$.ajax({
//     			url : "http://221.8.52.247:8445/jit_crj/crj/WxYj/smqj.do",
//     			data : {
//     				"sqid" : sqid,
//     				"sfzh" :sfzh,
//     				"lxdh":lxdh
    				
//     			},
//     			type : "post",
//     			dataType : 'json',
//     			success : function(data) {
//     				if(data.flag=='1'){
//     					dialog.alert({
//     			             title:"提示",
//     			             msg:'激活上门取件成功等待EMS上门取件',
//     			             buttons:['确定']
//     			         },function(ret){
//     			        		$.ajax({
//     			        			url : "http://221.8.52.247:8445/jit_crj/crj/WxYj/smqj.do",
//     			        			data : {
//     			        				"openid" : openid,
//     			        				"dwxx" :dwxx,
//     			        				"endywxx":endywxx
    			        				
//     			        			},
//     			        			type : "post",
//     			        			dataType : 'json',
//     			        			success : function(data) {
    			        				
//     			        			}
//     			        		});
    			        		
    			        		
    			        	 
//     			        	 location="kind_business.jsp";
//     			         })
//     				}else{
    					
//     					dialog.alert({
//    			             title:"提示",
//    			             msg:'激活上门取件失败 请重新激活',
//    			             buttons:['确定']
//    			         },function(ret){
   			        	 
//    			         })
//     				}
//     			}
//     		});
//     		//alert(basePath+"qiantai/ywlc/ecqz/qz_ems_get.jsp?yycode="+arr.join(",")+"&sqid="+sqid);
// //     		window.location.href = basePath+"qiantai/ywlc/ecqz/qz_ems_get.jsp?sqid="+sqid;
//     	}
       location="successful_tip.jsp?openid="+openid+'&sqid='+sqid;
    }
    
    function testpay(){
    	for(var i=0;i<arr.length;i++){
	    	var url = "<%=basePath%>crj/pay/testPay.do";
	    	//alert(url)
	    	$.ajax({
	    	    url: url,
	    	    data:{
	    	    		"bizNo":arr[i]
	    	      },
	    	     type: "post",
	    	  	 dateType:"json",
	    	 	 success: function(data) {
	    	 		 alert('支付成功');
	    	 		 $("#paynext").attr("onclick","testnext()")
	    	   	 },
	    	    error:function(){
	    	   	 	alert("对不起,系统繁忙,请稍候重试");
	    	    } 
	    	});
    	}
    	
    }
    
    function testnext(){
    	window.location.href = basePath+"qiantai/ywlc/ecqz/qz_ems_get.jsp?sqid="+sqid;
    }
    function zf(){
    	
    	alert('支付成功');
    	
    	
    }
    </script>
</head>
<body>
<div class="aui-content" style="padding-bottom: 3rem;">
    <div class="aui-card-list-content">
        <img src="../image/banner06.jpg" alt="" />
    </div>
    <section class="aui-content-padded" id="zfxxts">
<!--         <div class="aui-card-list card_box" > -->
<!--             <div class="aui-card-list-header"> -->
<!--                  您办理的业务 -->
<!--             </div> -->
<!--             <div class="aui-card-list-content-padded"> -->
<!--                 业务名称：澳门个人旅游签注 -->
<!--             </div> -->
<!--             <div class="aui-card-list-content-padded"> -->
<!--                 业务编号：202020220202020 -->
<!--             </div> -->
<!--             <div class="aui-card-list-content-padded"> -->
<!--                 费用：20元 -->
<!--             </div> -->
<!--             <div class="aui-btn-warning btn_zf" id="zftext">支 付</div> -->
<!--             <div class="have_pay"><img src="../image/yzf_icon.png" alt="" width="100%" /></div> -->
<!--         </div> -->
    </section>
<!--     <section class="aui-content-padded"> -->
<!--         <div class="aui-card-list card_box"> -->
<!--             <div class="aui-card-list-header"> -->
<!--                 您办理的业务 -->
<!--             </div> -->
<!--             <div class="aui-card-list-content-padded"> -->
<!--                 业务名称：香港个人旅游签注 -->
<!--             </div> -->
<!--             <div class="aui-card-list-content-padded"> -->
<!--                 业务编号：202020220202020 -->
<!--             </div> -->
<!--             <div class="aui-card-list-content-padded"> -->
<!--                 费用：20元 -->
<!--             </div> -->
<!--             <div class="aui-btn-warning btn_zf">支 付</div> -->
<!--             <div class="have_pay"><img src="../image/yzf_icon.png" alt="" width="100%" /></div> -->
<!--         </div> -->
<!--     </section> -->
    <div class="aui-card-list aui-content-padded">
        <div class="aui-btn aui-btn-info aui-btn-block aui-btn-sm" onclick="next()">
            激活上门取件
        </div>
    </div>
    <div class="aui-card-list-footer">
        *点击激活上门取件按钮可激活本次业务
    </div>
</div>
</body>
<script type="text/javascript" src="../script/api.js" ></script>
</html>