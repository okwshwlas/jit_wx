<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String zczh=(String)session.getAttribute("loginZczh");
// String openid=(String)session.getAttribute("openid");
String openid="33333";
String code=(String)session.getAttribute("code");
String sn=(String)request.getParameter("sn");
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
<meta name="format-detection" content="telephone=no,email=no,date=no,address=no">
<title>个人信息补全</title>
<script type="text/javascript" src="../../js/jquery.1.8.2.min.js"></script>
<link rel="stylesheet" type="text/css" href="../css/aui.2.0.css" />
<!-- 私有js -->
<script type="text/javascript" src="<%=basePath%>/jsp/proscenium/wxlv/js/newLogin.js"></script>
<script type="text/javascript" src="<%=basePath%>/jsp/proscenium/wxlv/js/cookie.js"></script>
<script type="text/javascript" src="<%=basePath%>/jsp/proscenium/wxlv/js/zhuce.js"></script>
<script type="text/javascript" src="<%=basePath%>/jsp/proscenium/wxlv/js/token.js"></script>
<script type="text/javascript" src="<%=basePath%>/jsp/proscenium/wxlv/js/smrz.js"></script>
<!-- 弹框 -->
<script>
var basePath= "<%=basePath%>";
var openid= '<%=openid%>';
var code= "<%=code%>";
var sn= "<%=sn%>";
var sjhm ;

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
	$("#sjhm").val(setString(sjhm,6,sjhm.length-6));
	if('null'==sn){
		var zhucexx =findzhucexx(openid);
		if(zhucexx !=false){
			//认证标识  0:暂未认证，1:认证通过，­9,认证不通过
			var identityStatus = zhucexx.identityStatus;
			//如果未认证 不显示人员信息
			if(identityStatus =='1'){
				$("#rzzt").html('认证通过');
				$("#xmdiv").show();
				$("#sfzhdiv").show();
//	 			var str= mask(zhucexx.idCard,zhucexx.idCard.size()-8,zhucexx.idCard.size(),'*');
	            
				$("#xm").html(setString(zhucexx.aliasName,1,zhucexx.aliasName.length-1));
				$("#sfzh").html(setString(zhucexx.idCard,10,zhucexx.idCard.length-8));
				$("#text").html('办理业务');
				 $("#text").click(function(){
					 location = 'kind_business.jsp';
// 					 pushHistory();

					    });
			}
			if(identityStatus == '0'){
				$("#rzzt").html('没有实名认证');
				$("#text").html('进行认证');
				 $("#text").click(function(){
					 location = 'renzheng.jsp'
					    });

				
				
			}
			if(identityStatus == '-9'){
				$("#rzzt").html('认证不通过');
				$("#text").html('重新认证');
				$("#text").click(function(){
					 location = 'renzheng.jsp'
					    });
				
			}
			if('' ==identityStatus ||identityStatus ==undefined){
				
				$("#rzzt").html('没有实名认证');
				$("#text").html('进行认证');
				 $("#text").click(function(){
					 location = 'renzheng.jsp'
					    });

			}
		
		}else{
			alert('获取人员信息出错!');
			
			
			
		}
		
		
	}else{
		
			var url = basePath+'/crj/wxqz/findRzResult.do'
				$.ajax({
					url : url,
					data : {
						"token":token,
						"sn": sn
						
						},
				    async:false,
					type : "post",
					dataType : 'json',
					success : function(data) {
						var obj =data.data;
						if(obj !=null){
							var code = obj.code;
							
							var succ = obj.succ;
							if(code == '100001'){
								var date =obj.data[0];
								if('Y'==date.exist){
									$("#rzzt").html('认证通过');
									$("#xmdiv").show();
									$("#sfzhdiv").show();
//						 			var str= mask(zhucexx.idCard,zhucexx.idCard.size()-8,zhucexx.idCard.size(),'*');
						            
									$("#xm").html(setString(date.xm,1,date.xm.length-1));
									$("#sfzh").html(setString(date.sfzh,10,date.sfzh.length-8));
									$("#text").html('办理业务');
									 $("#text").click(function(){
										 location = 'kind_business.jsp';
//					 					 pushHistory();

										    });
									
								}else{
									$("#rzzt").html('认证不通过');
									$("#text").html('重新认证');
									$("#text").click(function(){
										 location = 'renzheng.jsp'
										    });
									
								}
								
						}else{
							
							
							$("#rzzt").html('没有实名认证');
							$("#text").html('进行认证');
							 $("#text").click(function(){
								 location = 'renzheng.jsp'
								    });
							
							
							
						}
						}
						else{
							alert('查询认证结果出错请稍后再次进入');
							
							
						}
					}
			});
	}
	

		
		
		
	
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













