<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="/WEB-INF/tld/c.tld" prefix="c"%>
<%@page import="java.util.List" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String path = request.getContextPath();
    String id = request.getParameter("id");
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title></title>
<%@ include file="/jsp/include_my_head.jsp" %>
<script charset="utf-8" src="<%=path%>/kindeditor-4.1.10-zh-CN/kindeditor.js"></script>
<script charset="utf-8" src="<%=path%>/kindeditor-4.1.10-zh-CN/lang/zh_CN.js"></script>
<script type="text/javascript" src="<c:url value="/jsp/imagetext/js/imagetext_edit.js" />"></script>
<link type="text/css" rel="stylesheet" href="<%=path%>/jsp/publicaccounts/css/tablecss_nocoler.css" />
<script type="text/javascript">
	var path='<%=path%>';
	var id='<%=id%>';
</script>
<script>
KindEditor.ready(function(K) {

    editor1 = K.create('#editor_id', { 
	   	cssPath :  path+'/kindeditor-4.1.10-zh-CN/plugins/code/prettify.css',//引入图片上传和图片空间所需css和jsp
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

<!-- <p class=MsoNormal style='text-indent:260.65pt'><b><div align="center"><span style='font-size:16.0pt;
font-family:宋体'>市级权限申请</span></div></b></p>
<p class=MsoNormal ><b><span style='font-size:14.0pt;
font-family:宋体'>人员基本信息</span></b></p> -->
<div id="open_show" class="easyui-window" closed="true"></div>

<form id="fm" name="fm" enctype="multipart/form-data" method="post">
<input type="hidden" id="id" name="id">
<input type="hidden" id="url" name="url">
<input type="hidden" id="parent_id" name="parent_id" value="0">
<table cellpadding="0" cellspacing="0" class="table-input" border="0">
     <tr>
         <th colspan="4" align="center" class="first" style="text-align:left">自动回复内容</th>
 	 </tr>
 	 
 	 
 	 <tr>
		<th class="specalt">关键词</th>
		<td align="left">
		
		<input class="easyui-combobox" id="keyword" name="keywordId" style="width:306px;">
		
		</td>
	</tr>
 	 
	<tr>
		<th class="specalt">标题</th>
		<td><input type="text" id="title" name="title" style="width:300px;"/></td>
	</tr>
	<tr>
		<th class="specalt">链接地址</th>
		<td><input type="text" id="link" name="link" style="width:300px;"/>
			<div><font color="red">"链接地址"应以http://开头，如http://www.baidu.com。"链接地址"和"图文详细内容"至少填写一项.即会选择填写的这一项作为链接，如果都填写优先选择"链接地址"作为链接</font></div>
		</td>
	</tr>
	<tr>
		<th class="specalt">图文封面</th>
		<td><input type="file" name="file" id="file" runat="server" size="40" onchange="uploadImage()"><font color="red">*建议大小640*320,支持jpg,png</font><img id="img"  style="visibility: hidden"></td>
	
	</tr>
	<tr>
		<th class="specalt">简介</th>
		<td>
		<textarea cols="111" rows="7"  id="miaoshu" name="miaoshu"  onKeyUp="CountStrByte('miaoshu',500,'reman');"></textarea>
		<div><font color="red">您还可以输入<span id="reman">500</span>字</font></div>
		</td>
	</tr>
	
	<tr>
		<th class="specalt">图文详细页内容</th>
		
		<td colspan="3">
		
	    <textarea id="editor_id" name="neirong" style="width:800px;height:300px;" >
         </textarea>
	    </td>
	</tr>
	
	<tr>
		<th class="specalt">多图文</th>
		<td>
		<a href="javascript:void(0)"id="savelist" onclick="OpenFrame()">添加</a> 
		<a href="javascript:void(0)" id="savelist1" onclick="saveparent()">保存</a>
		</td>
	</tr>
	<tr>
	<table cellpadding="0" cellspacing="0" class="table-input" border="0" id="tab">
	<tr>
            <td width="20%" align="center">序号</td>
            <td align="center">标题</td>
            <td align="center">操作</td>
       </tr>
	</table>
	<!--<input type="file" name="upload" id="upload"  class="easyui-validatebox" validType="fileType['BMP|GIF|JPG|JPEG|ICO|PNG|TIF']" required="true" invalidMessage="请选择(BMP|GIF|JPG|JPEG|ICO|PNG|TIF)等格式的图片"/>
	-->
	</tr>
	
</table>
<div id="addOrg" style="width:500px;height:300px;">
<ul id="tt">  

 		</ul>
</div>
</form>



<div id="showMessage" align="center"  class="easyui-dialog" closed="true" style="padding:5px;width:900px;height:400px;"  buttons="#dlg-buttons" maximizable="true" minimizable="true" collapsible="true" resizable="true">

<form id="strform" name="strform" action="" method="post" enctype="multipart/form-data">
<input type="hidden" id="id2" name="id">
<input type="hidden" id="url2" name="url">
<input type="hidden" id="parent_id2" name="parent_id">
<table cellpadding="0" cellspacing="0" class="table-input" border="0">
     
	<tr>
		<th class="specalt">标题</th>
		<td align="left"><input type="text" id="title2" name="title" class="easyui-validatebox" /></td>
	</tr>
	<!--<tr>
		<th class="specalt">排序ID</th>
		<td align="left"><input type="text" id="paixuid2" name="paixuid" /></td>
	</tr>
	--><tr>
		<th class="specalt">图文封面</th>
		<td align="left"><input type="file" name="file" id="file2"  onchange="uploadImage2()"><font color="red">*建议大小80*80,支持jpg,png</font><img id="img2"  style="visibility: hidden"></td>
	
	</tr>
	<!--<tr>
		<th class="specalt">简介</th>
		<td align="left">
		<textarea cols="60" rows="5"  id="miaoshu2" name="miaoshu" ></textarea>
		</td>
	</tr>
	
	--><tr>
		<th class="specalt">图文详细页内容</th>
		
		<td colspan="5">
		
	    <textarea id="child_editor_id" name="neirong" style="width:800px;height:400px;">
         </textarea>
	    </td>
	</tr>
	<tr>
		<td colspan="5" align="center">
			<a href="javascript:savechild()"id="savelist2">保存</a> 
			<input type="button" onclick="savechild()" value="保存"/>
			<a href="javascript:cancel()" id="cancellist2">取消</a>
		</td>
	</tr>
</table>
<div id="addOrg" style="width:500px;height:300px;">
<ul id="tt">  

 		</ul>
</div>
</form>
</div>
<!-- 子图文列表 -->
<div id="showChild" align="center"  class="easyui-dialog" closed="true" style="padding:5px;width:900px;height:400px;"  buttons="#dlg-buttons" maximizable="true" minimizable="true" collapsible="true" resizable="true">
	<iframe id="if1" name="if1" src='' width="100%" height="100%" frameborder="0"></iframe>
</div>
<!-- 子图文列表中新增图文的弹窗 -->
<div id="showList" align="center"  class="easyui-dialog" closed="true" style="padding:5px;width:900px;height:400px;"  buttons="#dlg-buttons" maximizable="true" minimizable="true" collapsible="true" resizable="true">
	<iframe id="if2" name="if2" src='' width="100%" height="100%" frameborder="0"></iframe>
</div>
</body>
</html>