<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="/WEB-INF/tld/c.tld" prefix="c"%>
<%@page import="java.util.List" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String path = request.getContextPath();
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title></title>
<%@ include file="/jsp/include_my_head.jsp" %>
<script type="text/javascript" src="<c:url value="/jsp/imagetext/js/imagetext_dialog.js" />"></script>
<link type="text/css" rel="stylesheet" href="<%=path%>/jsp/publicaccounts/css/tablecss_nocoler.css" />
<script type="text/javascript">
	var path='<%=path%>';
</script>
<link rel="stylesheet" href="<%=path%>/kindeditor-4.1.10-zh-CN/themes/default/default.css" />
<link rel="stylesheet" href="<%=path%>/kindeditor-4.1.10-zh-CN/plugins/code/prettify.css" />
<script charset="utf-8" src="<%=path%>/kindeditor-4.1.10-zh-CN/kindeditor.js"></script>
<script charset="utf-8" src="<%=path%>/kindeditor-4.1.10-zh-CN/lang/zh_CN.js"></script>
<script charset="utf-8" src="<%=path%>/kindeditor-4.1.10-zh-CN/plugins/code/prettify.js"></script>
<script>
KindEditor.ready(function(K) {

    editor1 = K.create('#editor_id', {
    	cssPath : path+'/kindeditor-4.1.10-zh-CN/plugins/code/prettify.css',//引入图片上传和图片空间所需css和jsp
		uploadJson : path+'/kindeditor-4.1.10-zh-CN/jsp/upload_json.jsp',
		fileManagerJson : path+'/kindeditor-4.1.10-zh-CN/jsp/file_manager_json.jsp',
		allowFileManager : true,
      
       afterCreate : function() { 
        this.sync(); 
       }, 
       afterBlur:function(){ 
           this.sync(); 
       }                 
   });

    editor2 = K.create('#child_editor_id', { 
        afterCreate : function() { 
         this.sync(); 
        }, 
        afterBlur:function(){ 
            this.sync(); 
        }                 
    });

});
    
</script>
</head>
<body>
<!-- 页面显示 -->
<div class="easyui-layout" fit="true"><!-- easyUI布局 -->
<div region="center" border="false" split="false"><!-- layout panel 属性设置-->
<div id="open_show" class="easyui-window" closed="true"></div>

<form id="fm" name="fm" enctype="multipart/form-data" method="post">
<input type="hidden" id="id" name="id">
<input type="hidden" id="url" name="url">
<input type="hidden" id="parent_id" name="parent_id" value="0">
<table cellpadding="0" cellspacing="0" class="table-input" border="0">
 	 <tr>
		<th class="specalt">关键词</th>
		<td align="left">
		
		<input class="easyui-combobox" id="keyword" name="keywordId" style="width:200px;">
		
		</td>
	</tr>
 	 
	<tr>
		<th class="specalt">标题</th>
		<td><input type="text" id="title" name="title" size="65" maxlength="25"/></td>
	</tr>
	<tr>
		<th class="specalt">图文封面</th>
		<td><input type="file" name="file" id="file" runat="server" size="40" onchange="uploadImage()"><font color="red">*建议大小640*320,支持jpg,png</font><img id="img"  style="visibility: hidden"></td>
	
	</tr>
	<tr>
		<th class="specalt">简介</th>
		<td colspan="3">
		<textarea style="width:650px;height:100px;"  id="miaoshu" name="miaoshu"  onKeyUp="CountStrByte('miaoshu',500,'reman');"></textarea>
		<div><font color="red">您还可以输入<span id="reman">500</span>字</font></div>
		</td>
	</tr>
	
	<tr>
		<th class="specalt">图文详细页内容</th>
		
		<td colspan="3">
		
	    <textarea id="editor_id" name="neirong" style="width:610px;height:200px;" >
         </textarea>
	    </td>
	</tr>
	
	<tr>
		<th class="specalt">多图文</th>
		<td>
		<a href="javascript:void(0)" id="savelist1" onclick="saveparent()">保存</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:parent.closeDialog()" iconcls="icon-cancel">关闭</a>
		</td>
	</tr>
	
</table>
</form>
</body>
</html>