<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="/WEB-INF/tld/c.tld" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	String path = request.getContextPath();
	/* String sfzh = request.getParameter("sfzh"); */
	String openId = "123123";
%>
    <meta charset="utf-8">
    <meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
    <meta name="format-detection" content="telephone=no,email=no,date=no,address=no">
    <title>绿色通道</title>
    <script type="text/javascript" src="../../js/jquery.1.8.2.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../../css/css/aui.2.0.css" />
    <script type="text/javascript" src="../../js/js/comment.js"></script>
	<script type="text/javascript" src="../../js/js/dist/template.js"></script>
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
    	var path='<%=path%>';
	    $(document).ready(function(){
	    	var openId = '<%=openId%>';
			$.ajax({
				cache:false,
				data:{
					'openId':openId
				},
 				url: path+'/proscenium/crjjjywController/weixin/checkAll.do',
 				success : function(data){
 					var html = template('test', JSON.parse(data));
 					document.getElementById('ryxx').innerHTML = html;
 					
 				},
 				error: function(XMLHttpRequest, textStatus, errorThrown){
 					alert("数据异常");
 				}
 			});
		})	
		function clickFun(id){
	    	window.location.href="/jit_crj_wx/jsp/weixinjj/info_defail.jsp?id="+id
	    }
	    function sqClick(){
    		window.location.href="/jit_crj_wx/jsp/weixinjj/indexForm.jsp"
    	}
    </script>
</head>
<body>
    <div class="aui-content" style="padding-bottom: 3rem;">
        <div class="aui-tab" id="tab">
            <div class="aui-tab-item"  onclick="sqClick()">申请</div>
            <div class="aui-tab-item  aui-active">历史申请记录</div>
        </div>
        <div class="aui-content aui-margin-b-15 aui-content-padded">
            <ul id="ryxx" class="aui-list aui-media-list">
            </ul>
            <script id="test" type="text/html">
					{{each list as value i}}
        				<li class="aui-list-item aui-list-item-arrow" onclick="clickFun('{{value.id}}')">
							<div class="aui-media-list-item-inner">
								<div class="aui-list-item-inner">
									<div class="aui-list-item-text">
										<div class="aui-list-item-title">{{value.qzzl}}</div>
										<div class="aui-list-item-right">{{value.sqsj}}</div>
									</div>
									<div class="aui-list-item-text aui-ellipsis-2">
										{{if value.shjg == '1'}}
											<div class="aui-label aui-label-primary">审核通过</div>
										{{else if value.shjg == '0'}}
                                			<div class="aui-label">审核未通过</div>
										{{else}}
                                			<div class="aui-label aui-label-info">审核中</div>
										{{/if}}
									</div>
								</div>
							</div>
						</li>
    				{{/each}}
				</script>
        </div>

    </div>
</body>
<script type="text/javascript" src="../../js/js/api.js" ></script>
</html>