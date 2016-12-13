<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String openid = request.getParameter("openid");
String sqid = request.getParameter("sqid");
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
   <meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
    <meta name="format-detection" content="telephone=no,email=no,date=no,address=no">
    <title>初核通过提示</title>
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
    <style>
        html{ background-color:#f5f5f5;}
        .center { text-align: center;}
        .center img { width: 30%;}
        .width { width: 100%;}
        .font_size { font-size: 0.9rem; color: #33acfb;}
        .aui-btn-block { color: #626262; padding: 0.5rem; font-size: 0.8rem;}
    </style>
     <script type="text/javascript" >
     var dwxx =getCookie('dwxx');
	 var endywxx =getCookie('ywxx');
	 var basePath ="<%=basePath%>";
	 var openid ="<%=openid%>";
	  var sqid ="<%=sqid%>";
     $(function(){
    	if(getCookie('dwmc')==''||getCookie('dwmc')==null){
    		$.ajax({
         		url :"http://221.8.52.247:8445/jit_crj/crj/WxYj/findDw.do",
         		data : {
         			"sqid":sqid
         		},
         		type : "post",
         		dataType : 'json',
         		success : function(data) {
         			var dwmc=data.dwmc;
         			var dwxx=data.dwxx;
         			setCookie('dwxx','办理单位:'+dwmc+',单位地址:'+dwxx.dz+',代办人员:'+dwxx.name+',代办电话:'+dwxx.lxdh);
         			setCookie('dwmc',dwmc);
         			setCookie('dwdz',dwxx.dz);
         			setCookie('dbmc',dwxx.name);
         			setCookie('dbdh',dwxx.lxdh);
         		}
         	});
    		
    		
    		
    		
    	}
    	 
//     	 getCookie('dwmc');
//     	 getCookie('dwdz');
//     	 getCookie('dbmc');
//     	 getCookie('dbdh');
//     	 getCookie('ywmc');
//     	 getCookie('ywbm');
    	 $("#ywmc").html('业务名称:'+getCookie('ywmc'));
    	 $("#ywbh").html('业务编号:'+getCookie('ywbm'));
    	 
    	 $("#dwmc").html('办理单位:'+getCookie('dwmc'));
    	 $("#dwdz").html('办理单位地址:'+getCookie('dwdz'));
    	 $("#dbmc").html('代办人:'+getCookie('dbmc'));
    	 $("#dbdh").html('代办人电话:'+getCookie('dbdh'));
    	 	
   

     })
     function end(){
    	 $.ajax({
 			url : basePath + "/crj/wxqz/end.do?random=" + Math.random(),
 			data : {
 				"openid" : openid,
 				"dwxx" :dwxx,
 				"endywxx":endywxx
 			},
 			type : "post",
 			dataType : 'json',
 			success : function(data) {
 				
 			}
 		});
    	 
    	 
     }
     </script>
</head>
<body>
    <div style="margin-top: 5%;">
       <p class="center"><img src="../image/tip_icon.png"></p>
        <div class="">
            <div class="center width font_size">您的申请已经申请成功</div>
          <section class="aui-content-padded" id="zfxxts">
        <div class="aui-card-list card_box" >
            <div class="aui-card-list-header">
                                 您办理的业务信息
            </div>
            <div class="aui-card-list-content-padded" id="ywmc">
            </div>
            <div class="aui-card-list-content-padded" id="ywbh">
            </div>
         </div>
          <div class="aui-card-list card_box" >
          <div class="aui-card-list-header">
                              办理单位信息
            </div>
            <div class="aui-card-list-content-padded" id="dwmc">
            </div>
            <div class="aui-card-list-content-padded" id="dwdz">
            </div>
             <div class="aui-card-list-content-padded" id="dbmc">
            </div>
            <div class="aui-card-list-content-padded" id="dbdh">
            </div>
        </div>
    </section>
            <div class="center width" style="color: #626262; font-size: 0.7rem;">请将业务信息填写都邮封备注栏中,参照办理单位信息填写邮寄地址</div>
        </div>
       <div style="width: 70%; margin: 40px auto;"><div class="aui-btn aui-btn-block" onclick="end()">完成</div></div>
    </div>
</body>
<script type="text/javascript" src="../script/api.js" ></script>
</html>