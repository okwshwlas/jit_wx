<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String path = request.getContextPath();
	/* String openid = request.getParameter("openid"); */
	String openid = "123123";
%>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
    <meta name="format-detection" content="telephone=no,email=no,date=no,address=no">
    <title>绿色通道</title>
    <link rel="stylesheet" type="text/css" href="../../css/css/aui.2.0.css" />
    <script type="text/javascript" src="../../js/jquery.1.8.2.min.js"></script>
    <script type="text/javascript" src="../../js/My97Date/WdatePicker.js" charset="utf-8"></script>
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
        .aui-tab-item{ font-size: 0.8rem;}
    </style>
    <script type="text/javascript">
        var path= '<%=path%>';
    	function clickFun(){
    		var openid='<%=openid%>';
    		var xm = $("#xm").val();
    		var sfzh = $("#sfzh").val();
    		var qzzl = $("#qzzl").val();
    		var jjsy = $("#jjsy").val();
    		if(xm==""){
    			alert("请输入姓名");
    			return false;
    		}
    		var reg1 = /^[\u4e00-\u9fa5]+$/;
    		if(reg1.test(xm) == false){
    			alert("请输入正确姓名");
    			return false;
    		}
    		if(sfzh==""){
    			alert("请输入身份证号");
    			return false;
    		}
    		var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
			if(reg.test(sfzh) == false){
				alert("对不起，您输入正确的身份证号!");//请将“字符串类型”要换成你要验证的那个属性名称！
				return;
			}
    		if(qzzl==""){
    			alert("请输入业务种类");
    			return false;
    		}
    		if(jjsy==""){
    			alert("请输入申请事由");
    			return false;
    		}
    		
    		
    	    if(xm!=""|xm!=null|sfzh!=""|sfzh!=null|qzzl!=""|qzzl!=null|jjsy!=""|jjsy!=null){
    			$.post(path+"/proscenium/crjjjywController/weixin/save.do",{"xm":xm,"sfzh":sfzh,"qzzl":qzzl,"jjsy":jjsy,"openid":openid},function(data){
    				alert("申请提交成功");
    				window.location.href="/jit_crj_wx/jsp/weixinjj/info_list.jsp"
    			})
    		} 
    	}
    	function jlClick(){
    		window.location.href="/jit_crj_wx/jsp/weixinjj/info_list.jsp"
    	}
    </script>
</head>
<body>
    <div class="aui-content" style="padding-bottom: 3rem;">
        <div class="aui-tab" id="tab">
            <div class="aui-tab-item aui-active">申请</div>
            <div class="aui-tab-item" onclick="jlClick()">历史申请记录</div>
        </div>
        <div class="aui-content aui-margin-b-15 aui-content-padded">
            <ul class="aui-list aui-form-list">
                <li class="aui-list-item">
                    <div class="aui-list-item-inner">
                        <div class="aui-list-item-label">姓名</div>
                        <div class="aui-list-item-input">
                            <input type="text" id="xm" value="" placeholder="请输入姓名" maxlength="10">
                        </div>
                    </div>
                </li>
                <li class="aui-list-item">
                    <div class="aui-list-item-inner">
                        <div class="aui-list-item-label">身份证号 </div>
                        <div class="aui-list-item-input">
                            <input type="text" id="sfzh" value="" placeholder="请输入身份证号" maxlength="18">
                        </div>
                    </div>
                </li>
                <li class="aui-list-item">
                    <div class="aui-list-item-inner">
                        <div class="aui-list-item-label">业务种类 </div>
                        <div class="aui-list-item-input">
                            <select id="qzzl">
							    <option value="">请选择</option>
							    <option value="出国奔丧,探望危重病人">出国奔丧,探望危重病人</option>
							    <option value="出国留学开学日期临近(不足1个月)">出国留学开学日期临近(不足1个月)</option>
							    <option value="前往国入境许可或签注有效期即将届满">前往国入境许可或签注有效期即将届满</option>
							    <option value="其他紧急事由">其他紧急事由</option>
							</select>
                        </div>
                    </div>
                </li>
                <li class="aui-list-item">
                    <div class="aui-list-item-inner">
                        <div class="aui-list-item-label">申请事由 </div>
                        <div class="aui-list-item-input">
                            <textarea placeholder="" id="jjsy" value=""></textarea>
                        </div>
                    </div>
                </li>
                <!-- <li>
                    <div class="aui-card-list" style="padding-bottom: 1rem;">
                        <div class="aui-card-list-header">
                           		 附件
                        </div>
                        <div class="aui-card-list-content" style="padding-left: 0.6rem; ">
                            <input type="file">
                        </div>
                    </div>
                </li> -->
            </ul>
        </div>
        <div class="aui-content-padded"  style="position: fixed; bottom: 0; left:0; width: 90%; ">
            <a href="#" onclick="clickFun()" class="aui-btn aui-btn-info aui-btn-block aui-btn-sm" >提交申请</a>
        </div>
    </div>
</body>
<script type="text/javascript" src="../../js/js/api.js" ></script>
</html>