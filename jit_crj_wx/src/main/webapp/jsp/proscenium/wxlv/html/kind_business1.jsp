<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="/WEB-INF/tld/c.tld" prefix="c"%>
<%
	String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
    //微信用户唯一标识
   String openid = request.getParameter("openid");
   String code = request.getParameter("code");
   String lvtype = request.getParameter("lvtype");
   //String openid = "123456";
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
        .aui-btn-block { color: #626262; padding: 0.5rem; font-size: 0.8rem;}
        .float{ float: right;}
    </style>
     <script type="text/javascript">
     var lvtype = <%=lvtype%>;
     var sfzh = getCookie('sfzh');
     var type ;
     var flag;
     var qwd;
     var qzsy;
     var qzzl;
     var qzyxcs;
     $(function() {
    	 //香港旅游签注 对应有效次数显示
    	 if(lvtype =='01'){
    		 $("#grly").css('display','block');
    		 //个人旅游有效次数
    		 $("#grlvy31").css('display','block'); 
    		 $("#grlvy32").css('display','block'); 
    		 $("#grlvn11").css('display','block'); 
    		 $("#grlvn12").css('display','block'); 
    		 
    		 
    		 //签注信息赋值
    		 type = '3' ;
    		 flag = '0';
    		 qwd = 'HKG';
    		 qzsy = '08';
    	     qzzl = '1B';
    		
    	 }
    	 if(lvtype =='02'){
    		 //团队旅游有效次数
    		  $("#tdly").css('display','block');
    		 $("#tdlvy31").css('display','block'); 
    		 $("#tdlvy32").css('display','block'); 
    		 $("#tdlvn11").css('display','block'); 
    		 $("#tdlvn12").css('display','block'); 
    		 
    		 //签注信息赋值
    		 type = '4' ;
    		 flag = '0';
    		 qwd = 'HKG';
    		 qzsy = '09';
    	     qzzl = '12';
    		 
    	 }
    	 //澳门旅游签注 对应有效次数显示
    	 if(lvtype =='11'){
    		 $("#grly").css('display','block');
    		 //个人旅游有效次数
    		 $("#grlvy31").css('display','block'); 
    		 $("#grlvn11").css('display','block'); 
    		 
    		 //签注信息赋值
    		 type = '3' ;
    		 flag = '1';
    		 qwd = 'MAC';
    		 qzsy = '08';
    	     qzzl = '1B';
    		 
    		
    	 }
    	 if(lvtype =='12'){
    		 $("#tdly").css('display','block');
    		 //团队旅游有效次数
    		 $("#tdlvy31").css('display','block'); 
    		 $("#tdlvn11").css('display','block'); 
    		 
    		 //签注信息赋值
    		 type = '4' ;
    		 flag = '1';
    		 qwd = 'MAC';
    		 qzsy = '09';
    	     qzzl = '12';
    		 
    	 }
    	 //台湾个人旅游签注 对应有效次数显示
    	 if(lvtype =='21'){
    		 $("#grly").css('display','block');
    		 //个人旅游有效次数
    		 $("#grlvy61").css('display','block'); 
    		 
    		//签注信息赋值
    		 type = '3' ;
    	     qzzl = '2B';
    		
    	 }
    	 //台湾团队旅游签注 对应有效次数显示
    	 if(lvtype =='22'){
    		 $("#tdly").css('display','block');
    		 //团队旅游有效次数
    		 $("#tdlvy61").css('display','block'); 
    		 
    		//签注信息赋值
    		 type = '4' ;
    	     qzzl = '25';
    		 
    	 }
    	 
    	 
    	 
     });
     function text(type,text){
    	 var qz ="";
    	 if(type == '1'){
    		 qz = '个人旅游签注';
    	 }else{
    		 qz = '团队旅游签注';
    	 }
    	$('#text').html(qz+text);
     }
     function checkradio(){ 
    	 var dialog = new auiDialog({});
    	 var item = $(":radio:checked"); 
    	 var len=item.length; 
    	 if(len>0){ 
    		 qzyxcs = $(":radio:checked").val();
    		 showDefault('loading',qzyxcs)
    	 } else{
    		 dialog.alert({
                 title:"提示",
                 msg:'请选择签注有效次数',
                 buttons:['确定']
             },function(ret){
             })
    	 }
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
     function showDefault(showtype,qzyxcs){
     	$("#end").removeAttr("onclick");
         switch (showtype) {
             case "loading":
                 toast.loading({
                     title:"加载中",
                     duration:2000
                 },function(ret){
                     console.log(ret);
                     setTimeout(function(){
                    	 if(lvtype =='21' ||lvtype == '22'){
                    		 $.ajax({
         			 			url : "http://221.8.52.247:8445/jit_crj/crj/WxQz/twqzxx.do",
         			 			data : {
         			 				"sfzh" : sfzh,
         			 				"type" : type,
         			 				"twqzzl" : qzzl,
         			 				"twqzyxcs" :qzyxcs
         			 			},
         			 			type : "post",
         			 			dataType:"JSON",
         			// 			jsonp: "callback",//传递给请求处理程序或页面的，用以获得jsonp回调函数名的参数名(一般默认为:callback)
         			// 	        jsonpCallback:"flightHandler",//自定义的jsonp回调函数名称，默认为jQuery自动生成的随机函数名，也可以写"?"，jQuery会自动为你处理数据
         			 			success:function(data,textStatus) {
         			 				if (data.flag== "0") {
         			 					//查询出错
         			 				}else if(data.flag== "3"){
//          			 					location="kind_business.jsp";
         							
         			 				}else {
//          			 					location="personal_info.jsp";
         			 				}
         			 			}
         			 		});
                    	 }else{
                    		 
                    		 $.ajax({
          			 			url : "http://221.8.52.247:8445/jit_crj/crj/WxQz/hkqzxx.do",
          			 			
          			 			data : {
          			 				"sfzh" : sfzh,
          			 				"type" : type,
          			 				"flag" :flag,
          			 				"qwd" : qwd,
          			 				"hkqzsy" :qzsy,
          			 				"hkqzzl" :qzzl,
          			 				"hkyxcs": qzyxcs
          			 				
          			 			},
          			 			type : "post",
          			 			dataType:"JSON",
          			// 			jsonp: "callback",//传递给请求处理程序或页面的，用以获得jsonp回调函数名的参数名(一般默认为:callback)
          			// 	        jsonpCallback:"flightHandler",//自定义的jsonp回调函数名称，默认为jQuery自动生成的随机函数名，也可以写"?"，jQuery会自动为你处理数据
          			 			success:function(data,textStatus) {
          			 				if (data.flag== "0") {
          			 					//保存错误
          			 				 toast.hide();
          			 					alert(data.flag)
          			 				}else if(data.flag== "1"){
          			 					var ywid=data.ywid;
          			 					var sqid = data.sqid;
          			 					var jdbt= data.jdbt;
          			 					//保存成功
          			 				    toast.hide();
          			 					location="pick_address.jsp?sqid="+sqid+"&ywid="+ywid+"&jdbt="+jdbt;

          							
          			 				}
          			 			}
          			 		});
                 
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
<body>
    <div class="aui-content">
        <div class="aui-card-list-content">
            <img src="../image/banner_03.jpg" alt="" />
        </div>
<!--         <p style="padding-top: 8px; text-align: center;">*请选择一种签注种类（单选）</p> -->
        <section class="aui-content-padded">

            <div class="aui-card-list" id="grly"  style="display: none">
                <div class="aui-card-list-header" style="border-bottom: 1px solid #d5d5d5;">
                    个人旅游签注
                </div>
                <div class="aui-card-list-footer">
                    *个人旅游签注有效次数
                </div>
                <div class="aui-content aui-margin-b-15">
                    <ul class="aui-list aui-media-list">
                        <li class="aui-list-item aui-list-item-middle" id ="grlvy31" style="display: none">
                            <div class="aui-media-list-item-inner">
                                <div class="aui-list-item-media" style="width: 2.5rem;">
                                    <img src="../image/icon6.png" class="aui-img-round aui-list-img-sm">
                                </div>
                                <div class="aui-list-item-inner">
                                    <label>三个月一次 <input class="aui-radio float" type="radio" name="demo1" value= "Y031" onclick="text('1','三个月一次')" > </label>
                                </div>
                            </div>
                        </li>
                           <li class="aui-list-item aui-list-item-middle" id ="grlvy32" style="display: none">
                            <div class="aui-media-list-item-inner">
                                <div class="aui-list-item-media" style="width: 2.5rem;">
                                    <img src="../image/icon6.png" class="aui-img-round aui-list-img-sm">
                                </div>
                                <div class="aui-list-item-inner">
                                    <label>三个月二次 <input class="aui-radio float" type="radio" name="demo1" value= "Y032" onclick="text('1','三个月二次')"> </label>
                                </div>
                            </div>
                        </li>
                        <li class="aui-list-item aui-list-item-middle" id ="grlvy61" style="display: none">
                            <div class="aui-media-list-item-inner">
                                <div class="aui-list-item-media" style="width: 2.5rem;">
                                    <img src="../image/icon5.png" class="aui-img-round aui-list-img-sm">
                                </div>
                                <div class="aui-list-item-inner">
                                    <label>六个月一次 <input class="aui-radio float" type="radio" name="demo1" value= "Y061" onclick="text('1','六个月一次')" > </label>
                                </div>
                            </div>
                        </li>
                        <li class="aui-list-item aui-list-item-middle" id ="grlvn11" style="display: none">
                            <div class="aui-media-list-item-inner">
                                <div class="aui-list-item-media" style="width: 2.5rem;">
                                    <img src="../image/icon4.png" class="aui-img-round aui-list-img-sm">
                                </div>
                                <div class="aui-list-item-inner">
                                    <label>一年一次 <input class="aui-radio float" type="radio" name="demo1" value= "N011" onclick="text('1','一年一次')" > </label>
                                </div>
                            </div>
                        </li>
                         <li class="aui-list-item aui-list-item-middle" id ="grlvn12" style="display: none">
                            <div class="aui-media-list-item-inner">
                                <div class="aui-list-item-media" style="width: 2.5rem;">
                                    <img src="../image/icon6.png" class="aui-img-round aui-list-img-sm">
                                </div>
                                <div class="aui-list-item-inner" id ="grlvn12">
                                    <label>一年二次 <input class="aui-radio float" type="radio" name="demo1" value= "N012"   onclick="text('1','一年二次')"> </label>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="aui-card-list" id="tdly" style="display: none">
                <div class="aui-card-list-header" style="border-bottom: 1px solid #d5d5d5;">
                    团队旅游签注
                </div>
                <div class="aui-card-list-footer">
                    *团队旅游签注有效次数
                </div>
             <div class="aui-content aui-margin-b-15">
                    <ul class="aui-list aui-media-list">
                        <li class="aui-list-item aui-list-item-middle" id ="tdlvy31" style="display: none">
                            <div class="aui-media-list-item-inner">
                                <div class="aui-list-item-media" style="width: 2.5rem;">
                                    <img src="../image/icon6.png" class="aui-img-round aui-list-img-sm">
                                </div>
                                <div class="aui-list-item-inner">
                                    <label>三个月一次 <input class="aui-radio float" type="radio" name="demo1" value= "Y031"  onclick="text('2','三个月一次')"> </label>
                                </div>
                            </div>
                        </li>
                           <li class="aui-list-item aui-list-item-middle" id ="tdlvy32" style="display: none">
                            <div class="aui-media-list-item-inner">
                                <div class="aui-list-item-media" style="width: 2.5rem;">
                                    <img src="../image/icon6.png" class="aui-img-round aui-list-img-sm">
                                </div>
                                <div class="aui-list-item-inner">
                                    <label>三个月二次 <input class="aui-radio float" type="radio" name="demo1" value= "Y032"   onclick="text('2','三个月二次')"> </label>
                                </div>
                            </div>
                        </li>
                        <li class="aui-list-item aui-list-item-middle" id ="tdlvy61" style="display: none">
                            <div class="aui-media-list-item-inner">
                                <div class="aui-list-item-media" style="width: 2.5rem;">
                                    <img src="../image/icon5.png" class="aui-img-round aui-list-img-sm">
                                </div>
                                <div class="aui-list-item-inner">
                                    <label>六个月一次 <input class="aui-radio float" type="radio" name="demo1" value= "Y061" onclick="text('2','六个月一次')" > </label>
                                </div>
                            </div>
                        </li>
                        <li class="aui-list-item aui-list-item-middle" id ="tdlvn11" style="display: none">
                            <div class="aui-media-list-item-inner">
                                <div class="aui-list-item-media" style="width: 2.5rem;">
                                    <img src="../image/icon4.png" class="aui-img-round aui-list-img-sm">
                                </div>
                                <div class="aui-list-item-inner">
                                    <label>一年一次 <input class="aui-radio float" type="radio" name="demo1" value= "N011" onclick="text('2','一年一次')"> </label>
                                </div>
                            </div>
                        </li>
                        <li class="aui-list-item aui-list-item-middle" id ="tdlvn12" style="display: none">
                            <div class="aui-media-list-item-inner">
                                <div class="aui-list-item-media" style="width: 2.5rem;">
                                    <img src="../image/icon6.png" class="aui-img-round aui-list-img-sm">
                                </div>
                                <div class="aui-list-item-inner">
                                    <label>一年二次 <input class="aui-radio float" type="radio" name="demo1" value= "N012"   onclick="text('2','一年二次')"> </label>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="aui-btn aui-btn-block aui-btn-info" id ="end" tapmode onclick="checkradio()">完 成</div>
        </section>
    </div>
    <!-- 提示-->
    <div class="aui-tips" id="tips-1" style="position: fixed;">
        <i class="aui-iconfont aui-icon-info"></i>
        <div class="aui-tips-title" id="text"></div>
        <i class="aui-iconfont aui-icon-close" tapmode onclick="closeTips()"></i>
    </div>
    <!-- end 提示 -->
</body>

<!-- <script type="text/javascript"> -->
   
<!-- </script> -->
</html>