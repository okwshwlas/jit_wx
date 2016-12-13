<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	String path = request.getContextPath();
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
	    var thisURL = document.URL;  
	    var  getval =thisURL.split('?')[1];
	    var showval= getval.split("=")[1];
    	
    	var path='<%=path%>';
	    $(document).ready(function(){
			$.ajax({
				cache:false,
				data:{
					'id':showval
				},
 				url: path+'/proscenium/crjjjywController/weixin/checktg.do',
 				success : function(data){
 					var html = template('test', JSON.parse(data));
 					document.getElementById('ryxx').innerHTML = html;
 					
 				},
 				error: function(XMLHttpRequest, textStatus, errorThrown){
 					alert("数据异常");
 				}
 			});
		})
		function clickFun(sfzh){
	    	window.location.href="/jit_crj_wx/jsp/weixinjj/info_list.jsp"
	    }
	    function sqClick(){
    		window.location.href="/jit_crj_wx/jsp/weixinjj/indexForm.jsp"
    	}
    </script>
</head>
<body>
    <div class="aui-content" id="ryxx">
    	<script id="test" type="text/html">
        	<div class="aui-tab" id="tab">
            	<div class="aui-tab-item"  onclick="sqClick()">申请</div>
            	<div class="aui-tab-item  aui-active">历史申请记录</div>
        	</div>
			{{if list.shjg == '1'}}
				<section class="aui-content-padded">
            	<div class="aui-card-list">
                	<div class="aui-card-list-header">
                                                                                       审核通过
                	</div>
                	<div class="aui-card-list-content-padded">
                                                                                  您在{{list.sqsj}}申请的{{list.qzzl}}已经通过审核，请点击拨打电话咨询。
                	</div>
                	<div class="aui-card-list-footer">
                             {{list.shsj}}
                	</div>
            	</div>
				<div class="aui-content-padded"  style="position: fixed; bottom: 0; left:0; width: 90%; ">
            		<a href="tel:{{list.crjdh}}" class="aui-btn aui-btn-info aui-btn-block aui-btn-sm">拨打电话</a>
        		</div>
        	</section>
			{{else if list.shjg == '0'}}
				<section class="">
        		<div class="aui-card-list aui-content-padded">
            		<div class="aui-card-list-header">
               			 审核未通过
            		</div>
            		<div class="aui-card-list-content-padded">
               	 		您在{{list.sqsj}}申请的{{list.qzzl}}未通过审核，对照审核意见重新提交申请。
            		</div>
            		<div class="aui-card-list-footer">
                		{{list.shsj}}
            		</div>
        		</div>
            	<div class="aui-card-list aui-content-padded">
                	<div class="aui-card-list-header">
                    	审核意见
                	</div>
                	<div class="aui-card-list-content-padded">
                    	未通过原因如下：{{list.shyj}}
                	</div>
            	</div>
    			</section>					
				<div class="aui-content-padded"  style="position: fixed; bottom: 0; left:0; width: 90%; ">
            		<div class="aui-btn aui-btn-block aui-btn-sm" onclick="clickFun('{{list.sfzh}}')">返回</div>
        		</div>
			{{else}}
                <section class="">
        		<div class="aui-card-list aui-content-padded">
            		<div class="aui-card-list-header">
               			 审核中，请耐心等待！
            		</div>
        		</div>
    			</section>					
				<div class="aui-content-padded"  style="position: fixed; bottom: 0; left:0; width: 90%; ">
            		<div class="aui-btn aui-btn-block aui-btn-sm" onclick="clickFun('{{list.sfzh}}')">返回</div>
        		</div>
			{{/if}}
	    </script>	
   </div>
</body>
<script type="text/javascript" src="../../js/js/api.js" ></script>
</html>