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
   String rebizNo = request.getParameter("bizNo");
   String recode = request.getParameter("code");
  
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
    var code= "<%=code%>";
    var ywcode='';
    var arr = new Array();
   

    var sfzh = getCookie('sfzh');
    var ccflag = getCookie('ccflag')
    var lxdh =getCookie('lxdh');
    var dialog = new auiDialog({});
    var endywxx='';
    var dwxx=getCookie('dwxx');
//     var code ='041mkKs12rnl5017jut12Yj5t12mkKs0';
    var sqid ="<%=sqid%>"
    var rebizNo = "<%=rebizNo%>";
    var recode = "<%=recode%>";
    
    //测试
   // code = '001g7YKb1zmZ7s0ub1Kb1dp0Lb1g7YKT';
    //openid = 'oSUoSuHROyzW9Vu48UIj3UJ7WrmU';
   var payStatus;
   var weixinSS;
    $(function (){
//     	if(null!=code){
    		rebizNo = "<%=rebizNo%>";
//     			var url = basePath + "/proscenium/crjRyjbxxController/weixin/Get_Openid.do?random=" + Math.random();
//     			var listParams = {
//     					"code" : code
//     		 	};
//     			$.ajaxSettings.async = false; 
//     			$.getJSON(url,listParams, function(json){
//     				if(json.code=="000000"){
//     					openid=json.data;
//     				}
//     			});
//     		}
    	// 初始化提示信息
    	if(rebizNo!='null'){
	
    		$.ajax({
    			url : "http://221.8.52.247:8445/jit_crj/crj/WxQz/findxxByBizno.do",
    			data : {
    				"bizNo" : rebizNo
    				
    			},
				async:false,
    			type : "post",
    			dataType : 'json',
    			success : function(data) {
    				var obj = data.zjqzxx;
    				sfzh = obj.rybh;
    				sqid = obj.sqid;
					
    				
    			}
    		});
    		if(recode == '0'){
    			alert('支付失败请重新缴费');
    		}
    	}
		var str = "";
		
		 var ywstr='';
			// 业务所需总金额
	    var feiYong = 0;
			// 办理业务名称（业务1、业务2、业务3...）
		var name = getCookie('name');
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
           
                 ywstr+="<div class='aui-card-list card_box' >";
				
// 				paras+="&appReserved="+"{\\\'areaCode\\\':\\\'"+ywxx.ywbm.substring(0,6)+"\\\'}" ;

// 				ywstr += "<P>" + (i + 1) + "、" + ywxx.name + "&nbsp;"+"业务编号:" + ywxx.ywbm + "<p>"+"&nbsp;&nbsp;费用:"+ywxx.feiyong+"元";
				
				
				ywstr += " <div class='aui-card-list-header'>您办理的业务</div>";
				ywstr +="<div class='aui-card-list-content-padded'>业务名称：";
				ywstr += ywxx.name+"</div>";
				ywstr +="<div class='aui-card-list-content-padded'>业务编号：";
				ywstr +=ywxx.ywbm+"</div>";
				ywstr +="<div class='aui-card-list-content-padded'> 费用：";
				ywstr +=ywxx.feiyong+"元</div>";
				endywxx+=ywxx.name+'业务编号：'+ywxx.ywbm+',';
				setCookie('ywxx',endywxx);
				setCookie('ywmc',ywxx.name);
				setCookie('ywbm',ywxx.ywbm);
				
				
//                 var paras = "amt="+ywxx.feiyong+"&payno="+openid+"&pername="+ywxx.zwxm+"&servicename="+ywxx.name+"&payedurl=2&bizno="+ywxx.ywid+"&ywbh="+ywxx.ywbm;
// 				var payText ="amt=0.01&settleDesc=测试商品&catName=出入境缴费&payType=OA&catCode=1170010&bizNo=201711100002&payerName=出入境缴费";
				var payText="";
				var paySave="";
				if(openid=='odA_RsiMvPluFGz-ttHuJU6hHhzI'){
					ywxx.feiyong = 0.01;
				}
				payText +="amt="+ywxx.feiyong;
				payText +="&settleDesc="+ywxx.name+"微信";
				payText +="&openId="+openid;
				payText +="&name="+name;
				payText +="&sjhm="+lxdh;
				payText +="&catName=出入境缴费";
			    payText +="&payno="+sfzh;
				payText +="&payType=OA&catCode=1170010&payerName=出入境缴费";
				payText+="&bizNo="+ywxx.ywid;
				payText +="&ywbh="+ywxx.ywbm;
				paySave = payText;
// 				paras+="&appReserved="+"{\\\'openId\\\':\\\'"+openid+"\\\'}" ;
                  // payText +="&appReserved=";
                  // payText +="\{'openId':";
                  // payText +="'";
                  // payText +=openid;
                  // payText +="'";
                  // payText +="\}";
				//payText +="&appReserved="+"{\'openId\':\'"+openid+"\'}" ;
				// weixinSS=payText;
				// alert(ywxx.payStatus)
				if(ywxx.payStatus=='1'){
					ywstr +="<div class='have_pay'><img src='../image/yzf_icon.png' alt='' width='100%' /></div>";
				}else{
					ywstr +="<div class='aui-btn-warning btn_zf'";
					ywstr +="onclick=\"sub(";
					ywstr +="\'";
					ywstr +=paySave;
					ywstr +="\'";
					ywstr +=")";
					ywstr +="\">支付</div>";
					ywstr +="<div class='have_pay'></div>";
				feiYong+=ywxx.feiyong;
				ywcode=ywxx.ywbm;
				ywstr+="</div>";
// 				alert(ywxx.payStatus);
				}
			});
		
