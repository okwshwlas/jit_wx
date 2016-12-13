<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="/WEB-INF/tld/c.tld" prefix="c"%>
<%
	String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
    //微信用户唯一标识
   String openid = request.getParameter("openid");
   String code = request.getParameter("code");
   String type = request.getParameter("type");
   //String openid = "123456";
%> 
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
    <meta name="format-detection" content="telephone=no,email=no,date=no,address=no">
    <title>监护人信息</title>
    <link rel="stylesheet" type="text/css" href="../css/aui.2.0.css" />
    <script type="text/javascript" src="<%=basePath%>/js/jquery-1.9.1.min.js"></script>
     <script type="text/javascript" src="../script/aui-dialog.js"></script>
     <script type="text/javascript" src="../script/api.js" ></script>
     <script type="text/javascript" src="../js/cookie.js" ></script>
    <script type="text/javascript">
    var type = <%=type%>;
    var sfzh = getCookie("sfzh");
//      $(function() {
//     	 $.ajax({
// 				url :  "http://221.8.52.247:8445/jit_crj/crj/WxJhr/jhrxxList.do",
// 				data : {
// 				},
// 				type : "post",
// 				dataType : 'json',
// 				success : function(data) {
// 					flag = data.flag;
// 					if(flag == '1') {
// 						var jhrxm = data.jhrxm;
// 						var jhrcard = data.jhrcard;
// 						var id = data.id;
// 						$("#id").val(id);
// 						$("#jhrxm").val(jhrxm);
// 						$("#jhrcard").val(jhrcard);
// 					} 
// 				}
// 			});
//      });
     
     function save(){
    	 var dialog = new auiDialog({});
    	
    	    var jhrxm =$("#jhrxm").val();
			var jhrcard = $("#jhrcard").val();
			var id =$("#id").val();
			if(jhrxm==''){
				 dialog.alert({
	                    title:"提示",
	                    msg:'监护人姓名不能为空',
	                    buttons:['确定']
	                },function(ret){
	                })
				return;
				
				
			}
			if(jhrcard==''){
				 dialog.alert({
	                    title:"提示",
	                    msg:'监护人身份证号码不能为空',
	                    buttons:['确定']
	                },function(ret){
	                })
				return;
				
				
			}
			 $("#save").removeAttr("onclick");
			 $.ajax({
					url :  "http://221.8.52.247:8445/jit_crj/crj/WxJhr/jhrxxsave.do",
					data : {
						"id": id,
						"sfzh":sfzh,
						"jhrxm":jhrxm,
						"jhrcard":jhrcard
					},
					type : "post",
					dataType : 'json',
					success : function(data) {
						flag = data.flag;
						if(flag == '1') {
							 dialog.alert({
				                    title:"提示",
				                    msg:'保存监护人信息成功',
				                    buttons:['确定']
				                },function(ret){
				                	location = "kind_business1.jsp?lvtype="+type;
				                })
						}else{
							 dialog.alert({
				                    title:"提示",
				                    msg:'保存监护人信息失败',
				                    buttons:['确定']
				                },function(ret){
				                	location = "kind_business.jsp";
				                })
							
						}
					}
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
<input id="id" type="hidden" value="" />
<div class="aui-content" style="padding-bottom: 3rem;">
    <div class="aui-card-list-content">
        <img src="../image/banner07.jpg" alt="" />
    </div>
    <div class="aui-card-list aui-content-padded">
        <div class="aui-card-list">
            <div class="aui-card-list-header">监护人姓名</div>
            <div class="aui-list-item-inner">
                <div class="aui-list-item-input">
                    <input type="text"  placeholder="请输入姓名"  id="jhrxm" style="padding: 0 0.65rem;">
                </div>
            </div>
        </div>
    </div>
    <div class="aui-card-list aui-content-padded">
        <div class="aui-card-list">
            <div class="aui-card-list-header">监护人身份证号</div>
            <div class="aui-list-item-inner">
                <div class="aui-list-item-input">
                    <input type="number"  placeholder="请输入身份证号码" id="jhrcard" style="padding: 0 0.65rem;">
                </div>
            </div>
        </div>
    </div>
    <div class="aui-card-list aui-content-padded">
        <div class="aui-btn aui-btn-info aui-btn-block aui-btn-sm" id="save"  tapmode onclick="save()">
            提 交
        </div>
    </div>
</div>
</body>

</html>