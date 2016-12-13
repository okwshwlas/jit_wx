<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="/WEB-INF/tld/c.tld" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String path = request.getContextPath();
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<%@ include file="/jsp/include_my_head.jsp" %>
<script type="text/javascript" src="<c:url value="/jsp/text/js/text.js" />"></script>
<script type="text/javascript">
var path= '<%=path%>';
</script>
</head>
<body>
<!-- 页面显示 -->
<div class="easyui-layout" fit="true"><!-- easyUI布局 -->
<div region="center" border="false" split="false"><!-- layout panel 属性设置-->
<table height="35px;" align="center">
	<tr>
		<td width="77" style="padding-left: 10px;"><input name="select1"
			id="querySelect" /></td>
		<td width="100" style="padding-left: 10px;"><input class="text"
			id="userName" type="text" disabled="disabled"/></td>
		<td valign="middle" style="padding-left: 10px;"><a href="#"
			id="querybtn">查询</a></td>
		<td>&nbsp;</td>
	</tr>
</table>
<table id="org">
	<!-- dataGrid 呈现 -->
</table>

</div>
</div>

<div id="showMessage" align="center" class="easyui-dialog" style="padding:5px;width:800px;height:300px;"  closed="true" buttons="#dlg-buttons" maximizable="true" minimizable="true" collapsible="true" resizable="true">

<form id="strform" name="strform" action="" method="post">
<input type="hidden" id="id" name="id">

<table cellpadding="0" cellspacing="0" class="table-input" border="0">
     
	<tr style="height: 30px">
		<th class="specalt" width="15%" align="right">关键词&nbsp;&nbsp;</th>
		<td align="left" width="85%">
		
		<input class="easyui-combobox" id="keyword" name="keywordId" style="width:200px;">
		</td>
	</tr>
	
	<tr style="height: 30px">
		<th class="specalt" align="right">自动回复内容&nbsp;&nbsp;</th>
		<td align="left">
		<textarea style="width: 80%;height: 130px" id="neirong" name="neirong" onKeyUp="CountStrByte('neirong',1000,'reman');"></textarea>
		
		<br><font color="red">必填, 用户添加您的时候自动回复语；超链接添加形式，如：< a href="http://www.baidu.com">百度< /a>
		<br><font color="red">您还可以输入<span id="reman">1000</span>字</font>
 </font>
		</td>
	</tr>
</table>

</form>
</div>
<div id="dlg-buttons">
     <a href="javascript:void(0)" class="easyui-linkbutton" onclick="saveWenben()" iconcls="icon-save">保存</a>
     <a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#showMessage').dialog('close')" iconcls="icon-cancel">取消</a>
</div>
<div id="addOrg" style="width:500px;height:300px;">
<ul id="tt">  

 		</ul>
</div>
</body>
</html>