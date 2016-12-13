<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="/WEB-INF/tld/c.tld" prefix="c"%>
<%
	String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
   String openid = request.getParameter("openid");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
    <meta name="format-detection" content="telephone=no,email=no,date=no,address=no">
    <title>扫码支付</title>
	 <script type="text/javascript" src="<%=basePath%>/js/jquery-1.9.1.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../css/default.css" />
    <link rel="stylesheet" type="text/css" href="../css/commont.css" />
    <link rel="stylesheet" type="text/css" href="../css/aui.2.0.css" />
	<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
	
			<script type="text/javascript" src="<%=basePath%>/jsp/proscenium/wxlv/script/aui-dialog.js"></script>
	<script type="text/javascript" src="<%=basePath%>/jsp/proscenium/wxlv/script/api.js" ></script>
<script type="text/javascript" src="<%=basePath%>/jsp/proscenium/wxlv/script/aui-toast.js" ></script>

    <style>
        .aui-list::after { background-color: #fff;}
        .aui-list .aui-list-item::after{ background-color: #fff;}
        .aui-list::before{ background-color: #fff;}
        .aui-card-list-header { font-size: 0.7rem; color: #626262;}
		.aui-content-padded{ margin:6rem 5% 0.75rem 5%!important;}

    </style>
     <script type="text/javascript">
	var openid = '<%=openid%>';
	var val2 ="";
	var val3="";
	var count ;
	// 业务所需总金额
    var feiYong = 0;
	
	
	
	
	$(function (){
		
		if(openid!="odA_RsiMvPluFGz-ttHuJU6hHhzI"){
		  alert('系统维护中........')
		  return history.go(-1);
		
		} 
		
		
		
	})
	
   	 	var basePath = '<%=basePath%>';
		//openid = 'oSUoSuHROyzW9Vu48UIj3UJ7WrmU';
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
     //加载数据******
 

		function findYwxx(){
		showDefault('loading');
		var flag =false;
		
			var url = basePath + "/sfxmcontroller/getSfxmByYwbh.do?random=" + Math.random();
   			var params = {
 				"ywbh" : $("#ywbh").val(),
 				"jyh":'001'
   			};
   			$.ajaxSettings.async = false; 
   			$.getJSON(url,params, function(json) {
   				if(json.ywlbmc==''||json.ywlbmc==null){
				val2=setInterval("findYwxx()",5000);
				setTimeout(function() {window.clearInterval(val2);},1000000);

   				}else{
				 toast.hide();
				
				    flag =true;
				    $("#cxtsxx").text('');
   					$("#nodatadiv").hide();
   					$("#ywdiv").show();
				    var ywstr="";
				    count =json.list.length; 
				    for(i=0;i<json.list.length;i++){
				    	
// 				    	 <div class="aui-card-list" style="padding:1rem 0;">
// 			                <div class="aui-info pad_0">
// 			                    <div class="aui-info-item">
// 			                        <img src="../image/icon_02.png" style="width:1.5rem" class="aui-img-round" /><span class="aui-margin-l-5 aui-card-list-header">业务名称：</span><span id="ywlbmc"></span>
// 			                    </div>
// 			                </div>
			             
// 			                <div class="aui-info pad_0 border_top pad_top_1">
// 			                    <div class="aui-info-item">
// 			                        <img src="../image/icon_04.png" style="width:1.5rem" class="aui-img-round" /><span class="aui-margin-l-5 aui-card-list-header">收费金额：</span><span id="stfje"></span>
// 			                    </div>
// 			                </div>
// 							  <div class="aui-info pad_0">
// 			                    <div class="aui-info-item">
// 			                        <img src="../image/icon_03.png" style="width:1.5rem" class="aui-img-round" /><span class="aui-margin-l-5 aui-card-list-header">缴费状态：</span><span id="jfzt"></span>
// 			                    </div>
// 			                </div>
// 			            </div>
				    	
				    	ywstr+=" <div class="aui-card-list" style="padding:1rem 0;">";
				    	ywstr+=" <div class="aui-info pad_0">";
				        ywstr+=" <div class="aui-info-item">";
				        ywstr+=" <img src="../image/icon_02.png" style="width:1.5rem" class="aui-img-round" /><span class="aui-margin-l-5 aui-card-list-header">业务名称：</span>";
				        ywstr+=	"<span id='ywlbmc"+i+"'></span>"+json.list[i].ywlbmc+"</div></div>";
				        
				        
				    	ywstr+="  <div class="aui-info pad_0 border_top pad_top_1">";
				        ywstr+=" <div class="aui-info-item">";
				        ywstr+=" <img src="../image/icon_04.png" style="width:1.5rem" class="aui-img-round" /><span class="aui-margin-l-5 aui-card-list-header">收费金额：</span>";
				        ywstr+=	"<span id='stfje"+i+"'></span>"+json.list[i].stfje+"元</div></div>"
				        
				     // 业务所需总金额
					    feiYong += json.list[i].stfje;
				        ywstr+=" <div class="aui-info pad_0">";
				        ywstr+=" <div class="aui-info-item">";
				        ywstr+=" <img src="../image/icon_03.png" style="width:1.5rem" class="aui-img-round" /><span class="aui-margin-l-5 aui-card-list-header">缴费状态：</span>";
				        
				        if(json.list[i].saomaType=='1'){
				        	ywstr+=	"<span id='jfzt"+i+"'></span>"+"已缴费"+"</div></div>";
				        	
				        }else{
				        	ywstr+=	"<span id='jfzt"+i+"'></span>"+"未缴费"+"</div></div>";
				        }
				        
				        
				
				    }
				    $("#ywdiv").html(ywstr);
//    					$("#cxtsxx").text('');
//    					$("#nodatadiv").hide();
//    					$("#ywdiv").show();
//    				    $("#ywlbmc").text(json.ywlbmc);
//     			    $("#stfje").text(json.stfje+'元');
// 					if(json.saomaType=='1'){
//    					$("#jfdiv").hide();
//    					$("#jfzt").text('已缴费');
//    				}else{
//    					$("#jfdiv").show();
//    					$("#jfzt").text('未缴费');
//    				}
   				
				
   				}
   						
   					
   			
   			});
			return flag;
		
		
		}
		
		
		
				// if(json.ywlbmc==''||json.ywlbmc==null){
				// findYwxx();
				
   				    // $("#ywdiv").hide();
   					// $("#nodatadiv").show();
   					 // $("#cxtsxx").text('您的条码号没有业务,请重新检查业务编号稍后再进行查询');
					 // $("#jfdiv").hide();
   					
   					// }else{
					 // $("#cxtsxx").text('');
   					// $("#nodatadiv").hide();
   					// $("#ywdiv").show();
   				    // $("#ywlbmc").text(json.ywlbmc);
    			    // $("#stfje").text(json.stfje+'元');
					// if(json.saomaType=='1'){
   					// $("#jfdiv").hide();
   					// $("#jfzt").text('已缴费');
   				// }else{
   					// $("#jfdiv").show();
   					// $("#jfzt").text('未缴费');
   				// }
   						
   						// }
		
		
		
    	function query(){
		
		$.ajax({
			url : basePath+"/crj/wxsfzf/savesfzf.do",
			data : {
			  "ywbh": $("#ywbh").val(),
			  "openid":openid
			},
			type : "post",
			dataType : 'json',
				async:false,
			success : function(data) {
			
				if(data.data=='0000'){
				val3=setInterval("findYwxx()",5000);
				setTimeout(function() {window.clearInterval(val3);},1000000);
				
				if(findYwxx()){
				setTimeout(function() {window.clearInterval(val2)});
				setTimeout(function() {window.clearInterval(val3)});
				return;
				}
				}else{
					alert('错误');
		    		return;
				}
			}
		});
		
   		
    	}
		function sm(){
		
		wx.scanQRCode({
    needResult: 0, // 默认为0，扫描结果由微信处理，1则直接返回扫描结果，
    scanType: ["qrCode","barCode"], // 可以指定扫二维码还是一维码，默认二者都有
    success: function (res) {
    var result = res.resultStr; // 当needResult 为 1 时，扫码返回的结果
}
});
		
		
		
		}
		function sfzf(){
		
// 	  var amt = $("#stfje").text();
	  var amt =feiyong;

	  if(openid == 'odA_RsiMvPluFGz-ttHuJU6hHhzI'){
	  amt= '0.01';
	  }
	   // amt= '0.01';
	   var bizNo = $("#ywbh").val();
	   if(amt==''||amt==null){
	       alert('请查询到有效收费信息再进行缴费');
		   return;
	   
	   }
	// bizNo = '220110168015420'
	 var  payText = "";
		payText +="amt="+amt;
		payText +="&settleDesc=出入境扫码支付";
		payText +="&catName=出入境缴费";
		payText +="&payType=OA&catCode=1170010&payerName=出入境缴费";
		payText+="&bizNo="+bizNo;
		paySave = payText;
//			paras+="&appReserved="+"{\\\'openId\\\':\\\'"+openid+"\\\'}" ;
          payText +="&appReserved=";
          payText +="\{'openId':";
          payText +="'";
          payText +=openid;
          payText +="'";
          payText +="\}";
		//payText +="&appReserved="+"{\'openId\':\'"+openid+"\'}" ;
    	$.ajax({
			url : basePath+"/crj/wxsfzf/savesfzf.do",
			data : {
			  "ywbh":bizNo,
			  "openid":openid
			},
			type : "post",
			dataType : 'json',
				async:false,
			success : function(data) {
			
				if(data.data=='0000'){
					location ='https://gaapi.jl.gov.cn/econsole/weixin/pay/index?'+payText;
				}else{
					alert('保存收费信息失败请重新支付');
		    		return;
				}
			}
		});
    }
    </script>
</head>
<body>
    <div>
        <header><img src="../image/banner_01.jpg" alt="" width="100%;"/></header>
        <section>
            <div class="operating_box">
                <div class="pad_top">
                    <ul class="aui-list aui-form-list ">
                        <li class="aui-list-item">
                            <div class="aui-list-item-inner">
                                <div class="aui-list-item-label">
                                    业务编号
                                </div>
                                <div class="aui-list-item-input">
                                    <input type="number" placeholder="请您输入业务编号" class="input_bg" id="ywbh">
                                </div>
								 <!-- <div style="padding-right: 0.5rem;" id = "QR"><img src="../image/sm_icon.png" alt="" width="30" height="23"/></div>

                            </div>-->
                        </li>
                    </ul>
                    <p class="tip_text" id="cxtsxx" >＊填写业务编号</p>
					 <div class="aui-content-padded " style="text-align:center;margin:0!important;" id="QR">
					<p class="padding_top"><div class="aui-btn aui-btn-blue"   onclick="query();">查 询</div></p>
				</div>
                </div>
				
            </div>
        </section>
        <section class="aui-content-padded mar_top " style="display:none ;" id="ywdiv">
            <div class="aui-card-list" style="padding:1rem 0;">
                <div class="aui-info pad_0">
                    <div class="aui-info-item">
                        <img src="../image/icon_02.png" style="width:1.5rem" class="aui-img-round" /><span class="aui-margin-l-5 aui-card-list-header">业务名称：</span><span id="ywlbmc"></span>
                    </div>
                </div>
             
                <div class="aui-info pad_0 border_top pad_top_1">
                    <div class="aui-info-item">
                        <img src="../image/icon_04.png" style="width:1.5rem" class="aui-img-round" /><span class="aui-margin-l-5 aui-card-list-header">收费金额：</span><span id="stfje"></span>
                    </div>
                </div>
				  <div class="aui-info pad_0">
                    <div class="aui-info-item">
                        <img src="../image/icon_03.png" style="width:1.5rem" class="aui-img-round" /><span class="aui-margin-l-5 aui-card-list-header">缴费状态：</span><span id="jfzt"></span>
                    </div>
                </div>
            </div>
        </section>
        <!-- 暂无信息 -->
        <div style=" display: ;" class="no_data" id="nodatadiv">
            <img src="../image/zanwu.png" alt="" width="150" height="140" />
        </div>
        <!-- end -->
        <div class=" " id="jfdiv"  style=" display:none;  margin:0.75rem;">
            <p class="padding_top"><div class="aui-btn aui-btn-yellow aui-btn-block"  onclick="sfzf();">去缴费</div></p>
        </div>
    </div>
<!--	<script>

		$(function() {
		var appId = "wx6afe5e02b71366e7";
			var timestamp = "";
			var nonceStr = "";
			var signature = "";
		        var getUrl = basePath+"/corecontroller/getSdk.do";
    		 $.ajax({
    								url : getUrl,
    								data : {
    									"url": 'http://crj.gafw.jl.gov.cn/jit_crj_wx/jsp/proscenium/sfzfwx/html/smzf.jsp'
    									},
    							    async:false,
    								type : "post",
    								dataType : 'json',
    								success : function(data) {
									nonceStr=data.nonceStr;
									timestamp=data.timestamp;
									signature=data.signature
     								}
    						});
		
		
		
			
			//console.log(appId);
			wx.config({
				debug : true,
				appId : appId,
				timestamp : timestamp,
				nonceStr : nonceStr,
				signature : signature,
				jsApiList : [ 'scanQRCode' ]
			});

			wx.ready(function() {
			
			});

			wx.error(function(res) {
			alert(res.errMsg)
				console.log(res.errMsg + "====errorMsg====");
			});
		});

		//扫描条维码开始
		$("#QR").click(function() {
			//alert("go into!!!!!");
			wx.scanQRCode({
				needResult : 1, // 默认为0，扫描结果由微信处理，1则直接返回扫描结果，
				scanType : [ "qrCode", "barCode" ], // 可以指定扫二维码还是一维码，默认二者都有
				success : function(res) {
					var result = res.resultStr; // 当needResult 为 1 时，扫码返回的结果
					var arr = result.split(",");
					//console.log("result===" + arr[1]);
					$("#ywbh").val(arr[1]);
				}
			});
		}).trigger("click");
		//扫描条维码开始
	
</script>-->
</body>
</html>