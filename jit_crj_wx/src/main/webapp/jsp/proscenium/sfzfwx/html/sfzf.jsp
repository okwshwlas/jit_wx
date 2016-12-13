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
    <style>
        .aui-list::after { background-color: #fff;}
        .aui-list .aui-list-item::after{ background-color: #fff;}
        .aui-list::before{ background-color: #fff;}
        .aui-card-list-header { font-size: 0.7rem; color: #626262;}
    </style>
     <script type="text/javascript">
	var openid = '<%=openid%>';
   	 	var basePath = '<%=basePath%>';
		//openid = 'oSUoSuHROyzW9Vu48UIj3UJ7WrmU';
    	function query(){
   			var url = basePath + "/sfxmcontroller/getSfxmByYwbh.do?random=" + Math.random();
   			var params = {
 				"ywbh" : $("#ywbh").val(),
 				"jyh":'001'
   			};
   			$.ajaxSettings.async = false; 
   			$.getJSON(url,params, function(json) {
   				if(json.ywlbmc==''||json.ywlbmc==null){
				
   				    $("#ywdiv").hide();
   					$("#nodatadiv").show();
   					
   					
   					}else{
   					$("#nodatadiv").hide();
   					$("#ywdiv").show();
   				    $("#ywlbmc").text(json.ywlbmc);
    			    $("#stfje").text(json.stfje+'元');
   						
   						}
				if(json.saomaType=='1'){
   					$("#jfdiv").hide();
   					$("#jfzt").text('已缴费');
   				}else{
   					$("#jfdiv").show();
   					$("#jfzt").text('未缴费');
   				}
   			
   			});
    	}
		function sfzf(){
		
	  var amt = $("#stfje").text();
	   // amt= '0.01';
	   var bizNo = $("#ywbh").val();
	   if(amt==''||amt==null){
	       alert('请查询到有效收费信息再进行缴费');
		   return;
	   
	   }
	// bizNo = '220110168015420'
	 var  payText = "";
		payText +="amt="+amt;
		payText +="&settleDesc=出入境扫描码支付";
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
                            </div>
                        </li>
                    </ul>
                    <p class="tip_text">＊填写业务编号也可扫描申请单上的条形码。</p>
					 <div class="aui-content-padded " style="text-align:center;margin:0!important;">
					<p class="padding_top"><div class="aui-btn aui-btn-blue"  onclick="query();">查 询</div></p>
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
                        <img src="../image/icon_03.png" style="width:1.5rem" class="aui-img-round" /><span class="aui-margin-l-5 aui-card-list-header">缴费状态：</span><span id="sfzt"></span>
                    </div>
                </div>
            </div>
        </section>
        <!-- 暂无信息 -->
        <div style=" display: ;" class="no_data" id="nodatadiv">
            <img src="../image/zanwu.png" alt="" width="150" height="140" />
        </div>
        <!-- end -->
        <div class="aui-content-padded " id="jfdiv">
            <p class="padding_top"><div class="aui-btn aui-btn-yellow aui-btn-block"  onclick="sfzf();">去缴费</div></p>
        </div>
    </div>
</body>
</html>