// 		$.each(json.mtslist, function(i, result) {
// 			  str += "<P>" + (i + 1) + "、" + result.tsxx + "</P>";
// 		});
// 		//加总费用合计
// 		ywstr+="<p>【总费用】:"+feiYong;
		
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
    function sub(paySave){
    	var weixinSS = paySave;
		weixinSS +="&appReserved=";
        weixinSS +="\{'openId':";
        weixinSS +="'";
        weixinSS +=openid;
        weixinSS +="'";
        weixinSS +="\}";
    	$.ajax({
			url : basePath+"/crj/wxqz/pay.do?"+paySave,
			data : {
			
			},
			type : "post",
			async:false,
			dataType : 'json',
			success : function(data) {
				if(data.data=='1'){
					location ='https://gaapi.jl.gov.cn/econsole/weixin/pay/index?'+weixinSS;
				}else{
					alert('支付失败请重新支付');
		    		return;
				}
			}
		});
    }
    
    function next(){
    	//sub();
    	var status = 0;
    	for(var i=0;i<arr.length;i++){
    		//先根据业务ID检查支付状态，全部支付成功才跳转页面  /crj/pay/getPayStatusByBizNo
	    	var url ="http://221.8.52.247:8445/jit_crj/crj/Wxzf/crj/pay/getPayStatusByBizNo.do";
	    	//alert(url)
	    	$.ajax({
	    	    url: url,
	    	    data:{
	    	    		"bizNo":arr[i]   //业务id
	    	      },
	    	     type: "post",
	    	  	 dateType:"json",
	    	  	async:false,
	    	 	 success: function(data) {
	    	 		 //data="00";
	    	 		 if(data=="404"){
	    	 		 	//alert("未找到支付记录");
	    	 		 	status = status +1;
	    	 		 }else if(data=="00"){
	    	 			 $("#"+arr[i]).removeAttr("onclick");
	    	 			$("#"+arr[i]).text("已支付");
	    	 			// alert("支付成功");
	    	 		 }else{
	    	 		//	 alert("支付失败");
	    	 			status = status +1;
	    	 		 }
	    	    },
	    	    error:function(){
	    	   	 	alert("对不起,系统繁忙,请稍候重试");
	    	   	 	status = status +1;
	    	    } 
	    	});
    	}
    	//status =0;
    	if(status !=0){
    		alert("存在未支付的订单，请支付后再点击");
			return;
    	}else{
    		
    		
    		$.ajax({
    			url : "http://221.8.52.247:8445/jit_crj/crj/WxYj/smqj.do",
    			data : {
    				"sqid" : sqid,
    				"sfzh" :sfzh,
    				"lxdh":lxdh
    				
    			},
    			type : "post",
    			dataType : 'json',
    			success : function(data) {
    				
    				if(data.flag=='1'){
    					dialog.alert({
    			             title:"提示",
    			             msg:'激活上门取件成功等待EMS上门取件',
    			             buttons:['确定']
    			         },function(ret){
    			        		
    			        		
    			        		
    			        	 
    			        	 location="successful_tip.jsp?sqid="+sqid+"&openid="+openid;
    			         })
    				}else{
    					
    					dialog.alert({
   			             title:"提示",
   			             msg:'激活上门取件失败 请重新激活',
   			             buttons:['确定']
   			         },function(ret){
   			        	 
   			         })
    				}
    			}
    		});
    		//alert(basePath+"qiantai/ywlc/ecqz/qz_ems_get.jsp?yycode="+arr.join(",")+"&sqid="+sqid);
//     		window.location.href = basePath+"qiantai/ywlc/ecqz/qz_ems_get.jsp?sqid="+sqid;
    	}
    	
//       location="successful_tip.jsp?openid="+openid+'&sqid='+sqid;
    }
    
   
    
    function testnext(){
    	 var payText ="amt=20&settleDesc=测试商品&openId=odA_RsiMvPluFGz-ttHuJU6hHhzI&name=null&sjhm=13843123581&catName=出入境缴费&payType=OA&catCode=1170010&payerName=出入境缴费&bizNo=b9a0e22bbde358273440611458c159c5&ywbh=220110168018498&appReserved={'openId':'odA_RsiMvPluFGz-ttHuJU6hHhzI'}"
         location ='https://gaapi.jl.gov.cn/econsole/weixin/pay/index?'+payText;
       // var kkUrl='https://gaapi.jl.gov.cn/econsole/weixin/pay/index?'+payText;
    }
    
    function getUrlParam(name) {
   	    //构造一个含有目标参数的正则表达式对象 
   	    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
   	    //匹配目标参数 
   	    var r = window.location.search.substr(1).match(reg);
   	    //返回参数值 
   	    if (r != null)
   	      return unescape(r[2]);
   	    return null;
   	  }
   	  
   	  function onBridgeReady() {
   	    var appId = getUrlParam('appId');
   	    var timeStamp = getUrlParam('timeStamp');
   	    var nonceStr = getUrlParam('nonceStr');
   	    var Package = getUrlParam('package');
   	    var signType = getUrlParam('signType');
   	    var paySign = getUrlParam('paySign');
   	    WeixinJSBridge.invoke('getBrandWCPayRequest', {
   	      "appId" : appId,//"wx2421b1c4370ec43b", //公众号名称，由商户传入   
   	      "timeStamp" : timeStamp,//"1395712654", //时间戳，自1970年以来的秒数   
   	      "nonceStr" : nonceStr,//"e61463f8efa94090b1f366cccfbbb444", //随机串   
   	      "package" : Package,//"prepay_id=u802345jgfjsdfgsdg888",
   	      "signType" : signType,//"MD5", //微信签名方式:   
   	      "paySign" : paySign,//"70EA570631E4BB79628FBCA90534C63FF7FADD89" //微信签名 
   	    }, function(res) { // 使用以上方式判断前端返回,微信团队郑重提示：res.err_msg将在用户支付成功后返回  ok，但并不保证它绝对可靠。  
   	      //alert(res.err_msg);
   	      if (res.err_msg == "get_brand_wcpay_request:ok") {
   	        alert("支付成功");
   	      }
   	      if (res.err_msg == "get_brand_wcpay_request:cancel") {
   	        alert("交易取消");
   	      }
   	      if (res.err_msg == "get_brand_wcpay_request:fail") {
   	        alert("支付失败");
   	      }
   	    });
   	  }
   	  
   	  function callPay() {
   	    if (typeof WeixinJSBridge == "undefined") {
   	      if (document.addEventListener) {
   	        document.addEventListener('WeixinJSBridgeReady', onBridgeReady,
   	            false);
   	      } else if (document.attachEvent) {
   	        document.attachEvent('WeixinJSBridgeReady', onBridgeReady);
   	        document.attachEvent('onWeixinJSBridgeReady', onBridgeReady);
   	      }
   	    } else {
   	      onBridgeReady();
   	    }
   	  }
  
    </script>
</head>
<body>
<div class="aui-content" style="padding-bottom: 3rem;">
    <div class="aui-card-list-content">
        <img src="../image/banner06.jpg" alt="" />
    </div>
    <section class="aui-content-padded" id="zfxxts">
<!--      <form action="https://gaapi.jl.gov.cn/econsole/weixin/pay/index" id="payForm" method="post"> -->
<!--         <input type="hidden" name="catCode" value="1170010" /> -->
<!--         <input type="hidden" name="catName" value="出入境缴费" /> -->
<!--         <input type="hidden" name="bizNo" value="201611002223" /> -->
<!--         <input type="hidden" name="amt" value="0.01" /> -->
<!--         <input type="hidden" name="payType" value="OA" /> -->
<!--         <input type="hidden" name="bankNo" value="905" id="bankNo" /> -->
<!--         <input type="hidden" name="appReserved" value="{'openId':'orOuKwDZulkmITI-9ccNs-Gv2En4'}" /> -->
<!--         <input type="hidden" name="settleDesc" value="测试商品" /> -->
    
    
<!--     </form> -->
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