</script>
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
    </style>
</head>
<body>
<div class="aui-content" style="padding-bottom: 3rem;">
    <div class="aui-card-list-content">
        <img src="../image/banner_02.jpg" alt="" />
    </div>
    <div class="aui-content aui-margin-b-15 aui-content-padded">
        <ul class="aui-list aui-form-list">
            <li class="aui-list-item">
                <div class="aui-list-item-inner">
                    <div class="aui-list-item-label">手机号码:</div>
                    <div class="aui-list-item-input">
                        <input type="text" id="sjhm" name="sjhm"  readonly="readonly" />
                    </div>
                </div>
            </li>
            <li class="aui-list-item">
                <div class="aui-list-item-inner">
                    <div class="aui-list-item-label">认证状态:</div>
                    <div class="aui-list-item-input"  >
                        <div id="rzzt"></div>
                    </div>
                </div>
            </li>
            <li class="aui-list-item"  id="xmdiv" style="display: none;">
                <div class="aui-list-item-inner">
                    <div class="aui-list-item-label">姓名:</div>
                    <div class="aui-list-item-input">
                       <div id="xm"></div>
                    </div>
                </div>
            </li>
              <li class="aui-list-item" id="sfzhdiv" style="display: none;">
                <div class="aui-list-item-inner">
                    <div class="aui-list-item-label">身份证:</div>
                    <div class="aui-list-item-input">
                        <div id="sfzh"></div>
                    </div>
                </div>
            </li>
        </ul>
    </div>
<!--     <div class="aui-card-list aui-content-padded"> -->
<!--         <div class="aui-card-list"> -->
<!--             <div class="aui-card-list-header">紧急联系人姓名</div> -->
<!--             <div class="aui-list-item-inner"> -->
<!--                 <div class="aui-list-item-input"> -->
<!--                     <input type="text"  id="urgentLink" name="urgentLink" placeholder="请输入姓名" style="padding: 0 0.65rem;"> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->
<!--     </div> -->
<!--     <div class="aui-card-list aui-content-padded"> -->
<!--         <div class="aui-card-list"> -->
<!--             <div class="aui-card-list-header">紧急联系人电话</div> -->
<!--             <div class="aui-list-item-inner"> -->
<!--                 <div class="aui-list-item-input"> -->
<!--                     <input type="number"  id="linkPhone" name="linkPhone" placeholder="请输入电话" style="padding: 0 0.65rem;"> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->
<!--     </div> -->
<!--     <div class="aui-card-list aui-content-padded"> -->
        <div class="aui-btn aui-btn-info aui-btn-block aui-btn-sm">
            <span class="aui-iconfont aui-icon-correct" id ="text" onclick=""></span>
        </div>
    </div>
</div>
</body>
<script type="text/javascript" src="../script/api.js" ></script>
<script type="text/javascript" src="../script/aui-dialog.js"></script>
<script type="text/javascript">
    // onclick="openDialog('text')"
    var dialog = new auiDialog({})
    function openDialog(type){
        switch (type) {
            case "text":
                dialog.alert({
                    title:"提示",
                    msg:'系统检测您还没有住宿登记记录,请到公安局办理报住宿后方可办理',
                    buttons:['取消','确定']
                },function(ret){
                    console.log(ret)
                })
                break;
            case "callback":
                dialog.alert({
                    title:"提示",
                    msg:'系统检测您还没有住宿登记记录，请到公安局办理报住宿后方可办理。',
                    buttons:['取消','确定']
                },function(ret){
                    if(ret){
                        dialog.alert({
                            title:"提示",
                            msg:"您点击了第"+ret.buttonIndex+"个按钮",
                            buttons:['确定']
                        });
                    }
                })
                break;
        }
    }
</script>
</html>